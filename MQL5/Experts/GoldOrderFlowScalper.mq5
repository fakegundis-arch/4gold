//+------------------------------------------------------------------+
//|                                      GoldOrderFlowScalper.mq5     |
//|                  Order-flow scalping EA for XAUUSD (Exness)       |
//|                                                                  |
//|  Reads tick-based order flow (no real DOM exists for OTC gold):  |
//|    - tick velocity      (activity / aggression)                  |
//|    - bid/ask imbalance  (buy vs sell pressure, cumulative delta)  |
//|    - spread state       (trade filter)                           |
//|    - short-term momentum                                         |
//|                                                                  |
//|  Safety: DEMO-only by default and trading OFF by default, so the  |
//|  first milestone is to VISUALIZE the order-flow edge on a live    |
//|  demo chart before any orders are sent.                          |
//+------------------------------------------------------------------+
#property copyright "4gold"
#property version   "0.10"
#property description "Order-flow scalping EA for gold (XAUUSD) on Exness."
#property description "Demo-only by default; visualizes velocity, delta, spread & signal."
#property strict

#include <Trade/Trade.mqh>

//==================================================================
//  Inputs
//==================================================================
input group "=== Safety ==="
input bool   InpDemoOnly         = true;    // Refuse to TRADE on a LIVE account
input bool   InpEnableTrading    = true;   // false = visualize/collect only (no orders)

input group "=== Test ==="
input bool   InpTestTradeOnStart = true;   // Open ONE trade immediately on start (pipeline check)
input bool   InpTestTradeIsBuy   = true;    // Test trade direction: true=BUY, false=SELL

input group "=== Order Flow ==="
input int    InpWindowSeconds    = 10;      // Rolling window length (seconds)
input int    InpVelocityTrigger  = 40;      // Min ticks in window to allow a signal
input double InpImbalanceTrigger = 0.60;    // Buy(or sell) share needed for direction (0.5-1.0)
input int    InpMomentumPips    = 5;       // Min price move (pips) over window to confirm

input group "=== Trade Filters ==="
input double InpMaxSpreadPips    = 5;       // Skip trading when spread (pips) > this (resting ~2.6 pip)
input bool   InpUseSessionFilter = true;    // Avoid thin / rollover hours
input int    InpBlockFromHour    = 22;      // Server-time hour to STOP trading (inclusive)
input int    InpBlockToHour      = 1;       // Server-time hour to RESUME trading

input group "=== Position ==="
input double InpLots             = 0.01;    // Fixed lot size
input int    InpStopLossPips     = 30;      // Stop loss (pips; gold 1 pip = $0.10 -> $3.00 @ 0.01 lot)
input int    InpTakeProfitPips   = 90;      // Take profit (pips; gold 1 pip = $0.10 -> $5.00 @ 0.01 lot)
input int    InpMaxPositions     = 1;       // Max simultaneous positions from this EA
input bool   InpReverseOnSignal  = true;   // Close current position & flip on an opposite signal
input ulong  InpMagic            = 4000777; // Magic number

input group "=== Dashboard ==="
input bool   InpShowPanel        = true;    // Show on-chart dashboard
input bool   InpShowArrows       = true;    // Draw arrows when a signal fires
input int    InpPanelX           = 14;      // Panel X (px from left)
input int    InpPanelY           = 26;      // Panel Y (px from top)

input group "=== Telegram ==="
input bool   InpUseTelegram      = true;   // Send alerts to Telegram (needs allowed URL, see README)
input string InpTgToken          = "8473960554:AAFLG_7ATp8ufXGwO6_2n4pbm-ueFwToP1I";      // Bot token from @BotFather
input string InpTgChatId         = "5000775770";      // Chat / channel id (e.g. 123456789 or -100...)
input string InpTgPrefix         = "[4gold] "; // Prefix on every message
input bool   InpTgOnStart        = true;    // Notify when EA starts
input bool   InpTgOnSignal       = true;    // Notify on each new signal
input bool   InpTgOnTrade        = true;    // Notify on trade open / failure
input bool   InpTgOnSkip         = true;    // Notify WHY a setup was not traded
input int    InpTgMinIntervalSec = 30;      // Min seconds between signal alerts (anti-spam)
input int    InpTgSkipMinIntervalSec = 60;  // Min seconds between skip-reason alerts (anti-spam)

