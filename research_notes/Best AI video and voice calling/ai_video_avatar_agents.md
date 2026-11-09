# Real-Time Conversational AI Video Agents / Interactive Avatars (as of Nov 2026)

Research date: 2026-11-09. Almost all specs (latency, resolution, realism) are **vendor claims** unless stated otherwise. The only hands-on measurements found are WebRTC.ventures (Oct 2026, 4 vendors) and a Tavus-run Turing test. Several "comparison" pages are written by vendors (HeyGen, Anam, Synthesia, LemonSlice, Spatius), so they carry an obvious bias.

## Which platforms lead, and what are their specs (resolution, fps, latency, realism, body, perception, cloning, languages, LLM flexibility, API/no-code)?

### Takeaway
The leading products for a live, two-way video call with a photoreal AI human in Nov 2026 are **Tavus CVI** (Phoenix-4/4.5 face, Raven-1 perception, Sparrow-2 turn-taking; 1080p/40fps claimed), **Anam** (Cara-4 / Cara-4.1 Express, about 150 ms server-side generation, 1152×768), and **HeyGen LiveAvatar** (720p by default, 1080p on request). **D-ID V4 Agents** (up to 4K claimed, sub-500 ms), **Beyond Presence** (1080p), **Akool** (1080p, 4K at double credits) and **Synthesia Sessions** (launched Oct 2026) follow them. Newer entrants are **Runway Characters** (Mar 2026), **Google Gemini 3.8 Live with Live Avatar** (Sep 2026, 97 languages), **LemonSlice-2.1** (the only full-body provider) and **Tavus Griffin** (Oct 2026 research preview, not yet available to customers). **Hedra's realtime avatar shut down on 15 Apr 2026.**

### Cited Findings

