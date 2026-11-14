# Paid Cloud/Browser-Based Real-Time Face Swap and Live Video Transformation Services (as of Nov 14, 2026)

Scope note: These are research notes on paid, credit/minute-billed services that can change a person's face or appearance live in a video call without a strong local GPU. Research date: 2026-11-14. Many sources are vendor pages or third-party aggregators (often affiliate/SEO sites). Conflicts are flagged inline. "Live" means the output can be picked as a camera, or joins as a participant, in a call app. "Offline" means it only processes uploaded files.

---

## Q1. Which services are truly live in a call, and which only process uploaded video?

### Takeaway
There are three kinds of live delivery:
- **(a) System-level virtual camera from an installed desktop client.** AKOOL Live Camera (Win/Mac) and VidMage (Mac only).
- **(b) Browser-only tools.** LiveFaceSwap.io and the Facecam AI Chrome extension. LiveFaceSwap.io needs OBS to reach other apps.
- **(c) "Digital twin" bots or camera replacements.** Tavus, HeyGen LiveAvatar, Pika AI Self (bots that join meetings) and Pickle (a Mac camera replacement).

Decart (Mirage/Lucy) is truly real-time but only as a developer API/SDK. I found no consumer virtual camera from Decart. Magic Hour and Remaker are offline (uploaded files) only. Swapface's live mode is local-GPU, not cloud.

### Cited Findings

