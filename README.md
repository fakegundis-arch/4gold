# 4gold

Order-flow **scalping** Expert Advisor for **gold (XAUUSD)** on **MT5 / Exness**.

Exness gold is OTC, so there is **no real order book (DOM)**. This bot instead reads
**tick-based order flow** — the only edge actually available on a retail gold feed:

- **Tick velocity** — how many ticks arrive per window (activity / aggression)
- **Bid/ask imbalance** — up-ticks vs down-ticks → directional pressure & cumulative delta
- **Spread state** — current vs average; trades are blocked when the spread is too wide
- **Short-term momentum** — price change across the window

## Safety first (read this)

The EA is built so you cannot accidentally trade real money yet:

| Guard | Default | Effect |
|-------|---------|--------|
| `InpDemoOnly` | `true` | Hard-blocks all order sending on a **LIVE** account |
| `InpEnableTrading` | `false` | Starts in **visualize-only** mode — no orders at all |

**Milestone 1 (now):** run it on your Exness **demo** chart with `InpEnableTrading = false`,
and watch the dashboard to confirm the order-flow signals make sense on gold.
Only after that do we flip `InpEnableTrading = true` (still on demo).

## Install

1. In MT5: **File → Open Data Folder**.
2. Copy `MQL5/Experts/GoldOrderFlowScalper.mq5` into the `MQL5/Experts` folder there.
3. Open **MetaEditor**, open the file, press **Compile** (F7) — should compile with 0 errors.
4. Back in MT5, open an **XAUUSD** chart on your **Exness demo** account (M1 or M5 is fine for scalping).
5. Drag **GoldOrderFlowScalper** from the Navigator onto the chart.
6. In the dialog, **Common** tab → tick **Allow Algo Trading**. Confirm **Inputs**:
   - `InpDemoOnly = true`
   - `InpEnableTrading = false`  (keep off for milestone 1)
7. Make sure the toolbar **Algo Trading** button is green.

You should see a dashboard panel top-left with live velocity / delta / spread / signal,
and arrows on the chart when a signal fires.

## Quick pipeline test

To confirm orders + Telegram actually fire on your demo account, set:

- `InpTestTradeOnStart = true`
- `InpTestTradeIsBuy = true` (or false for a sell)

When you attach the EA it opens **one** market trade immediately, regardless of
`InpEnableTrading`, and sends the trade alert to Telegram. It still obeys the
demo-only guard, so it can never fire on a live account. Turn it **back off** once
you've confirmed it works — otherwise it opens a fresh test trade on every restart.

## Key inputs

| Input | Meaning |
|-------|---------|
| `InpWindowSeconds` | Rolling order-flow window length (seconds) |
| `InpVelocityTrigger` | Min ticks in window before any signal is allowed |
| `InpImbalanceTrigger` | Buy/sell share needed for a directional signal (0.5–1.0) |
| `InpMomentumPoints` | Min price move (points) across the window to confirm |
| `InpMaxSpreadPoints` | Block trades when spread exceeds this (gold widens on news/rollover) |
| `InpUseSessionFilter` / `InpBlockFromHour` / `InpBlockToHour` | Avoid thin rollover hours (server time) |
| `InpLots`, `InpStopLossPips`, `InpTakeProfitPips` | Position sizing & exits (SL/TP in **pips**, gold 1 pip = $0.10) |

> Note: SL/TP are set in **pips**. For gold, 1 pip = **$0.10** of price (= 10 broker points on a
> 2-digit `XAUUSDm` feed, or 100 points on a 3-digit feed). So `InpStopLossPips = 5` ≈ a $0.50
> move (default SL 30 pips ≈ $3.00 risk, TP 50 pips ≈ $5.00 reward at 0.01 lot). The EA
> auto-widens the stop if it falls inside the broker's minimum stop distance or the
> current spread, and logs the pip size at startup (`1pip=...pts`). The order-flow thresholds
> (`InpMomentumPoints`, `InpMaxSpreadPoints`) remain in raw **points** since they tune the signal,
> not your risk.

## Telegram alerts (optional)

The EA can push a few logs to Telegram: **startup**, **each new signal** (throttled), and
**trade open / failure**. All off until you set `InpUseTelegram = true`.

Setup:

1. In Telegram, message **@BotFather** → `/newbot` → copy the **bot token**.
2. Get your **chat id**: message your new bot once, then open
   `https://api.telegram.org/bot<TOKEN>/getUpdates` in a browser and read `chat.id`.
   (For a channel use the `-100...` id and add the bot as admin.)
3. **Allow the URL in MT5** — this is required or `WebRequest` returns -1:
   **Tools → Options → Expert Advisors** → tick **Allow WebRequest for listed URL** →
   add `https://api.telegram.org`.
4. In the EA inputs set:
   - `InpUseTelegram = true`
   - `InpTgToken = <your bot token>`
   - `InpTgChatId = <your chat id>`

Tune `InpTgMinIntervalSec` (default 30s) to control signal-alert spam, and toggle
`InpTgOnStart` / `InpTgOnSignal` / `InpTgOnTrade` per event type.

## Status

- [x] Order-flow signal engine (velocity, imbalance, cumulative delta, momentum)
- [x] On-chart dashboard + signal arrows
- [x] Demo-only + trading-off safety guards
- [x] Trade execution with spread / session / max-position filters
- [x] Telegram alerts (startup / signal / trade)
- [ ] Calibrate thresholds on live Exness demo feed
- [ ] Enable trading on demo and evaluate