input group "=== Flow Surge Alert ==="
input bool   InpTgOnSurge        = true;    // Telegram alert when volatility/flow surges (even if no trade)
input int    InpSurgeVelocity    = 45;      // Surge if ticks in window >= this
input double InpSurgeMomentumPips = 8;      // ...or abs momentum (pips) over window >= this
input int    InpSurgeMinIntervalSec = 60;   // Min seconds between surge alerts (anti-spam)

//==================================================================
//  Globals
//==================================================================
CTrade   g_trade;

struct TickRec
{
   ulong  t;       // arrival time (ms, GetTickCount64)
   double price;   // mid price
   int    dir;     // +1 up, -1 down, 0 flat
};

TickRec  g_ticks[];
double   g_prevMid    = 0.0;
double   g_cumDelta   = 0.0;     // cumulative delta since (re)init, in ticks
double   g_avgSpread  = 0.0;     // EMA of spread (points)
int      g_lastSignal = 0;       // last emitted signal direction
bool     g_tradeBlock = false;   // hard block (live account while DemoOnly)
datetime g_lastTgSignal = 0;     // throttle for Telegram signal alerts
datetime g_lastTgSurge  = 0;     // throttle for Telegram flow-surge alerts
datetime g_lastTgSkip   = 0;     // throttle for Telegram skip-reason alerts

const string PFX = "GOFS_";      // chart-object prefix

