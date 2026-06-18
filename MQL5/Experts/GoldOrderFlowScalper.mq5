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
input bool   InpEnableTrading    = false;   // false = visualize/collect only (no orders)

input group "=== Test ==="
input bool   InpTestTradeOnStart = false;   // Open ONE trade immediately on start (pipeline check)
input bool   InpTestTradeIsBuy   = true;    // Test trade direction: true=BUY, false=SELL

input group "=== Order Flow ==="
input int    InpWindowSeconds    = 10;      // Rolling window length (seconds)
input int    InpVelocityTrigger  = 25;      // Min ticks in window to allow a signal
input double InpImbalanceTrigger = 0.60;    // Buy(or sell) share needed for direction (0.5-1.0)
input int    InpMomentumPoints   = 30;      // Min price move (points) over window to confirm

input group "=== Trade Filters ==="
input double InpMaxSpreadPoints  = 35;      // Skip trading when spread (points) > this
input bool   InpUseSessionFilter = true;    // Avoid thin / rollover hours
input int    InpBlockFromHour    = 22;      // Server-time hour to STOP trading (inclusive)
input int    InpBlockToHour      = 1;       // Server-time hour to RESUME trading

input group "=== Position ==="
input double InpLots             = 0.01;    // Fixed lot size
input int    InpStopLossPoints   = 60;      // Stop loss (points)
input int    InpTakeProfitPoints = 90;      // Take profit (points)
input int    InpMaxPositions     = 1;       // Max simultaneous positions from this EA
input ulong  InpMagic            = 4000777; // Magic number

input group "=== Dashboard ==="
input bool   InpShowPanel        = true;    // Show on-chart dashboard
input bool   InpShowArrows       = true;    // Draw arrows when a signal fires
input int    InpPanelX           = 14;      // Panel X (px from left)
input int    InpPanelY           = 26;      // Panel Y (px from top)

input group "=== Telegram ==="
input bool   InpUseTelegram      = false;   // Send alerts to Telegram (needs allowed URL, see README)
input string InpTgToken          = "";      // Bot token from @BotFather
input string InpTgChatId         = "";      // Chat / channel id (e.g. 123456789 or -100...)
input string InpTgPrefix         = "[4gold] "; // Prefix on every message
input bool   InpTgOnStart        = true;    // Notify when EA starts
input bool   InpTgOnSignal       = true;    // Notify on each new signal
input bool   InpTgOnTrade        = true;    // Notify on trade open / failure
input int    InpTgMinIntervalSec = 30;      // Min seconds between signal alerts (anti-spam)

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

   PrintFormat("GoldOrderFlowScalper started on %s | mode=%s | trading=%s",
               _Symbol,
               (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO ? "DEMO":"LIVE",
               (InpEnableTrading && !g_tradeBlock) ? "ENABLED":"OFF");

   if(InpTgOnStart)
   {
      bool isDemo = (ENUM_ACCOUNT_TRADE_MODE)AccountInfoInteger(ACCOUNT_TRADE_MODE)==ACCOUNT_TRADE_MODE_DEMO;
      SendTelegram(StringFormat("started on %s (%s)\nTrading: %s",
                   _Symbol, isDemo ? "DEMO":"LIVE",
                   (InpEnableTrading && !g_tradeBlock) ? "ENABLED":"OFF"));
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

   // --- act / draw ---
   if(signal != 0 && signal != g_lastSignal)
   {
      if(InpShowArrows)
         DrawSignalArrow(signal, mid);

      if(InpTgOnSignal && (TimeCurrent() - g_lastTgSignal) >= InpTgMinIntervalSec)
      {
         SendTelegram(StringFormat("%s %s @ %s\nvel %d  delta %+.0f (buy %.0f%%)  mom %+.0f pts  spr %.0f",
                      signal > 0 ? "LONG" : "SHORT", _Symbol,
                      DoubleToString(mid, _Digits),
                      velocity, windowDelta, buyShare * 100.0, momentumPts, spreadPts));
         g_lastTgSignal = TimeCurrent();
      }

      TryTrade(signal, tk);
      g_lastSignal = signal;
   }
   else if(signal == 0)
   {
      g_lastSignal = 0;
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
   if(velocity < InpVelocityTrigger)        return 0;   // too quiet
   if(spreadPts > InpMaxSpreadPoints)       return 0;   // too expensive

   if(buyShare  >= InpImbalanceTrigger && momentumPts >=  InpMomentumPoints) return  1;
   if(sellShare >= InpImbalanceTrigger && momentumPts <= -InpMomentumPoints) return -1;
   return 0;
}

//==================================================================
//  Trading
//==================================================================
void TryTrade(const int signal, const MqlTick &tk)
{
   if(!InpEnableTrading || g_tradeBlock) return;
   if(InBlockedSession())               return;
   if(CountMyPositions() >= InpMaxPositions) return;

   ExecuteMarket(signal, "OF");
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

   if(signal > 0)
   {
      price = tk.ask;
      sl = (InpStopLossPoints   > 0) ? price - InpStopLossPoints   * point : 0.0;
      tp = (InpTakeProfitPoints > 0) ? price + InpTakeProfitPoints * point : 0.0;
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
      price = tk.bid;
      sl = (InpStopLossPoints   > 0) ? price + InpStopLossPoints   * point : 0.0;
      tp = (InpTakeProfitPoints > 0) ? price - InpTakeProfitPoints * point : 0.0;
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

   color spreadClr = (spreadPts > InpMaxSpreadPoints) ? clrTomato : clrLightGreen;
   color velClr    = (velocity >= InpVelocityTrigger)  ? clrLightGreen : clrSilver;
   color deltaClr  = windowDelta > 0 ? clrLightGreen : (windowDelta < 0 ? clrTomato : clrSilver);

   SetLabel("t",   0, "4gold  Order-Flow Scalper", clrGold, 10);
   SetLabel("acc", 1, StringFormat("Account : %s   Trade: %s", mode, tradeState), tradeClr);
   SetLabel("spr", 2, StringFormat("Spread  : %.0f pts (avg %.0f)", spreadPts, g_avgSpread), spreadClr);
   SetLabel("vel", 3, StringFormat("Velocity: %d ticks / %ds", velocity, InpWindowSeconds), velClr);
   SetLabel("dlt", 4, StringFormat("Delta   : %+.0f  (buy %.0f%%)", windowDelta, buyShare * 100.0), deltaClr);
   SetLabel("cum", 5, StringFormat("CumDelta: %+.0f", g_cumDelta), g_cumDelta >= 0 ? clrLightGreen : clrTomato);
   SetLabel("mom", 6, StringFormat("Momentum: %+.0f pts", momentumPts), momentumPts >= 0 ? clrLightGreen : clrTomato);
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