**Tavus (CVI, Phoenix / Raven / Sparrow, Griffin)**
- Phoenix-4 launched 18 Feb 2026 and is described as "the first real-time human rendering model with emotional intelligence." — [Business Wire](https://www.businesswire.com/news/home/20260218278213/en/Tavus-Launches-Phoenix-4-the-First-Real-Time-Human-Rendering-Model-with-Emotional-Intelligence)
- Phoenix-4 specs: 1080p at 40 fps. The architecture is a streaming audio feature extractor, a long-term memory module, a diffusion head that generates motion coefficients, and a **3D Gaussian Splatting** renderer, distilled to a causal model for streaming. The page claims "10+" emotion states but names 9 (happiness, sadness, anger, surprise, disgust, fear, excitement, curiosity, contentment). The model also does active listening behaviour. It is available through the API, PALs and custom replicas. — [Tavus blog](https://www.tavus.io/blog/phoenix-4-real-time-human-rendering-with-emotional-intelligence)
- MarkTechPost reports sub-600 ms end-to-end conversational latency, delivery over WebRTC, Raven-1 for perception (reads the user's tone, facial expression and intent through the camera) and Sparrow-1 for turn-taking. — [MarkTechPost](https://www.marktechpost.com/2026/02/18/tavus-launches-phoenix-4-a-gaussian-diffusion-model-bringing-real-time-emotional-intelligence-and-sub-600ms-latency-to-generative-video-ai/)
- Sparrow-2 turn-taking model announced 27 Aug 2026. It is audio-native and multilingual. Tavus reports a 2.1% conversation failure rate in its own evals, "nearly 4x lower than the best alternative." — [Tavus Sparrow-2 blog](https://tavus.io/blog/sparrow-2)
- Phoenix-4.5: a third-party listing claims a 16% lip-sync improvement and about 1.3x motion vividness over Phoenix-4. A 134 ms audio-to-video figure is cited in a Tavus teaser; I found no official launch post. — [TAAFT](https://theresanaiforthat.com/model/phoenix-4-5/); [Tavus blog teaser](https://www.tavus.io/blog/phoenix-4-real-time-human-rendering-with-emotional-intelligence)
- Tavus product/SLA claim of "<1s utterance-to-utterance". Tavus does not publish a resolution (per HeyGen's comparison). — [HeyGen blog (competitor)](https://www.heygen.com/blog/best-real-time-ai-avatar-platforms)
- **Griffin** (announced 1 Oct 2026) is a full-duplex, video-to-video "Human Interaction Model" generated from a single image. It outputs 720p in 320 ms chunks at 25 fps, with an average audio-to-video latency of 0.43 s on H100 (generator only). Voice cloning needs about 10 s of reference audio. Griffin-Lite is a research preview only and is "not available for use for customers at this time." — [explainx.ai summary of Tavus research post](https://explainx.ai/blog/tavus-griffin-video-turing-test-him-2026)

**Anam (Cara models)**
- Cara-4 was released July 2026 and runs at 25 fps from a single photo. Anam reports about 150 ms average server-side avatar generation (about 180 ms elsewhere). — [Anam glossary/search summary](https://anam.ai/resources/glossary/real-time-avatar); [Anam buyer's guide](https://anam.ai/blog/best-ai-avatar-platforms-refresh-draft)
- Cara-4.1 Express launched 20 Oct 2026 as Anam's "most expressive realtime avatar model." It adds more expressive animation, better lip sync and "Director Notes"-style performance control, and is available in Anam Lab and through the API (`avatarModel: "cara-4.1-express"`). — [Anam changelog](https://anam.ai/docs/changelog)
- Cara-4.1 output is 1152×768 (also measured at 1152×768 / 25 fps by WebRTC.ventures). — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing); [WebRTC.ventures](https://webrtc.ventures/2026/10/real-time-ai-avatar-pipecat-interruption-comparison/)
- Anam can be used as a managed agent (its own STT/LLM/TTS, with a BYO-LLM option) or as audio passthrough for your own voice agent. It supports own-key ElevenLabs voices and offers a Zero Data Retention mode. — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing); [Anam changelog](https://anam.ai/docs/changelog)

**HeyGen LiveAvatar (formerly Interactive Avatar)**
- Streams at 720p by default. 1080p must be requested via an account manager, increases latency, and requires 1080p source footage. — [HeyGen LiveAvatar FAQ](https://help.heygen.com/en/articles/12758866-liveavatar-faq)
- Vendor claim: <300 ms median time to first frame. Paid plans offer unlimited concurrency. Custom avatars are 720p on Essential and 1080p on Business. — [HeyGen blog](https://www.heygen.com/blog/best-real-time-ai-avatar-platforms)
- Two modes: LITE (avatar only, BYO voice agent; connectors include Gemini Live) and FULL (managed STT/LLM/TTS). — [LiveAvatar Gemini connector docs](https://docs.liveavatar.com/docs/lite-mode/connectors/gemini-realtime); [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing)
- A third-party estimate puts end-to-end latency at about 1–2 s (a 2025-era review). — [bestliveavatar.com](https://bestliveavatar.com/models/heygen-liveavatar)

**D-ID (V4 Expressive Visual Agents)**
- Launched 16–17 Mar 2026. It uses a diffusion model trained on real actor performances and outputs up to 4K. D-ID claims sub-0.5 s conversational turns and sentiment-adaptive expressions. An optional camera layer feeds nonverbal cues to the LLM. "Agentic Videos" followed on 23 Apr 2026. — [eLearning Industry PR](https://elearningindustry.com/press-releases/d-id-launches-v4-expressive-visual-agents-for-real-time-ai-interaction); [Anam blog on D-ID V4](https://anam.ai/blog/d-id-v4-expressive-visual-agents-what-it-means)

**Beyond Presence**
- 1080p on all plans. Offers speech-to-video (BYO agent) and managed Agents. Joining Zoom, Meet, Teams and Webex calls is in beta. — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing)
- A competitor claims <250 ms avatar response (unverified). — [LemonSlice comparison](https://lemonslice.com/i/best-real-time-avatar)

**Simli (Trinity)**
- A rendering-only layer for teams that already have a voice agent. It claims <300 ms speech-to-video. Trinity-2 output is 512 px minimum, 768×768 by default; measured at 512×512 / 25 fps with 16 kHz audio. — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing); [WebRTC.ventures](https://webrtc.ventures/2026/10/real-time-ai-avatar-pipecat-interruption-comparison/)

**LemonSlice**
- LemonSlice-2 is a 20B-parameter model that runs at about 20 fps on a single GPU from a single image, with no per-avatar training. LemonSlice-2.1 followed in Apr 2026, then 2.1 Flash. 2.1 Flash claims 471 ms TTFB for the avatar model alone and 2.04 s end-to-end. LemonSlice claims to be the only provider animating the **entire body**. — [LemonSlice research](https://lemonslice.com/research); [LemonSlice Flash](https://lemonslice.com/blog/lemonslice-flash); [LemonSlice best-avatar article](https://lemonslice.com/i/best-real-time-avatar)

**Synthesia**
- Interactive Avatar API: BYO LLM and speech, with the avatar layer running via LiveKit. **Sessions** (a two-way conversational platform with Roleplay and Survey Sessions) launched 1 Oct 2026 as the full-stack hosted option. — [Synthesia API post](https://www.synthesia.io/post/interactive-avatar-api-real-time-avatars); [Unite.AI](https://www.unite.ai/synthesia-launches-sessions-platform-for-interactive-ai-avatars/)

**Akool Streaming Avatar**
- Streams at 1080p, or up to 4K at double credits. Marketing says it "sees you" (camera perception). A Chinese-language page claims 32 languages. — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing); [Akool](https://www.akool.com/apps/streaming-avatar)

**Runway Characters**
- Launched 9 Mar 2026 on the GWM-1 world model. It works from a single reference image and has a LiveKit Agents integration. Runway reports 37 ms model time per frame and 1.75 s server-side end-of-speech to first response frame (4 May 2026 engineering post). Children, public figures and IP-protected content are disallowed. — [Runway](https://runway.com/news/company-news/introducing-runway-characters); [Runway engineering](https://runway.com/news/engineering/building-runway-characters)

**Google Gemini 3.8 Live with Live Avatar**
- Announced 24 Sep 2026 with "near real-time" video. Supports 97 languages, with lip-sync that adapts when the speaker switches language mid-conversation. Offers preset avatars plus custom avatars from one reference image (enterprise allowlist only). Takes audio and visual input. Output carries SynthID watermarks. Available in Gemini Enterprise, with links to Live API docs. No resolution, latency or pricing is given in the post. — [Google blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-live-with-live-avatar?output=1)

**Microsoft Azure TTS Avatar (real time)**
- 1920×1080 at 25 fps. — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing)

**Others**
- Soul Machines: AppDirect announced it would acquire the company on 28 Sep 2026. UneeQ offers custom CGI up to 4K (sales-quoted). — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing)
- **Hedra sunset its Realtime Avatar product on 15 Apr 2026**, and the LiveKit plugin now errors. Character-3, Hedra's pre-rendered product, continues. — [LiveKit docs](https://docs.livekit.io/agents/models/avatar/plugins/hedra.md)
- Character.AI AvatarFX (Apr 2025) makes pre-rendered clips, not real-time calls. — [TechCrunch](https://techcrunch.com/2025/06/02/chatbot-platform-character-ai-unveils-video-generation-social-feeds)
- Other low-cost or face-only entrants: Spatius (renders on-device), bitHuman, Protoface, Keyframe Labs (720–1080p), TruGen, Avatario (max 1280×720), Akapulu, DigiSelf/EmbodyMe, Realtime Avatar, Talking Avatar (<250 ms claim). — [talking-avatar.dev](https://talking-avatar.dev/compare/avatar-api-pricing)

### Inferences
- **Highest claimed resolution:** D-ID V4 and Akool (up to 4K) and UneeQ (CGI 4K). For photoreal neural rendering in an actual live stream, the strongest documented spec is Tavus Phoenix-4 at 1080p/40 fps. In real WebRTC delivery, however, Tavus stock replicas were measured at 1280×720 / 25 fps, and all four tested vendors arrived at the browser at about 400 kbps VP8. Network transport, not model output, often caps the visible quality.
- **Seeing the user (perception):** Tavus (Raven-1), D-ID V4 (camera layer), Akool, Gemini Live Avatar (visual input) and Tavus Griffin (video-to-video).
- **Full-body:** LemonSlice is the only provider with a documented full-body offering. All the others are head-and-shoulders.
- **Cloning a real person:** Tavus custom replicas (from training video, takes days) and HeyGen custom LiveAvatar (needs 1080p footage for 1080p). Single-image avatars: Anam, Runway, LemonSlice, Gemini, Griffin.

### Gaps
- No official launch post or specs for Tavus Phoenix-4.5; its date and resolution are unconfirmed.
- No pixel/fps specs for Cara-4.1 Express beyond 1152×768 / 25 fps; Gemini Live Avatar resolution and latency are unpublished.
- Language counts for most vendors (Tavus, Anam, HeyGen) were not verified in this pass.
- I found no reliable 2026 information on any OpenAI real-time video avatar product, or on Pika real-time avatars.
- I found nothing on any "Beyond Presence Genesis" model.

## Pricing and free tiers

### Takeaway
Face-only layers cost about $0.01–$0.16/min (Simli is about $0.01, Anam $0.11–0.16, HeyGen LITE $0.079–0.095). Managed full-stack agents cost about $0.16–$0.80/min (HeyGen FULL $0.158–0.19, Tavus $0.24–0.37, D-ID $0.50–0.56, Azure $0.50–0.80). Tavus and D-ID are the priciest of the mainstream options.

### Cited Findings (all from [talking-avatar.dev pricing comparison, verified 30 Oct 2026](https://talking-avatar.dev/compare/avatar-api-pricing) unless noted)
- **Tavus CVI:** $0.24–0.37/min on $22–975/mo plans; overage $0.26–0.35. Free tier 20 min/mo. 30 s minimum per call, billed from call creation.
- **Anam:** $0.11–0.16/min overage on $12–999/mo plans; Enterprise from $0.04. Free tier 30 min/mo (non-commercial). Billed per second, including listening time.
- **HeyGen LiveAvatar:** LITE $0.079–0.095/min, FULL $0.158–0.19/min (2 credits/min) on $99–475/mo plans; Enterprise from $0.01. Free tier of 10 credits/mo with a watermark and 2-min calls.
- Older LiveAvatar plan list: Starter $19/200 credits, Essential $99/1,100, Business $475/6,000 (Starter may have been removed). — [Liforma review](https://www.liforma.ai/resources/heygen-liveavatar-review)
- **D-ID Agents:** $0.50–0.56/min ($0.35–0.45 billed annually) on $18–297/mo plans. 14-day trial with 10 streaming minutes.
- **Beyond Presence:** €0.0875–0.175/min speech-to-video (€49 / €149 / €349 plans), €0.175–0.35/min for managed Agents. Free tier 40 min/mo (non-commercial).
- **Simli:** about $0.01/min; $10–249/mo plans; free tier of $10 credit plus 50 min/mo (commercial use allowed).
- **Synthesia:** $0.10/min avatar-only; full stack $0.20/min ("coming soon" on the pricing page). 500 credits/mo free (about 50 min).
- **Akool:** about $0.16–0.35/min at 1080p; 4K costs double credits. API from the $59/mo plan.
- **Runway Characters:** $0.20/min plus $0.02 per session; sessions cap at 5 min; no free tier.
- **Gemini Live Avatar:** about $0.37 per speaking minute plus voice and tokens (third-party estimate).
- **Azure TTS Avatar:** $0.50–0.80/min.
- **LemonSlice:** $0.16–0.20/min; hosted LLM and voice add $0.09–0.11.
- **Soul Machines:** Pro tier $2,700/mo (about $0.27/min).

### Inferences
- For one person who wants to try a realistic live call cheaply: the Tavus free tier (20 min/mo), the Anam free tier (30 min/mo) and the Beyond Presence free tier (40 min/mo) are the easiest entry points.

### Gaps
- Prices shift often; the figures above are a snapshot from late Oct 2026.

## Independent benchmarks, reviews and sentiment: which looks most realistic?

### Takeaway
No neutral, large-scale benchmark exists. The best independent hands-on test (WebRTC.ventures, Oct 2026) ranked **Tavus most human-looking, then Anam**, and measured Anam fastest to start. An Anam-commissioned blind study (Jan 2026, 178 participants) had Anam leading every dimension. Tavus's own Turing test shows that even its production stack is easily identified as AI (2.4%), while the unreleased Griffin fooled 48% of people. Realism and responsiveness consensus: **Tavus and Anam are the top two; HeyGen LiveAvatar's reviews are mixed.**

### Cited Findings
- **WebRTC.ventures Pipecat test (published 29 Oct 2026; 3 runs, stock avatars, 1 machine):**
  - Time to first frame: Anam 3.5–4.1 s; LiveAvatar 4.5–6.1 s; Simli 8.0–8.3 s; Tavus 8.1–9.8 s.
  - Time for the old answer to stop after an interruption: Simli 1.00–1.07 s; Anam 1.03–1.04 s; LiveAvatar 1.20–1.37 s; Tavus 1.32–1.41 s.
  - Resolution: Tavus and LiveAvatar 1280×720 / 25 fps; Anam 1152×768 / 25 fps; Simli 512×512.
  - On realism, the author wrote: "Tavus, then Anam (subjective)." Tavus mouth movement stops within about 0.1 s of the audio, and replicas come with real backgrounds.
  - — [WebRTC.ventures](https://webrtc.ventures/2026/10/real-time-ai-avatar-pipecat-interruption-comparison/)
- **Mabyduck blind study (Jan 2026, 178 participants):** compared Anam, D-ID, Tavus and HeyGen (it predates D-ID V4). Anam "led on every measured dimension" (visual quality, lip sync, responsiveness, interruptibility). Responsiveness was the strongest predictor of user experience, ahead of visual quality. The study was commissioned by and hosted on Anam's site, so it is not truly neutral. — [Anam buyer's guide](https://anam.ai/blog/best-ai-avatar-platforms-refresh-draft); [Anam on D-ID V4](https://anam.ai/blog/d-id-v4-expressive-visual-agents-what-it-means)
- **Tavus video Turing test (Oct 2026, company-run, 1-min calls):** 26 of 54 participants (48%) judged Griffin-Lite to be human, against only 1 of 41 (2.4%) for the production Phoenix-4.5 + Sparrow-2 + Raven-1 stack. Doubters spotted the AI within about 20 s. Griffin-Lite scored natural 5.4/7 and conversation flow 4.9/7. — [explainx.ai](https://explainx.ai/blog/tavus-griffin-video-turing-test-him-2026)
- **NVIDIA VideoFDB benchmark (Sep 2026):** generation score of Griffin-Lite 3.83 vs human reference 3.92 vs Gemini 2.5 + Anam 2.80. — [explainx.ai](https://explainx.ai/blog/tavus-griffin-video-turing-test-him-2026)
- **HeyGen's own ranking (29 Oct 2026, no live sessions run):** LiveAvatar 9.1, Tavus 8.1, Anam 8.0, LemonSlice 7.9, Simli 7.8, D-ID 7.2, Synthesia 6.4. This is biased and rubric-based. — [HeyGen blog](https://www.heygen.com/blog/best-real-time-ai-avatar-platforms)
- **Other reviews:** one hands-on comparison found Anam's face the most photoreal, then Tavus. Reviewers called HeyGen LiveAvatar "most alive" but said its eye blinks can look artificial. An older subjective evaluation of 10 providers found Tavus mouth movements "not completely natural" in some cases, and Anam realism "very good" but weaker on low bandwidth. — [search synthesis incl. Medium 10-provider evaluation](https://medium.com/@ggarciabernardo/the-live-avatar-landscape-apis-transport-and-subjective-evaluation-of-10-leading-providers-5b5b6e8a54dc); [toughtongueai](https://www.toughtongueai.com/blog/best-virtual-avatar-solutions-2026)

### Inferences
- If visual realism matters most, **Tavus (Phoenix-4/4.5)** is the most frequently cited best-looking real-time human. **Anam (Cara-4.1)** is the strongest overall when responsiveness matters too.
- Tavus Griffin is the step-change to watch, but it is not usable yet.
- Even the best production avatars are still identified as AI by most people within about 20 s.

### Gaps
- No Reddit, HN, G2 or Product Hunt threads surfaced in searches. User-sentiment data is thin and mostly comes from blogs.
- No independent measurement exists of D-ID V4, Beyond Presence, Akool, Runway or Gemini Live Avatar realism or latency.