//==================================================================
//  Init / Deinit
//==================================================================
int OnInit()
{
   g_tradeBlock = false;

   if(InpDemoOnly &&
      (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE) != ACCOUNT_TRADE_MODE_DEMO)
   {
      g_tradeBlock = true;
      Print("SAFETY: InpDemoOnly=true and this is NOT a demo account -> trading is HARD-BLOCKED. Visualization only.");
   }

   g_trade.SetExpertMagicNumber(InpMagic);
   g_trade.SetDeviationInPoints(20);
   g_trade.SetTypeFillingBySymbol(_Symbol);

   ArrayResize(g_ticks, 0);
   g_prevMid    = 0.0;
   g_cumDelta   = 0.0;
   g_avgSpread  = 0.0;
   g_lastSignal = 0;

   if(InpShowPanel)
      CreatePanel();

   // Symbol diagnostics - helps size SL/TP correctly for this gold contract.
   MqlTick dtk; SymbolInfoTick(_Symbol, dtk);
   PrintFormat("Symbol specs: digits=%d point=%g 1pip=%dpts(%g) stopsLevel=%d freezeLevel=%d spread=%.0f pts",
               (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS), _Point,
               (int)PipInPoints(), PipInPoints() * _Point,
               (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL),
               (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL),
               (dtk.ask - dtk.bid) / _Point);

   PrintFormat("GoldOrderFlowScalper started on %s | mode=%s | trading=%s",
               _Symbol,
               (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO ? "DEMO":"LIVE",
               (InpEnableTrading && !g_tradeBlock) ? "ENABLED":"OFF");

   if(InpTgOnStart)
   {
      bool isDemo = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO;
      double specSpreadPip = ((dtk.ask - dtk.bid) / _Point) / (double)PipInPoints();
      SendTelegram(StringFormat("started on %s (%s)\nTrading: %s\nSpecs: digits=%d  1pip=%dpts  stopsLevel=%dpts  spread=%.1f pip",
                   _Symbol, isDemo ? "DEMO":"LIVE",
                   (InpEnableTrading && !g_tradeBlock) ? "ENABLED":"OFF",
                   (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS), (int)PipInPoints(),
                   (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL), specSpreadPip));
   }

   if(InpTestTradeOnStart)
   {
      Print("TEST: opening a startup test trade to verify the execution pipeline.");
      SendTelegram("TEST trade on start -> " + (string)(InpTestTradeIsBuy ? "BUY" : "SELL"));
      ExecuteMarket(InpTestTradeIsBuy ? 1 : -1, "TEST");
   }
   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
   ObjectsDeleteAll(0, PFX);
   ChartRedraw(0);
}

//==================================================================
//  Tick handler
//==================================================================
void OnTick()
{
   MqlTick tk;
   if(!SymbolInfoTick(_Symbol, tk))
      return;

   double mid       = (tk.bid + tk.ask) * 0.5;
   double spreadPts = (tk.ask - tk.bid) / _Point;

   // EMA of spread (smoothing factor ~0.05)
   g_avgSpread = (g_avgSpread <= 0.0) ? spreadPts : g_avgSpread + 0.05 * (spreadPts - g_avgSpread);

   PushTick(mid);

   // --- window statistics ---
   int    velocity = 0;
   int    buys = 0, sells = 0;
   double oldestPrice = mid;
   ComputeWindow(velocity, buys, sells, oldestPrice);

   int    directional = buys + sells;
   double buyShare    = directional > 0 ? (double)buys  / directional : 0.5;
   double sellShare   = directional > 0 ? (double)sells / directional : 0.5;
   double windowDelta = (double)(buys - sells);
   double momentumPts = (mid - oldestPrice) / _Point;

   // --- signal ---
   int signal = BuildSignal(velocity, buyShare, sellShare, momentumPts, spreadPts);

   // Directional intent ignoring the velocity/spread gates - used to explain
   // why an otherwise-valid setup was skipped at the signal stage.
   double momPipNow = momentumPts / (double)PipInPoints();
   double momTrig   = InpMomentumPips;
   int    rawDir    = 0;
   if(buyShare  >= InpImbalanceTrigger && momPipNow >=  momTrig) rawDir =  1;
   if(sellShare >= InpImbalanceTrigger && momPipNow <= -momTrig) rawDir = -1;

   string skipReason = "";

   // --- act / draw ---
   if(signal != 0 && signal != g_lastSignal)
   {
      if(InpShowArrows)
         DrawSignalArrow(signal, mid);

      if(InpTgOnSignal && (TimeCurrent() - g_lastTgSignal) >= InpTgMinIntervalSec)
      {
         SendTelegram(StringFormat("%s %s @ %s\nvel %d  delta %+.0f (buy %.0f%%)  mom %+.1f pip  spr %.1f pip",
                      signal > 0 ? "LONG" : "SHORT", _Symbol,
                      DoubleToString(mid, _Digits),
                      velocity, windowDelta, buyShare * 100.0,
                      momPipNow, spreadPts / (double)PipInPoints()));
         g_lastTgSignal = TimeCurrent();
      }

      skipReason = TryTrade(signal, tk);   // "" if a trade was attempted
      g_lastSignal = signal;
   }
   else if(signal == 0)
   {
      g_lastSignal = 0;
      // A directional setup existed but a signal-stage gate blocked it.
      if(rawDir != 0)
      {
         double spreadPip = spreadPts / (double)PipInPoints();
         if(velocity < InpVelocityTrigger)
            skipReason = StringFormat("low velocity %d < %d (thin flow)", velocity, InpVelocityTrigger);
         else if(spreadPip > InpMaxSpreadPips)
            skipReason = StringFormat("spread %.1f pip > max %.1f pip", spreadPip, InpMaxSpreadPips);
      }
   }

   if(skipReason != "" && InpTgOnSkip && (TimeCurrent() - g_lastTgSkip) >= InpTgSkipMinIntervalSec)
   {
      SendTelegram(StringFormat("SKIPPED %s %s @ %s\nreason: %s",
                   rawDir > 0 ? "LONG" : (rawDir < 0 ? "SHORT" : "setup"), _Symbol,
                   DoubleToString(mid, _Digits), skipReason));
      g_lastTgSkip = TimeCurrent();
   }

   // --- flow-surge alert (fires on volatility/activity even if no trade) ---
   double momPip = momentumPts / (double)PipInPoints();
   bool   surge  = (velocity >= InpSurgeVelocity) || (MathAbs(momPip) >= InpSurgeMomentumPips);
   if(InpTgOnSurge && surge && (TimeCurrent() - g_lastTgSurge) >= InpSurgeMinIntervalSec)
   {
      SendTelegram(StringFormat("FLOW SURGE %s @ %s\nvel %d  mom %+.1f pip  delta %+.0f (buy %.0f%%)  spr %.1f pip",
                   _Symbol, DoubleToString(mid, _Digits),
                   velocity, momPip, windowDelta, buyShare * 100.0,
                   spreadPts / (double)PipInPoints()));
      g_lastTgSurge = TimeCurrent();
   }

   if(InpShowPanel)
      UpdatePanel(spreadPts, velocity, windowDelta, momentumPts, buyShare, signal);
}

//==================================================================
//  Order-flow helpers
//==================================================================
void PushTick(const double mid)
{
   int dir = 0;
   if(g_prevMid > 0.0)
   {
      if(mid > g_prevMid)      dir =  1;
      else if(mid < g_prevMid) dir = -1;
   }
   g_prevMid = mid;
   g_cumDelta += dir;

   int n = ArraySize(g_ticks);
   ArrayResize(g_ticks, n + 1);
   g_ticks[n].t     = GetTickCount64();
   g_ticks[n].price = mid;
   g_ticks[n].dir   = dir;

   // prune everything older than the window
   ulong cutoff = GetTickCount64() - (ulong)InpWindowSeconds * 1000;
   int firstKeep = 0;
   for(int i = 0; i < ArraySize(g_ticks); i++)
   {
      if(g_ticks[i].t >= cutoff) { firstKeep = i; break; }
      firstKeep = i + 1;
   }
   if(firstKeep > 0)
   {
      int remaining = ArraySize(g_ticks) - firstKeep;
      if(remaining > 0)
         ArrayCopy(g_ticks, g_ticks, 0, firstKeep, remaining);
      ArrayResize(g_ticks, MathMax(remaining, 0));
   }
}

void ComputeWindow(int &velocity, int &buys, int &sells, double &oldestPrice)
{
   int n = ArraySize(g_ticks);
   velocity = n;
   buys = 0; sells = 0;
   for(int i = 0; i < n; i++)
   {
      if(g_ticks[i].dir > 0)      buys++;
      else if(g_ticks[i].dir < 0) sells++;
   }
   if(n > 0)
      oldestPrice = g_ticks[0].price;
}

// returns +1 long, -1 short, 0 none
int BuildSignal(const int velocity, const double buyShare, const double sellShare,
                const double momentumPts, const double spreadPts)
{
   double maxSpreadPts = InpMaxSpreadPips * (double)PipInPoints();
   double momTrigPts   = InpMomentumPips  * (double)PipInPoints();

   if(velocity < InpVelocityTrigger)  return 0;   // too quiet
   if(spreadPts > maxSpreadPts)       return 0;   // too expensive

   if(buyShare  >= InpImbalanceTrigger && momentumPts >=  momTrigPts) return  1;
   if(sellShare >= InpImbalanceTrigger && momentumPts <= -momTrigPts) return -1;
   return 0;
}

//==================================================================
//  Trading
//==================================================================
// Returns "" if a trade was attempted, otherwise the reason it was skipped.
string TryTrade(const int signal, const MqlTick &tk)
{
   if(!InpEnableTrading) return "trading is OFF (InpEnableTrading=false)";
   if(g_tradeBlock)      return "hard-blocked: live account while InpDemoOnly=true";
   if(InBlockedSession())
      return StringFormat("session filter active (block %02d:00-%02d:00 server)",
                          InpBlockFromHour, InpBlockToHour);

   int curDir = MyPositionDir();
   if(curDir != 0)
   {
      if(curDir == signal)
         return "already in a position in the same direction";
      // Opposite signal vs an open position.
      if(!InpReverseOnSignal)
         return "opposite position open (InpReverseOnSignal=false)";

      // Close current, then flip.
      if(!CloseMyPositions())
         return "reverse aborted: failed to close current position";
      if(InpTgOnTrade)
         SendTelegram(StringFormat("REVERSE %s: closed %s, opening %s",
                      _Symbol, curDir > 0 ? "LONG" : "SHORT", signal > 0 ? "LONG" : "SHORT"));
   }

   if(CountMyPositions() >= InpMaxPositions)
      return StringFormat("already at max positions (%d)", InpMaxPositions);

   ExecuteMarket(signal, "OF");   // sends its own success / failure alert
   return "";
}

// Direction of my open position on this symbol: +1 long, -1 short, 0 none.
int MyPositionDir()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket == 0) continue;
      if(PositionGetString(POSITION_SYMBOL) == _Symbol &&
         (ulong)PositionGetInteger(POSITION_MAGIC) == InpMagic)
         return (PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY) ? 1 : -1;
   }
   return 0;
}