**AKOOL Live Camera: LIVE (virtual camera via desktop app)**
- Akool describes Live Camera as an "avatar-driven virtual camera" that "Works with Zoom, Meet, Teams, and more." In Google Meet you select the Live Camera option as the camera device. — [AKOOL Live Camera page](https://akool.com/live-camera)
- Features: live face swap (tracks expressions, lip and head movement onto a preset target face), real-time lip-synced avatar ("200+ 4K Resolution Characters" plus custom avatars), real-time translation (140+ languages claimed, two-way), and real-time voice clone. — [AKOOL Live Camera page](https://akool.com/live-camera)
- Audio on Windows is routed through Virtual Audio Cable (two cables). The free VAC install adds a "Trial" audio watermark, and a permanent license removes it. — [AKOOL Live Camera page](https://akool.com/live-camera)
- It is a desktop install: Windows 10 (Anniversary Update)+ or macOS 13+ (Apple M1+), and it needs an Akool account. Installers are obtained via an "Access Form". — [AKOOL Live Camera page](https://akool.com/live-camera); search summary of [akool.com/akool-camera](https://akool.com/akool-camera)
- Akool also has a browser Live Face Swap (akool.com/apps/faceswap/live) that uses the webcam directly in the browser. A search snippet says its "Online Meeting" option is listed as "Coming Soon". I did not verify this by fetching the page. — [akool.com/apps/faceswap/live](https://www.akool.com/apps/faceswap/live) (via search summary)
- A third-party reviewer says Live Camera "requires platform-specific setup to route the transformed output into video call applications as a virtual camera source." — search summary citing [vmeg.ai Akool review](https://www.vmeg.ai/blog/akool-reviews/)

**VidMage: LIVE, Mac only (virtual camera)**
- The live swap works through a virtual camera in the Mac app, with Zoom, FaceTime and Google Meet. The live webcam face swap is Mac-only. — search summaries of [creati.ai VidMage](https://creati.ai/ai-tools/vidmage/), [itechguides VidMage review](https://itechguides.com/products/vidmage/review), [comparebestai VidMage](https://comparebestai.com/tools/vidmage)
- A June 27, 2025 press release announced the "VidMage Camera" real-time face swap. — [Mammoth Times / ACCESSWIRE release](https://business.mammothtimes.com/mammothtimes/article/accwirecq-2025-6-27-experience-the-future-of-real-time-face-swapping-with-vidmage-camera-a-revolutionary-leap-in-ai-creativity)
- I found no evidence that VidMage's live swap runs in the cloud (see Gaps).

**LiveFaceSwap.io: LIVE in the browser, cloud-processed; reaches other apps only via OBS**
- It uses a "Live X2.0 cloud model" that redraws each webcam frame in real time from one reference image. There are three modes on the same model: Face swap, Try on, and Restyle. — [PromptZone article, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- It runs in the browser with "no client app, camera driver, or graphics card needed." To use it in Zoom, Google Meet or Discord, you capture its 960×540 pop-out window with OBS Window Capture and output it through OBS Virtual Camera. — [PromptZone, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)

**Livesync (live-sync.io): marketed as LIVE, cloud ("Live Face Swap in the Cloud", no GPU)**
- It is described as a cloud real-time face swap for streaming, video calls and VTubing, integrating with OBS, Zoom and YouTube. It launched on Product Hunt on Feb 24, 2025 (9 followers). — search summaries of [Product Hunt Livesync](https://www.producthunt.com/products/livesync), [Toolify Livesync](https://www.toolify.ai/tool/livesync)

**LiveFaceSwap AI (stork.ai / creati.ai listings; a different product from LiveFaceSwap.io and Livesync): LIVE, browser-based, cloud-processed**
- It needs no local GPU, and the listing claims latency below 500 ms. — search summary of [stork.ai LiveFaceSwap AI](https://www.stork.ai/en/livefaceswap-ai)
- liveswap.io is separately described as a "browser-based real-time AI face swap engine" with sub-500 ms latency. — search summary of [topai.tools liveswap.io](https://topai.tools/t/liveswap-io)

**Facecam AI (Chrome extension): LIVE only inside web call apps in Chrome**
- It is a Chrome extension for the web versions of Google Meet, Zoom, Microsoft Teams and Discord. The privacy section says processing happens "locally on your device." — [Chrome Web Store listing](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)
- A third-party listing says Facecam.ai (web) launched Oct 5, 2026. — search summary of [similarlabs facecam-ai](https://similarlabs.com/p/facecam-ai). This conflicts with the extension's "last updated Dec 20, 2024 (v0.0.5)." — [Chrome Web Store](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)

**Decart (Mirage / MirageLSD / Lucy / Oasis): truly real-time video-to-video, but API/SDK only**
- Mirage launched (July 2025) as a web demo that restyles webcam and YouTube video with preset themes. — [PetaPixel, Jul 18, 2025](https://petapixel.com/2025/07/18/mirage-is-the-worlds-first-ai-video-that-can-transform-live-footage-in-real-time)
- It was pitched for Zoom calls, games and ads. — [Ynetnews](https://www.ynetnews.com/business/article/b1xdaxfuee); [eWeek](https://www.eweek.com/news/mirage-first-real-time-video-to-video-ai-model/)
- Decart's SDK offers a WebRTC real-time API (e.g., `mirage_v2` for webcam restyling). — [Decart SDK docs (Mintlify)](https://www.mintlify.com/DecartAI/sdk/realtime/overview)
- Decart's "Decart Live Camera" is an Expo sample app that streams camera frames to MirageLSD / Lucy Edit Live. It is a showcase, not a consumer release. — [Decart showcase](https://mirage.decart.ai/showcase/decart-camera)
- Current models (Nov 2026 pricing page): Lucy 2.6/2.5 (realtime video editing), Lucy VTON 3.6/3.5 (virtual try-on), Lucy Restyle 2, and Oasis 3 Preview (world model). MirageLSD is not listed on the pricing page. — [Decart pricing docs](https://docs.platform.decart.ai/getting-started/pricing)
- A Lucy 2.6 news item says it "stops AI video faces and clothes from drifting." — search result title, [hermes-ai.net](https://hermes-ai.net/news/decart-s-lucy-2-6-stops-ai-video-faces-and-clothes-from-drifting/)
- No source mentioned a Decart system virtual camera driver that Zoom or Meet could select. — search, no results found

**Digital twin / avatar-in-meeting products: LIVE as a meeting participant or camera replacement, not a face swap of your live feed**
- **Tavus:** Google Meet, Microsoft Teams and Zoom integration is listed on paid developer tiers: 1 configuration on Starter, 3 on Builder, 7 on Growth, 15 on Business, white-labeled on Enterprise. It is not on Free. — [Tavus pricing](https://www.tavus.io/pricing)
- **Pika:** "Pika AI Self" runs on PikaStream 1.0 (Apr 3, 2026). You invite an AI version of yourself into a Google Meet call. The article does not mention Zoom. — [AlternativeTo news, Apr 2026](https://alternativeto.net/news/2026/4/pika-labs-launches-real-time-video-chat-with-an-ai-avatar-version-of-yourself-in-meetings)
- **Pickle:** a macOS app that generates an AI clone and "replaces your camera feed" in Zoom, Google Meet, Microsoft Teams, Twitch and Photo Booth. — search summaries of [TechCrunch, Nov 23, 2024](https://techcrunch.com/2024/11/23/how-a-digital-you-can-sit-through-your-agonizing-web-conference-calls/), [AlternativeTo Pickle](https://alternativeto.net/software/pickle-1/about), [FutureTools](https://futuretools.io/tools/pickle-ai). The official site getpickle.ai returned HTTP 503 when fetched.
- **HeyGen LiveAvatar:** real-time lip-synced avatars sold on a separate LiveAvatar platform. — [docs.liveavatar.com](https://docs.liveavatar.com/docs/faq/credits) (via search summary). No Zoom-specific integration was confirmed.

**OFFLINE only (uploaded files)**
- **Magic Hour:** its face swap guides describe photo, video and GIF upload workflows. A third-party comparison lists it as not real-time. — search summaries of [Magic Hour face swap guide](https://magichour.ai/blog/magic-hour-ai-face-swap-video-3-steps), [Magic Hour how-to](https://magichour.ai/blog/how-to-face-swap)
- **Remaker:** hosted photo and video tools only, with no live camera mode found. — search summary of [Magic Hour's Remaker guide](https://magichour.ai/blog/remaker-ai-face-swap)
- **Runway:** real-time work (GWM-1, Runway Characters from Mar 2026) is demo- and enterprise-oriented. "The timeline for the live streaming feature itself remains unannounced." — search summaries of [stack-archive](https://stack-archive.com/blog/runway-real-time-ai-video-generation-gwm1-2026/), [the-decoder](https://the-decoder.com/runway-wants-to-turn-ai-video-generation-into-a-live-stream-you-control-in-real-time/), [Runway research](https://runway.com/news/research/towards-instant-video-generation)

**LOCAL GPU (not cloud)**
- **Swapface:** "performs hyperrealistic image and video transformations directly on a user's local machine." It requires Windows 10+, an i5/Ryzen CPU and a compatible graphics card. — search summaries of [techshark Swapface](https://techshark.io/tools/swapfaceorg/), [topai.tools Swapface](https://topai.tools/t/swapface)
- **Deep-Live-Cam:** open source and local. It swaps from a single photo into a virtual camera for Zoom, Teams or OBS, and needs a capable GPU. — search summary of [pyshine](https://pyshine.com/Deep-Live-Cam-Real-Time-Face-Swap/), [brightcoding](https://blog.brightcoding.dev/2026/01/10/deep-live-cam-real-time-face-swapping-in-video-streams-2025)

**General architecture of cloud live swap (Sept 2026)**
- The local webcam feeds a desktop client, which sends frames to cloud AI and returns them as a virtual camera. — search summary of [PCTechMag, Sept 2026](https://pctechmag.com/2026/09/how-real-time-ai-face-swap-is-changing-webcam-workflows-for-streamers-and-creators/)

### Inferences
- For "no strong GPU" plus "works in any call app," the best-documented paid option is AKOOL Live Camera. The browser-only cloud tools (LiveFaceSwap.io, LiveFaceSwap AI, Livesync) are less mature and need OBS as a bridge to reach other apps.
- AKOOL Live Camera's listed requirements include a recommended GTX 1660 / RX 580 and a minimum Intel UHD 630 ([AKOOL Live Camera](https://akool.com/live-camera)). This suggests some processing (at least face tracking or compositing) runs locally, so it is not purely thin-client. How much runs in the cloud is not documented.
- Decart has the most advanced real-time video-to-video tech, but a non-developer cannot use it as a call camera without building a client plus a virtual camera bridge. Decart's own pricing page does not position it as a consumer call filter.
- Digital twin products (Tavus, Pika AI Self, HeyGen LiveAvatar) replace you with an AI-driven avatar that speaks via LLM/TTS. They are not a face filter on your live movements. Pickle is in between: it is driven by your voice and lip-sync, and replaces your camera with a pre-trained clone of yourself.

### Gaps
- I could not fetch VidMage's official site to confirm whether live swap processing runs on-device (Apple Silicon) or in the cloud.
- I could not confirm whether AKOOL Live Camera's face swap is computed in the cloud or locally. The page lists hardware requirements but no architecture.
- Pickle's official site (getpickle.ai) returned 503, so current platform support (Windows?), pricing and status are unverified.
- I found no reliable info on Facecam AI's web product beyond the Chrome extension, and the two sources conflict on its dates.
- I found no live-call product from Magic Hour or Remaker. I found no evidence of a "Swapface cloud mode."

---

## Q2. How do they bill (credits per minute), and what is the effective cost per hour?

### Takeaway
- **Cloud face swap:** AKOOL is about $10–15/hour of live face swap at API credit rates. Subscription plans cap live minutes: up to 60–120 min per plan on the pricing page, and 5–60 min per session on the Live Camera page.
- **Decart API:** $36–144/hour depending on model and speed.
- **Digital twins:** Tavus about $15.60–21/hour at overage rates. HeyGen LiveAvatar is about $6–12/hour if a third-party plan price is right.
- **VidMage (Mac):** about $10/month flat for "unlimited" live swap.
- Pricing for the small browser entrants is unverified or conflicting.

### Cited Findings

**AKOOL (subscription plus credits)**
- Pricing page plans (per seat; the page does not label which figure is monthly and which is annual):

| Plan | Price | Credits/mo | Live Face Swap minutes |
|---|---|---|---|
| Free | $0 | – | "5 mins free time" |
| Starter | $12/mo | 200 | "Up to 5mins" |
| Pro | $21/mo (struck-through $30) | 600 | "Up to 60 mins" |
| Pro Max | $41.30/mo (struck-through $59) | 1,200 | "Up to 90 mins" |
| Business | $174.30/mo (struck-through $249) | 6,000 | "Up to 120 mins" |
| Enterprise | "Let's Talk" | – | "Customized" |

  Streaming Avatar session time: 5 min free; Starter 15; Pro 15; Pro Max 30; Business 60. — [AKOOL pricing](https://akool.com/pricing)
- The Live Camera page gives different per-session limits: Starter 5 min, Pro 15 min, Pro Max 30 min, Business 60 min per session. — [AKOOL Live Camera](https://akool.com/live-camera). This conflicts with or overlaps the pricing page's "Up to 60/90/120 mins" for Live Face Swap. It is unclear whether those are per-month or per-session figures.
- API pricing for Face Swap "Live streaming": 1.2 credits per 10 s on Pro Max, 1 credit per 10 s on Business, Customized on Enterprise. Concurrency is 5. — [AKOOL API pricing](https://akool.com/en-us/api-pricing)
- API pricing for Streaming Avatar: 1080p at 1.2 credits/10 s (Pro Max) or 1 credit/10 s (Business); 1080p–4K at 2.4 or 2 credits/10 s. Max API concurrency is 3, 5 or 10. — [AKOOL API pricing](https://akool.com/en-us/api-pricing)
- A third-party guide instead lists Live Face Swap Streaming at 1.7 credits per 10 s. — search summary of [vidmetoo Akool pricing](https://www.vidmetoo.com/akool-pricing-explained-plans-credits-and-hidden-costs/). This conflicts with the official API page.
- Third-party sources disagree on which plan includes Live Camera: one says the top business tier, another says Pro Max. — search summary of [aimojo](https://aimojo.io/akool-pricing/), [Magic Hour Akool review](https://magichour.ai/blog/akool-ai-review)
- Credits expire at the end of each billing cycle (third-party). — search summary of [vidmetoo](https://www.vidmetoo.com/akool-pricing-explained-plans-credits-and-hidden-costs/). A Trustpilot reviewer also says unused credits do not roll over. — [Trustpilot Akool](https://www.trustpilot.com/review/akool.com)

**Decart (pay-as-you-go API, $1 = 100 credits)**

| Realtime model | 720p price | Fast mode (2x) |
|---|---|---|
| Lucy 2.6, Lucy 2.5, Lucy VTON 3.6/3.5, Lucy 2.1 | $0.02/sec | $0.04/sec (Lucy 2.1: not listed) |
| Lucy Restyle 2 | $0.01/sec | not offered |
| Oasis 3 Preview | $0.02/sec | not offered |

- There are no subscriptions and no minimum spend. New accounts get free test credits (amount unstated). — [Decart pricing docs](https://docs.platform.decart.ai/getting-started/pricing)
- fal.ai resells Lucy 2.5 realtime at $0.04/sec ($144/hr). — search summary of [fal Lucy 2.5](https://fal.ai/models/decart/lucy-2-5/realtime/llms.txt), [aireiter](https://aireiter.com/blog/lucy-2-5-realtime-video-guide)
- An older or unverified third-party claim: "1 credit per second" for MirageLSD with a free trial at mirage.decart.ai. — search summary of [tooldirectory.ai](https://tooldirectory.ai/tools/decart)

**Tavus (developer CVI plans; current page version)**

| Plan | Price | Minutes/mo | Overage | Concurrent | Max conversation | Custom faces |
|---|---|---|---|---|---|---|
| Free | $0 | 20 | – | 1 | 5 min | – |
| Starter | $22/mo | 60 | none listed | 1 | 10 min | 1 |
| Builder | $59/mo | 175 | $0.35/min | 3 | 15 min | 3 |
| Growth | $397/mo | 1,300 | $0.31/min | 10 | 60 min | 7 |
| Business | $975/mo | 4,000 | $0.26/min | 15 | 60 min | 15 |

  — [Tavus pricing](https://www.tavus.io/pricing)
- The same page contains an older grid: Starter $59 for 100 min with $0.37/min overage; Growth $397 for 1,250 min with $0.32 or $0.37/min overage; replica training overage $65 / $40. — [Tavus pricing](https://www.tavus.io/pricing). The two grids conflict.
- Tavus PAL (consumer companion, not meeting attendance): Free 15 min; Plus $20/mo for 150 min; Max $50/mo for 500 min. — [Tavus pricing](https://www.tavus.io/pricing)

**HeyGen (LiveAvatar and API)**
- LiveAvatar deducts credits per minute per session: Full Mode 2 credits/min, Custom Mode 1 credit/min. A session won't start without credit for at least 1 minute, and overage can be toggled on. — search summary of [LiveAvatar docs](https://docs.liveavatar.com/docs/faq/credits)
- A third-party source says Essential is $99/mo for 1,000 credits, Free is 10 credits, and Business is custom. — search summary of [anam.ai HeyGen pricing](https://anam.ai/blog/heygen-pricing) / [eesel](https://www.eesel.ai/blog/heygen-pricing). This is unverified.
- LiveAvatar slots cost $49/mo (or $480/yr) and are sold only on the LiveAvatar platform. — search summary of [HeyGen help center](https://help.heygen.com/en/articles/15125761-heygen-credit-based-pricing-plans-explained), [usagepricing](https://www.usagepricing.com/blueprint/activity/heygen-2026-07-22-topup-avatar-addon-prices)
- HeyGen API rates run from $1.00/min (Avatar III Digital Twin) to $4.00/min (Avatar V). Credit burn: Avatar IV 16 or 31 credits/min, Avatar V 48 credits/min. — search summary of [anam.ai](https://anam.ai/blog/heygen-pricing), [eesel](https://www.eesel.ai/blog/heygen-pricing) (third-party)

**VidMage (Mac live swap)**
- Free: watermarked live swap, 5 min/day on Mac. Paid: about $9.99/mo with "unlimited live face swap" (Mac); yearly $69.99 (about $5.83/mo). — search summaries of [creati.ai](https://creati.ai/ai-tools/vidmage/), [itechguides](https://itechguides.com/products/vidmage/review)
- Conflicting figures: Pro $14.99/mo ([comparebestai](https://comparebestai.com/tools/vidmage)) and "from $8.33/mo" ([itechguides](https://itechguides.com/products/vidmage)).

**Pickle**
- About $24/month according to third-party listings. — search summaries of [AlternativeTo](https://alternativeto.net/software/pickle-1/about), [SourceForge](https://sourceforge.net/software/product/Pickle-AI/). This conflicts with "Freemium" or "Free" listings ([tooldirectory](https://tooldirectory.ai/tools/pickle), [neuronfeed](https://neuronfeed.com/startups/pickle-ai)). It is unverified.

**Browser cloud entrants (unverified and conflicting)**
- LiveFaceSwap AI listings conflict:
  - A free tier up to 180 s, then "0.3 credits/s," with examples of "~$18 per minute" and "$3 per 10 seconds." — search summary of [stork.ai](https://www.stork.ai/en/livefaceswap-ai)
  - "Freemium from $15." — search summary of [saasworthy](https://www.saasworthy.com/product/livefaceswap-ai)
  - A Pro plan at $23.20 where "one credit equals one minute of live face swap time." — search summary of [toolify LiveFaceSwap AI](https://www.toolify.ai/tool/livefaceswap-ai)
- LiveFaceSwap.io: opening the camera is free with no login. Paid pricing is not stated. — [PromptZone, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- Livesync: no confirmed pricing; the pricing page is at live-sync.io/en/pricing. — search summary of [Toolify Livesync](https://www.toolify.ai/tool/livesync)
- Facecam AI: "offers in-app purchases." The free tier has basic filters and standard quality; Premium adds HD, advanced face tools and priority processing. No prices are listed. — [Chrome Web Store](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)
- Free real-time tools commonly impose 30-second sessions, watermarks or low-resolution caps (vendor claim). — search summary of [Sozee](https://www.sozee.ai/resources/real-time-face-swap-free/)

**Local comparator: Swapface**
- Advance plan $69/mo (no watermark, unlimited image faces); Enterprise $249/mo (aggregators). — search summaries of [similarlabs](https://similarlabs.com/p/swapface), [findailist](https://findailist.com/tools/swapface-ai)
- ToolWorthy says stream face swap requires a separate subscription. — search summary of [ToolWorthy](https://www.toolworthy.ai/tool/swapface)

### Inferences (my calculations from the cited rates)
- **AKOOL live face swap at API rates:**
  - Pro Max: 1.2 cr/10 s = 7.2 cr/min = 432 cr/hr. At about $0.034/credit (Pro Max $41.30 ÷ 1,200 cr) that is **≈ $14.70/hr**. Using the $59 struck-through price ($0.049/cr) it is **≈ $21/hr**.
  - Business: 1 cr/10 s = 360 cr/hr. At about $0.029/credit that is **≈ $10.50/hr** ($0.0415/cr at $249 ≈ $15/hr).
  - A Pro Max month (1,200 credits) covers about 2.8 hours of live streaming at API rates.
  - On consumer plans, the per-plan live-minute caps (60–120 min) are the binding limit. That works out to roughly $21–$41 for 1–1.5 hours, so **≈ $21–28/hr** effective at Pro/Pro Max if the caps are monthly.
- **Decart:**
  - $0.02/s = $1.20/min = **$72/hr** (Lucy 2.5/2.6 standard).
  - Fast mode = **$144/hr**.
  - Lucy Restyle 2 = **$36/hr**.
  - fal = $144/hr.
  - This is far more expensive per hour than consumer face swap services.
- **Tavus overage:**
  - $0.35/min = **$21/hr** (Builder); $0.31 = $18.60/hr (Growth); $0.26 = **$15.60/hr** (Business).
  - Included-minute cost: Builder $59/175 min ≈ $20.20/hr; Starter $22/60 min = $22/hr.
- **HeyGen LiveAvatar:** if the $99 = 1,000 credits figure is right ($0.099/cr), Full Mode (2 cr/min) ≈ **$11.88/hr** and Custom Mode ≈ **$5.94/hr**, plus a $49/mo avatar slot.
- **VidMage:** with "unlimited" live swap for about $9.99/mo, cost per hour approaches $0 at heavy use. It is the cheapest option, but Mac-only.
- **LiveFaceSwap AI:** the "$18 per minute" example ($1,080/hr) is implausible next to the other rates and likely an aggregator error. Treat it as unreliable.

### Gaps
- AKOOL does not publish a $/credit figure or state whether the "Up to 60/90/120 mins" Live Face Swap allowances are monthly or per session.
- I could not access the AKOOL checkout page to confirm actual monthly versus annual charges.
- I could not verify the HeyGen LiveAvatar plan prices on HeyGen's or LiveAvatar's own pricing page (docs page returned 404).
- I found no Pika AI Self / PikaStream pricing.
- I found no official pricing for Pickle, Livesync, LiveFaceSwap.io, LiveFaceSwap AI or Facecam AI.

---

## Q3. Latency, resolution, FPS and realism of the output

### Takeaway
- Hard numbers are scarce and mostly vendor claims:
  - Decart claims about 40 ms at 24 FPS (720p on current API pricing).
  - Browser cloud swap tools claim under 500 ms; LiveFaceSwap.io outputs 960×540.
  - Pika AI Self has about 1.5 s latency at 24 FPS.
  - Tavus streams at 1080p but gives no latency number.
  - AKOOL gives no latency or FPS figures.
- No independent benchmarks were found.

### Cited Findings
- **Decart MirageLSD:** "latency as low as 40 milliseconds" and "smooth 24 FPS." Decart's own publication calls it "zero latency." — search summaries of [Decart publication](https://decart.ai/publications/mirage), [the-decoder](https://the-decoder.com/decart-launches-miragelsd-an-ai-model-that-transforms-live-video-feeds-in-real-time). The Decart API page says "real-time responses under 100ms." — search summary of [tooldirectory](https://tooldirectory.ai/tools/decart)
- eWeek reports about a 40 ms delay transforming a webcam feed. — [eWeek](https://www.eweek.com/news/mirage-first-real-time-video-to-video-ai-model/)
- **Decart current API realtime resolution:** 720p. — [Decart pricing docs](https://docs.platform.decart.ai/getting-started/pricing)
- **LiveFaceSwap.io:** 960×540 output, FPS not stated. — [PromptZone, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- **LiveFaceSwap AI and liveswap.io:** claimed latency below 500 ms. — search summaries of [stork.ai](https://www.stork.ai/en/livefaceswap-ai), [topai.tools liveswap.io](https://topai.tools/t/liveswap-io)
- **Pika AI Self (PikaStream 1.0):** about 1.5 s latency, 24 FPS on a single H100. — [AlternativeTo news, Apr 2026](https://alternativeto.net/news/2026/4/pika-labs-launches-real-time-video-chat-with-an-ai-avatar-version-of-yourself-in-meetings)
- **Tavus:** 1080p on all developer tiers with 24 kHz audio. WebRTC with "ultra-low latency" and "Lowest market latency," but no ms figures. — [Tavus pricing](https://www.tavus.io/pricing)
- **AKOOL Live Camera:** no latency or FPS figures. The only resolution claim is "4K" avatar characters. — [AKOOL Live Camera](https://akool.com/live-camera)
- AKOOL API streaming avatar is priced for 1080p and 1080p–4K tiers. — [AKOOL API pricing](https://akool.com/en-us/api-pricing)
- **Runway:** demonstrated HD real-time generation with time-to-first-frame under 100 ms (GTC demo; not a consumer webcam feature). — search summary of [the-decoder](https://the-decoder.com/runway-wants-to-turn-ai-video-generation-into-a-live-stream-you-control-in-real-time/), [photoworkout](https://www.photoworkout.com/?p=219094)
- **Realism (AKOOL face swap, general):**
  - G2 reviewers praise face swap quality. — search summary of [G2 Akool reviews](https://www.g2.com/survey_responses/akool-review-9590909)
  - A forum review flags "minor alignment issues in videos with fast movements." — search summary of [data-medics forum](https://www.data-medics.com/forum/threads/akool-face-swap-ai-review-the-ultimate-tool-for-professional-and-fun-face-swapping.80086)
  - A Trustpilot user reports "a pair of glasses only showed one lens" (Nov 7, 2026). Another says the swap "looks so real compared to other apps" (Oct 26, 2026). These reviews are not specifically about live mode. — [Trustpilot Akool](https://www.trustpilot.com/review/akool.com)
- **Decart Lucy 2.6** release headline: "stops AI video faces and clothes from drifting." This implies identity drift was an issue in earlier versions. — [hermes-ai.net](https://hermes-ai.net/news/decart-s-lucy-2-6-stops-ai-video-faces-and-clothes-from-drifting/) (search result title only)

### Inferences
- Under 500 ms latency (browser cloud swappers) is noticeable as lip or audio desync unless the audio is delayed to match. Pika's 1.5 s latency fits a turn-based avatar conversation, not mirroring a live speaker.
- Most cloud swap outputs are 540p–720p. A typical call (Meet/Zoom often send 720p) hides some artifacts, but quality will lag local high-end GPU tools at 1080p.

### Gaps
- I found no independent latency or FPS measurements for AKOOL Live Camera, VidMage, Livesync, LiveFaceSwap.io or Facecam AI.
- I found no side-by-side realism tests of live (not offline) modes.

---

## Q4. One-photo swap vs digital twin; consent and identity verification requirements

### Takeaway
- **One photo (face swap or restyle of your live movements):** AKOOL Live Face Swap (preset or custom target face), LiveFaceSwap.io, LiveFaceSwap AI, VidMage, Decart (prompt or reference).
- **Digital twin trained on video of yourself:** Tavus (about 1-minute training video plus a consent script), Pickle (about 5-minute video, about 24 h processing), HeyGen digital twin / LiveAvatar, Pika AI Self.
- **Consent:** formal consent is documented for Tavus replicas. LiveFaceSwap.io requires users to be 18+ and have rights to every face used, with moderation of uploads. AKOOL's Live Camera page states no consent rules and shows celebrity examples.

### Cited Findings
- **Tavus:**
  - Custom replicas ("faces") are created from a one-minute training video that includes a custom voice model; the page also mentions creating one from a single image.
  - There is a consent script workflow, and white-labeling of the consent process is an Enterprise feature. — [Tavus pricing](https://www.tavus.io/pricing)
- **Pickle:** requires recording a 5-minute video of yourself, then waiting about 24 hours for processing. At one point it noted "clone generation is currently delayed" due to demand. — search summaries of [TechCrunch, Nov 2024](https://techcrunch.com/2024/11/23/how-a-digital-you-can-sit-through-your-agonizing-web-conference-calls/), [downes.ca](https://downes.ca/post/77563/rd)
- **LiveFaceSwap.io:**
  - Users must be 18+ and "must have rights to every face used."
  - Uploaded faces (PNG/JPEG/WebP) require moderation approval.
  - The built-in library is 46 original, non-real-person images (30 characters, 10 outfits, 6 styles).
  - Recordings carry an AI-generated label. — [PromptZone, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- **AKOOL Live Camera:** the page does not state consent or identity-verification requirements. Some examples mention celebrities as target faces. Trust & Safety and Content Moderation Policy links exist (content not reviewed). — [AKOOL Live Camera](https://akool.com/live-camera)
- The AKOOL pricing page says nothing about consent for live face swap or streaming avatars. — [AKOOL pricing](https://akool.com/pricing)
- **Facecam AI:** the Chrome listing describes no consent requirements, and the data practices section lists "Personally identifiable information" and "Website content" as collected. This sits uneasily with its "locally on your device" claim. — [Chrome Web Store](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)
- **Pika AI Self:** consent and setup input are not addressed in the launch coverage. Identity data can be changed mid-session without restarting the stream. — [AlternativeTo news, Apr 2026](https://alternativeto.net/news/2026/4/pika-labs-launches-real-time-video-chat-with-an-ai-avatar-version-of-yourself-in-meetings)
- **Virtual camera disclosure:** with virtual cameras, call apps see a normal webcam, so other participants are not told the video is altered. — general observation in search synthesis around [PCTechMag, Sept 2026](https://pctechmag.com/2026/09/how-real-time-ai-face-swap-is-changing-webcam-workflows-for-streamers-and-creators/)

### Inferences
- Digital twin products are structurally "self only": they are trained on your own recorded video, and Tavus adds a consent script. One-photo live swap tools accept arbitrary target faces, with policy rather than verification as the guardrail (LiveFaceSwap.io moderation; AKOOL silent on its Live Camera page).
- No service found requires government-ID or liveness verification for live face swap targets.

### Gaps
- I did not review AKOOL's Trust & Safety / Content Moderation Policy, so I do not know whether it bans swapping real third parties in Live Camera.
- I found no consent/KYC details for VidMage, Livesync, LiveFaceSwap AI, HeyGen LiveAvatar custom avatars or Pika AI Self.

---

## Q5. Compatibility with desktop apps (Discord, Telegram, WhatsApp) vs browser-only (Google Meet)

### Takeaway
- **Works with any app that can pick a camera, desktop apps included:**
  - AKOOL Live Camera (Win/Mac): system virtual camera.
  - VidMage (Mac only): system virtual camera.
  - LiveFaceSwap.io and Livesync, indirectly via OBS Virtual Camera.
- **Only web versions of Meet/Zoom/Teams/Discord in Chrome:** Facecam AI.
- **Meeting platforms only:** Tavus (Meet/Teams/Zoom), Pika AI Self (Google Meet), Pickle (Zoom/Meet/Teams/Twitch on Mac).
- No product explicitly documents Telegram or WhatsApp support.

### Cited Findings
- **AKOOL Live Camera:**
  - "Works with Zoom, Meet, Teams, and more." Discord is not named as supported; only a Discord community link appears.
  - Windows 10+ / macOS 13+. — [AKOOL Live Camera](https://akool.com/live-camera)
  - A third-party review says it appears as a standard camera input to Zoom, Teams or streaming platforms. — search summary of [vmeg.ai](https://www.vmeg.ai/blog/akool-reviews/)
- **VidMage:** Mac virtual camera for Zoom, FaceTime and Google Meet. — search summary of [creati.ai](https://creati.ai/ai-tools/vidmage/)
- **LiveFaceSwap.io:** reaches Zoom, Google Meet and Discord via OBS Window Capture plus OBS Virtual Camera. — [PromptZone](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- **Livesync:** integrates with OBS, Zoom and YouTube. — search summary of [Toolify Livesync](https://www.toolify.ai/tool/livesync)
- **Facecam AI:** web versions of Google Meet, Zoom, Teams and Discord, plus "And more!" (Omegle appears in the title only). — [Chrome Web Store](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)
- **Tavus:** Google Meet, Microsoft Teams and Zoom integrations on paid tiers. — [Tavus pricing](https://www.tavus.io/pricing)
- **Pika AI Self:** Google Meet. — [AlternativeTo, Apr 2026](https://alternativeto.net/news/2026/4/pika-labs-launches-real-time-video-chat-with-an-ai-avatar-version-of-yourself-in-meetings)
- **Pickle:** works "anywhere a camera is used," including Zoom, Google Meet, Microsoft Teams, Twitch and Photo Booth. It is macOS only, with Windows "on the roadmap." — search summaries of [AlternativeTo Pickle](https://alternativeto.net/software/pickle-1/about), [tooldirectory](https://tooldirectory.ai/tools/pickle)
- **Decart:** WebRTC SDK only; no virtual camera driver found. — [Decart SDK docs](https://www.mintlify.com/DecartAI/sdk/realtime/overview)

### Inferences
- A system virtual camera (AKOOL, VidMage, Pickle, or OBS Virtual Camera used as a bridge) should in principle work with Discord, Telegram and WhatsApp desktop apps, since they let you choose any installed camera. This is not explicitly documented by any vendor for Telegram or WhatsApp.
- Mobile WhatsApp/Telegram calls cannot use any of these virtual cameras.
- Meeting bots (Tavus, Pika) join as a separate participant through platform integrations. They are not usable in Discord, Telegram or WhatsApp calls based on the integrations listed.

### Gaps
- I found no vendor documentation or tests confirming Telegram Desktop or WhatsApp Desktop compatibility for any of these services.
- Pickle's Windows status as of Nov 2026 is unconfirmed (official site down).

---

## Q6. Independent reviews, user sentiment and billing complaints

### Takeaway
- **AKOOL** has the most review data, and it is concerning. Trustpilot has hidden its TrustScore for a guideline breach and removed fake reviews (400 reviews; 14% 1-star). There is a cluster of Oct–Nov 2026 reports of unauthorized or repeated charges and hard-to-cancel subscriptions, plus "credits run out fast."
- **Smaller browser tools** have almost no independent reviews. Facecam AI's extension is rated 2.4/5 from 7 ratings.

### Cited Findings
- **AKOOL on Trustpilot:**
  - TrustScore "unavailable due to a breach of our guidelines." Trustpilot removed "a number of fake reviews."
  - 400 total reviews (344 in the last 12 months). Distribution: 70% 5-star, 9% 4-star, 5% 3-star, 2% 2-star, 14% 1-star. — [Trustpilot Akool](https://www.trustpilot.com/review/akool.com)
- **AKOOL billing complaints (Trustpilot, 2026):** — [Trustpilot Akool](https://www.trustpilot.com/review/akool.com)
  - Nov 11: charged $30/mo on a "Pro600" plan the user says they never chose; "there are NO OPTIONS to cancel"; no support reply for more than 2 weeks; account showed a free plan.
  - Oct 10 (updated Nov 4): 20 unauthorized transactions in about 30 minutes.
  - Oct 24: two users report unauthorized and multiple same-day charges, one after a prior bank-reimbursed dispute.
  - Nov 7: a 280-credit job refund took about 2 weeks; "will not refund you for poor results but just offer you more credits"; unused credits do not roll over.
  - Oct 22 and Oct 27: credits run out quickly.
  - Jul 15: waited more than 12 hours for results.
  - Akool's replies are templated requests for account details.
- **AKOOL elsewhere:** G2 reviewers generally praise face swap quality but note weaker image generation. — search summary of [G2](https://www.g2.com/survey_responses/akool-review-9590909)
- An aggregator claims a "High TrustScore based on 269 reviews." — search summary (unverified; conflicts with Trustpilot's current hidden score)
- **Facecam AI:** about 1,000 users; 2.4/5 from 7 ratings; no review text shown; last updated Dec 20, 2024. — [Chrome Web Store](https://chromewebstore.google.com/detail/facecam-ai-face-swap-for/klofdgeoadpbilgkcfanjipjpfdkafkc)
- **Livesync:** 9 Product Hunt followers. Toolify shows 0 reviews, and G2 says there are not enough reviews. — search summaries of [Product Hunt](https://www.producthunt.com/products/livesync), [Toolify](https://www.toolify.ai/tool/livesync), [G2 Livesync](https://www.g2.com/products/livesync/discuss)
- **Pickle:** a 4.64/5 rating across 102 reviews on ToolDirectory, but no detailed reviews were found. — search summary of [tooldirectory](https://tooldirectory.ai/tools/pickle)
- **Source quality:** Many "reviews" of AKOOL, Swapface, Remaker and others come from Magic Hour's blog, a competitor with affiliate/SEO incentives, and from aggregator directories. — e.g., [Magic Hour Akool review](https://magichour.ai/blog/akool-ai-review), [Magic Hour Swapface review](https://magichour.ai/blog/swapface-review-and-alternatives)

### Inferences
- Credit-based subscriptions with non-rolling credits, combined with per-session live caps, make it easy to overpay for live use. Users should prefer monthly billing and virtual-card limits with AKOOL, given the cluster of unauthorized-charge reports in Oct–Nov 2026.
- The lack of independent reviews for the small browser cloud swappers (Livesync, LiveFaceSwap AI, LiveFaceSwap.io, Facecam AI) is itself a risk signal about longevity and billing reliability.

### Gaps
- I found no Reddit threads with first-hand live-call experiences for AKOOL Live Camera, VidMage, Livesync or LiveFaceSwap.io. Searches returned none, and Reddit was not directly fetched.
- No Trustpilot data was gathered for VidMage, Tavus, HeyGen LiveAvatar or Pickle.

---

## Q7. Newer 2025–2026 entrants and the market direction

### Takeaway
2025–2026 brought:
- Real-time video-to-video model APIs (Decart Mirage, Jul 2025, then Lucy 2.x / Oasis 3 by Nov 2026).
- Real-time avatar-in-meeting products: Pika AI Self (Apr 2026); Tavus with Meet/Teams/Zoom integration; HeyGen LiveAvatar.
- Runway real-time research (GWM-1, Runway Characters, Mar 2026).
- A wave of small browser cloud face swappers: Livesync (Feb 2025), LiveFaceSwap.io "Live X2.0" (covered Oct 2026), and Facecam.ai web (listed Oct 2026).

### Cited Findings
- **Decart:** Mirage launched in July 2025. — [PetaPixel, Jul 18, 2025](https://petapixel.com/2025/07/18/mirage-is-the-worlds-first-ai-video-that-can-transform-live-footage-in-real-time)
- By Nov 2026 Decart's pricing lists Lucy 2.6, Lucy VTON 3.6, Lucy Restyle 2 and Oasis 3 Preview as realtime models. — [Decart pricing docs](https://docs.platform.decart.ai/getting-started/pricing)
- Decart is also on AWS Marketplace with pay-as-you-go billing. — search summary of [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-mr3mfxy6fr7c4)
- **Pika:** PikaStream 1.0 / Pika AI Self launched Apr 2026 (Google Meet, about 1.5 s latency, 24 FPS). A GitHub Skill lets developers connect other agents. — [AlternativeTo, Apr 2026](https://alternativeto.net/news/2026/4/pika-labs-launches-real-time-video-chat-with-an-ai-avatar-version-of-yourself-in-meetings)
- **Runway:**
  - Runway Characters (Mar 2026) runs on GWM-1. The live streaming product timeline is unannounced. — search summary of [stack-archive](https://stack-archive.com/blog/runway-real-time-ai-video-generation-gwm1-2026/)
  - A Sept 10, 2026 research post: "Towards Instant Video Generation." — [Runway research](https://runway.com/news/research/towards-instant-video-generation)
- **LiveFaceSwap.io:** Live X2.0 cloud model with Face swap, Try on and Restyle modes. — [PromptZone, Oct 23, 2026](https://www.promptzone.com/robert_053e1d7054bda7d838/livefaceswapio-real-time-ai-face-swap-for-webcams-and-calls-ch0.md)
- **Facecam.ai web:** launch listed Oct 5, 2026. — search summary of [similarlabs](https://similarlabs.com/p/facecam-ai)
- **Livesync:** launched on Product Hunt Feb 24, 2025. — search summary of [Product Hunt](https://www.producthunt.com/products/livesync)
- **Magicam:** claims real-time face replacement for live streams and video calls. — search result listing on [SourceForge Magicam](https://sourceforge.net/app/magicam/web-app/), [G2 Magicam](https://www.g2.com/products/magicam/reviews). It is likely local; not verified.
- **Other real-time avatar APIs** listed in 2026 comparison articles include Anam and LemonSlice. — search result listings of [lemonslice.com](https://lemonslice.com/i/best-real-time-avatar), [anam.ai](https://anam.ai/blog/heygen-pricing). Details were not researched.

### Inferences
- The market is splitting into two branches:
  - (1) "Filter my live feed" face swap, from consumer subscriptions (AKOOL, VidMage) and small browser tools.
  - (2) "Send an AI me" digital twins, billed per conversation minute to developers and enterprises (Tavus, HeyGen LiveAvatar, Pika).
- Decart and Runway are model/API layers that third-party apps may wrap into consumer virtual camera products. No such Decart-powered consumer virtual camera was confirmed.

### Gaps
- I did not research Anam, LemonSlice, Magicam or other 2026 entrants in depth (pricing, live-call delivery).
- I could not confirm whether any third-party app ships a consumer virtual camera powered by the Decart API.
