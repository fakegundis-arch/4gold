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

## Key inputs

| Input | Meaning |
|-------|---------|
| `InpWindowSeconds` | Rolling order-flow window length (seconds) |
| `InpVelocityTrigger` | Min ticks in window before any signal is allowed |
| `InpImbalanceTrigger` | Buy/sell share needed for a directional signal (0.5–1.0) |
| `InpMomentumPoints` | Min price move (points) across the window to confirm |
| `InpMaxSpreadPoints` | Block trades when spread exceeds this (gold widens on news/rollover) |
| `InpUseSessionFilter` / `InpBlockFromHour` / `InpBlockToHour` | Avoid thin rollover hours (server time) |
| `InpLots`, `InpStopLossPoints`, `InpTakeProfitPoints` | Position sizing & exits |

> Note: tuning thresholds depends on the symbol's digits/point and your typical Exness gold
> spread. Defaults are conservative starting points — we'll calibrate them against your demo feed.

## Status

- [x] Order-flow signal engine (velocity, imbalance, cumulative delta, momentum)
- [x] On-chart dashboard + signal arrows
- [x] Demo-only + trading-off safety guards
- [x] Trade execution with spread / session / max-position filters
- [ ] Calibrate thresholds on live Exness demo feed
- [ ] Enable trading on demo and evaluate