// Closes all of this EA's positions on the symbol. Returns true if all closed.
bool CloseMyPositions()
{
   bool ok = true;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket == 0) continue;
      if(PositionGetString(POSITION_SYMBOL) == _Symbol &&
         (ulong)PositionGetInteger(POSITION_MAGIC) == InpMagic)
      {
         if(!g_trade.PositionClose(ticket))
         {
            ok = false;
            PrintFormat("Close failed ticket=%I64u: %s", ticket, g_trade.ResultRetcodeDescription());
         }
      }
   }
   return ok;
}

// How many broker points make 1 pip for this symbol.
// Gold: 1 pip = $0.10  -> 2-digit feed = 10 points, 3-digit feed = 100 points.
// Also handles standard 4/5-digit FX as a fallback.
long PipInPoints()
{
   int digits = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   switch(digits)
   {
      case 2: return 10;    // XAUUSD 2-digit
      case 3: return 100;   // XAUUSD 3-digit (and JPY pairs map similarly)
      case 4: return 1;     // 4-digit FX
      case 5: return 10;    // 5-digit FX (fractional pip)
      default: return 10;
   }
}

// Places a market order in the given direction. Honors the demo-only guard
// but NOT the strategy filters, so it can be reused for the startup test trade.
// Returns true on a successful send.
bool ExecuteMarket(const int signal, const string tag)
{
   if(g_tradeBlock)
   {
      Print("ExecuteMarket: trade hard-blocked (live account while DemoOnly) - skipped.");
      return false;
   }

   MqlTick tk;
   if(!SymbolInfoTick(_Symbol, tk)) return false;

   double point = _Point;
   double sl, tp, price;

   // Respect the broker's minimum stop distance. Gold "points" are small
   // (2-digit XAUUSDm -> 1 pt = $0.01), so a tight SL can fall inside the
   // broker's stops/freeze level and get rejected as "invalid stops".
   long  stopsLvl  = (long)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);
   long  freezeLvl = (long)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_FREEZE_LEVEL);
   long  minLvl    = (stopsLvl > freezeLvl ? stopsLvl : freezeLvl);
   long  spreadPts = (long)MathRound((tk.ask - tk.bid) / point);
   // SL sits across the spread from entry, so it must clear minLvl + spread.
   long  slBuffer  = minLvl + spreadPts + 10;
   long  tpBuffer  = minLvl + 10;
   // Inputs are in pips; convert to broker points for the order request.
   long  pip       = PipInPoints();
   long  slReqPts  = (InpStopLossPips   > 0) ? InpStopLossPips   * pip : 0;
   long  tpReqPts  = (InpTakeProfitPips > 0) ? InpTakeProfitPips * pip : 0;
   long  slPts     = (slReqPts > 0) ? (long)MathMax(slReqPts, slBuffer) : 0;
   long  tpPts     = (tpReqPts > 0) ? (long)MathMax(tpReqPts, tpBuffer) : 0;

   if(slPts != slReqPts || tpPts != tpReqPts)
      PrintFormat("Stops adjusted to broker minimum (stopsLevel=%d, spread=%d): SL %d->%d, TP %d->%d pts",
                  stopsLvl, (int)spreadPts, (int)slReqPts, (int)slPts, (int)tpReqPts, (int)tpPts);

   if(signal > 0)
   {
      price = NormalizeDouble(tk.ask, _Digits);
      sl = (slPts > 0) ? NormalizeDouble(price - slPts * point, _Digits) : 0.0;
      tp = (tpPts > 0) ? NormalizeDouble(price + tpPts * point, _Digits) : 0.0;
      if(g_trade.Buy(InpLots, _Symbol, price, sl, tp, tag + " long"))
      {
         NotifyTrade("BUY", InpLots, price, sl, tp, true, "");
         return true;
      }
      PrintFormat("Buy failed: retcode=%d %s", g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
      NotifyTrade("BUY", InpLots, price, sl, tp, false, g_trade.ResultRetcodeDescription());
   }
   else if(signal < 0)
   {
      price = NormalizeDouble(tk.bid, _Digits);
      sl = (slPts > 0) ? NormalizeDouble(price + slPts * point, _Digits) : 0.0;
      tp = (tpPts > 0) ? NormalizeDouble(price - tpPts * point, _Digits) : 0.0;
      if(g_trade.Sell(InpLots, _Symbol, price, sl, tp, tag + " short"))
      {
         NotifyTrade("SELL", InpLots, price, sl, tp, true, "");
         return true;
      }
      PrintFormat("Sell failed: retcode=%d %s", g_trade.ResultRetcode(), g_trade.ResultRetcodeDescription());
      NotifyTrade("SELL", InpLots, price, sl, tp, false, g_trade.ResultRetcodeDescription());
   }
   return false;
}

void NotifyTrade(const string side, const double lots, const double price,
                 const double sl, const double tp, const bool ok, const string err)
{
   if(!InpTgOnTrade) return;
   if(ok)
      SendTelegram(StringFormat("%s %.2f %s @ %s  SL %s  TP %s",
                   side, lots, _Symbol, DoubleToString(price, _Digits),
                   DoubleToString(sl, _Digits), DoubleToString(tp, _Digits)));
   else
      SendTelegram(StringFormat("%s %s FAILED: %s", side, _Symbol, err));
}

int CountMyPositions()
{
   int count = 0;
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket == 0) continue;
      if(PositionGetString(POSITION_SYMBOL) == _Symbol &&
         (ulong)PositionGetInteger(POSITION_MAGIC) == InpMagic)
         count++;
   }
   return count;
}

bool InBlockedSession()
{
   if(!InpUseSessionFilter) return false;
   MqlDateTime dt;
   TimeToStruct(TimeCurrent(), dt);
   int h = dt.hour, from = InpBlockFromHour, to = InpBlockToHour;
   if(from == to) return false;
   if(from < to)  return (h >= from && h < to);
   return (h >= from || h < to);   // wraps midnight (e.g. 22 -> 1)
}

//==================================================================
//  Visualization
//==================================================================
void DrawSignalArrow(const int signal, const double price)
{
   string name = PFX + "arr_" + (string)TimeCurrent() + "_" + (string)GetTickCount();
   ObjectCreate(0, name, OBJ_ARROW, 0, TimeCurrent(), price);
   ObjectSetInteger(0, name, OBJPROP_ARROWCODE, signal > 0 ? 233 : 234);
   ObjectSetInteger(0, name, OBJPROP_COLOR, signal > 0 ? clrLime : clrRed);
   ObjectSetInteger(0, name, OBJPROP_WIDTH, 2);
   ObjectSetInteger(0, name, OBJPROP_ANCHOR, signal > 0 ? ANCHOR_TOP : ANCHOR_BOTTOM);
}

void CreatePanel()
{
   string bg = PFX + "BG";
   if(ObjectFind(0, bg) < 0)
   {
      ObjectCreate(0, bg, OBJ_RECTANGLE_LABEL, 0, 0, 0);
      ObjectSetInteger(0, bg, OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, bg, OBJPROP_XDISTANCE, InpPanelX - 8);
      ObjectSetInteger(0, bg, OBJPROP_YDISTANCE, InpPanelY - 8);
      ObjectSetInteger(0, bg, OBJPROP_XSIZE, 250);
      ObjectSetInteger(0, bg, OBJPROP_YSIZE, 196);
      ObjectSetInteger(0, bg, OBJPROP_BGCOLOR, C'20,24,30');
      ObjectSetInteger(0, bg, OBJPROP_BORDER_TYPE, BORDER_FLAT);
      ObjectSetInteger(0, bg, OBJPROP_COLOR, C'60,70,85');
      ObjectSetInteger(0, bg, OBJPROP_BACK, false);
      ObjectSetInteger(0, bg, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, bg, OBJPROP_HIDDEN, true);
   }
}

void SetLabel(const string key, const int row, const string text, const color clr, const int fontsize = 9)
{
   string obj = PFX + key;
   if(ObjectFind(0, obj) < 0)
   {
      ObjectCreate(0, obj, OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0, obj, OBJPROP_CORNER, CORNER_LEFT_UPPER);
      ObjectSetInteger(0, obj, OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
      ObjectSetInteger(0, obj, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(0, obj, OBJPROP_HIDDEN, true);
      ObjectSetString(0, obj, OBJPROP_FONT, "Consolas");
   }
   ObjectSetInteger(0, obj, OBJPROP_XDISTANCE, InpPanelX);
   ObjectSetInteger(0, obj, OBJPROP_YDISTANCE, InpPanelY + row * 19);
   ObjectSetInteger(0, obj, OBJPROP_FONTSIZE, fontsize);
   ObjectSetInteger(0, obj, OBJPROP_COLOR, clr);
   ObjectSetString(0, obj, OBJPROP_TEXT, text);
}

void UpdatePanel(const double spreadPts, const int velocity, const double windowDelta,
                 const double momentumPts, const double buyShare, const int signal)
{
   bool isDemo = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE) == ACCOUNT_TRADE_MODE_DEMO;
   string mode = isDemo ? "DEMO" : "LIVE";
   string tradeState = g_tradeBlock ? "BLOCKED(live)" : (InpEnableTrading ? "ENABLED" : "OFF");
   color  tradeClr   = g_tradeBlock ? clrOrange : (InpEnableTrading ? clrLime : clrSilver);

   string sigTxt; color sigClr;
   if(signal > 0)      { sigTxt = "LONG  ^"; sigClr = clrLime; }
   else if(signal < 0) { sigTxt = "SHORT v"; sigClr = clrRed;  }
   else                { sigTxt = "flat";    sigClr = clrSilver; }

   double pip       = (double)PipInPoints();
   double spreadPip = spreadPts / pip;
   double momPip    = momentumPts / pip;

   color spreadClr = (spreadPip > InpMaxSpreadPips) ? clrTomato : clrLightGreen;
   color velClr    = (velocity >= InpVelocityTrigger) ? clrLightGreen : clrSilver;
   color deltaClr  = windowDelta > 0 ? clrLightGreen : (windowDelta < 0 ? clrTomato : clrSilver);

   SetLabel("t",   0, "4gold  Order-Flow Scalper", clrGold, 10);
   SetLabel("acc", 1, StringFormat("Account : %s   Trade: %s", mode, tradeState), tradeClr);
   SetLabel("spr", 2, StringFormat("Spread  : %.1f pip (max %.1f)", spreadPip, InpMaxSpreadPips), spreadClr);
   SetLabel("vel", 3, StringFormat("Velocity: %d ticks / %ds (min %d)", velocity, InpWindowSeconds, InpVelocityTrigger), velClr);
   SetLabel("dlt", 4, StringFormat("Delta   : %+.0f  (buy %.0f%%)", windowDelta, buyShare * 100.0), deltaClr);
   SetLabel("cum", 5, StringFormat("CumDelta: %+.0f", g_cumDelta), g_cumDelta >= 0 ? clrLightGreen : clrTomato);
   SetLabel("mom", 6, StringFormat("Momentum: %+.1f pip (min %d)", momPip, InpMomentumPips), momentumPts >= 0 ? clrLightGreen : clrTomato);
   SetLabel("sig", 7, StringFormat("SIGNAL  : %s", sigTxt), sigClr, 10);

   ChartRedraw(0);
}

//==================================================================
//  Telegram
//==================================================================
string UrlEncode(const string s)
{
   string out = "";
   uchar bytes[];
   int n = StringToCharArray(s, bytes, 0, -1, CP_UTF8);   // n includes trailing 0
   for(int i = 0; i < n - 1; i++)
   {
      uchar c = bytes[i];
      if((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') ||
         (c >= '0' && c <= '9') || c == '-' || c == '_' || c == '.' || c == '~')
         out += CharToString(c);
      else
         out += StringFormat("%%%02X", c);
   }
   return out;
}

void SendTelegram(const string text)
{
   if(!InpUseTelegram) return;
   if(InpTgToken == "" || InpTgChatId == "")
   {
      Print("Telegram: token or chat id is empty - skipping.");
      return;
   }

   string url     = "https://api.telegram.org/bot" + InpTgToken + "/sendMessage";
   string body    = "chat_id=" + InpTgChatId + "&text=" + UrlEncode(InpTgPrefix + text);
   string headers = "Content-Type: application/x-www-form-urlencoded\r\n";

   char post[], result[];
   string rheaders;
   int len = StringToCharArray(body, post, 0, -1, CP_UTF8) - 1;   // drop trailing 0
   if(len > 0) ArrayResize(post, len);

   ResetLastError();
   int code = WebRequest("POST", url, headers, 5000, post, result, rheaders);
   if(code == -1)
      PrintFormat("Telegram WebRequest failed (err=%d). In MT5: Tools>Options>Expert Advisors, "
                  "tick 'Allow WebRequest' and add https://api.telegram.org", GetLastError());
   else if(code != 200)
      PrintFormat("Telegram HTTP %d: %s", code, CharArrayToString(result));
}
//+------------------------------------------------------------------+
