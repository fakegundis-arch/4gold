# Professional / premium-grade real-time AI voice conversion (speech-to-speech) services, as of Nov 2026

Research date: 2026-11-14. Most vendor pages carry only a "© 2026" footer and no effective date. Where a page shows its own date, it is flagged. "Real-time" below means a live mic-in to voice-out path usable in a call, at roughly 300 ms or less. "Offline" means you upload or record a clip and get back a converted file.

## Q1. Which high-end providers are truly real-time for live calls, and which are file-only?

### Takeaway
None of the premium TTS/voice-cloning leaders (ElevenLabs, Resemble, Cartesia, Fish Audio) sells a ready-made live voice changer for calls. Their speech-to-speech (STS) products are file/batch APIs, sometimes with streamed output. Live, call-grade conversion comes from a different group of vendors:
- accent-conversion vendors: Sanas, Krisp (~200 ms)
- Altered RealTime Pro: virtual mic, 135 ms algorithmic latency
- Respeecher: real-time only on custom/enterprise or higher-tier plans
- Resemble's developer "Live STS" socket server
- creator desktop apps: Antinode/Supertone Shift (vendor-claimed 47 ms), MetaVoice Live, Koe Recast

### Cited Findings

**ElevenLabs (Voice Changer / speech-to-speech): offline / file-based**
- The official Voice Changer docs describe transforming "recorded or uploaded" source audio. Limits: 5 minutes per segment (longer audio must be chunked). Recommended model `eleven_multilingual_sts_v2`; `eleven_english_sts_v2` also exists. Optional `remove_background_noise=true`. No live mode is described. — [ElevenLabs docs: Voice changer](https://elevenlabs.io/docs/product/speech-synthesis/speech-to-speech)
- The API's "stream" variant is `POST /v1/speech-to-speech/{voice_id}/stream` with multipart form data, so the full input file goes up and only the output streams back. No WebSocket STS endpoint was found. ElevenLabs' WebSocket endpoints are for TTS (`wss://api.elevenlabs.io/v1/text-to-speech/{voice_id}/stream-input`) and realtime speech-to-text (`/v1/speech-to-text/realtime`). — [ElevenLabs API ref: speech-to-speech stream](https://elevenlabs.io/docs/api-reference/speech-to-speech/stream.md); [ElevenLabs: Generate audio in real-time](https://elevenlabs.io/docs/eleven-api/guides/how-to/websockets/realtime-tts)
- ElevenLabs has a "Conversational Voice Changer" landing page whose meta description says "Transform your voice in real-time". The page body only describes recording or uploading audio and then "download the file, and use it in your project". It mentions no latency, virtual mic, or desktop app. — [ElevenLabs Conversational Voice Changer page](https://elevenlabs.io/voice-changer/conversational)
- ElevenLabs' own Zoom guide says the company "primarily focuses on text-to-speech". For live calls it suggests routing audio through a third-party tool such as Voicemod. — [ElevenLabs blog: best voice changer for Zoom](https://elevenlabs.io/blog/the-best-voice-changer-for-zoom)
- A 2026 article from Deepgram (a competitor) says ElevenLabs' latency is too high for live real-time interactions. Treat it as competitor commentary. — [Deepgram: Is ElevenLabs Real-Time?](https://deepgram.com/learn/is-elevenlabs-real-time-what-developers-need-to-know)
- ElevenLabs' fast TTS models are low-latency, but they are TTS, not voice conversion:
  - Eleven v4 Turbo: ~100 ms median inference and ~150 ms median time to first speech (model time only), per the ElevenLabs TTS page as summarized in search. — [ElevenLabs TTS page](https://elevenlabs.io/text-to-speech)
  - Flash v2.5: 75 ms, per a third-party cheat sheet. — [Webfuse ElevenLabs cheat sheet 2026](https://www.webfuse.com/elevenlabs-cheat-sheet)

**Respeecher: offline in the Marketplace; real-time only for custom/enterprise (conflicting signals)**
- The official FAQ says real-time conversion is "in use by corporate clients" and handled per project. It answers "can I convert in real time" with "Yes, but only with a customer plan". It also says "at this time, real-time conversion is not available in Voice Marketplace" and costs "considerably more". No latency is published. — [Respeecher FAQ](https://www.respeecher.com/faq)
- Contradiction: the current Marketplace pricing page shows "Real-time: Yes" for the Creator ($89/mo), Power ($499/mo) and Enterprise tiers, and not for Pay-as-you-go. It may refer to real-time TTS, since Respeecher also sells a "Respeecher Space" real-time TTS API. — [Respeecher Marketplace pricing](https://respeecher.com/marketplace/pricing). The FAQ statement conflicts with it.
- Respeecher Space is a TTS API, not voice conversion. Third-party listings give it streaming latency under 200 ms and $2 per 60,000 characters. These are secondary sources. — [search summary of Respeecher real-time TTS API page](https://respeecher.com/real-time-tts-api)

**Resemble AI: STS docs are file-based; a separate developer "Live STS" socket exists**
- Official STS docs:
  - Endpoint `POST https://f.cluster.resemble.ai/synthesize`. The donor audio is a WAV fetched by HTTPS URL inside a `<resemble:convert>` tag.
  - Limits are 50 MB / 5 minutes. The response returns the whole clip as base64.
  - Options: `pitch` (-10 to 10) and a `prompt` to steer accent/tone. Output sample rates 8–44.1 kHz.
  - No latency or live mode is stated. — [Resemble docs: speech-to-speech](https://docs.resemble.ai/voice-generation/speech-to-speech)
- Resemble publishes a GitHub sample client, `resemble-live-sts-socket`. It connects to a "Live STS server" over Socket.IO and is described as achieving real-time voice conversion on an M2 MacBook Air client. This is developer setup, not a consumer app. — [ecosyste.ms listing of resemble-ai/resemble-live-sts-socket](https://awesome.ecosyste.ms/projects/github.com%2Fresemble-ai%2Fresemble-live-sts-socket)
- Resemble's streaming WebSocket (TTS, `wss://websocket.cluster.resemble.ai/stream`) is limited to Business plans and above. G2 lists "Real-Time Speech-to-Speech" as a Business-tier feature. — [Resemble streaming websocket docs](https://docs.resemble.ai/voice-generation/text-to-speech/streaming-websocket.md); [G2 Resemble pricing](https://www.g2.com/products/resemble-ai/pricing)
- Resemble markets its streaming API at "< 250 ms". The ~75 ms figure cited by third parties is for its Chatterbox Turbo TTS, not end-to-end STS. — [Resemble: fastest TTS API](https://www.resemble.ai/resources/fastest-text-to-speech-api-real-time-conversion)

**Cartesia: Voice Changer endpoint exists, no live/streaming STS evidence**
- Cartesia's platform includes a "Voice Changer endpoint for audio transformation", plus Ink-Whisper STT and Infill. No streaming or latency details for the Voice Changer were found. — [Cartesia changelog 2025](https://docs.cartesia.ai/changelog/2025)
- Cartesia's latency figures all apply to Sonic TTS:
  - Sonic 3: 90 ms model latency, ~190 ms end-to-end
  - Sonic 3.5: ~188 ms P50 time-to-first-audio (Coval benchmark)
  - Sonic Turbo: 40 ms model latency
  - [invideo: Cartesia Sonic 3 and 3.5 (2026)](https://invideo.io/blog/cartesia-sonic-ai-voice/)

**Fish Audio: the voice changer is file upload; real-time claims are about TTS/agents**
- The official Voice Changer page describes uploading a clip, choosing a target voice, and getting a converted file. "Most clips process in under 30 seconds end-to-end." It runs in the browser with no install, and there is no mic streaming or virtual mic. — [Fish Audio voice changer](https://fish.audio/voice-changer/)
- One third-party comparison says Fish Audio describes itself as a real-time voice changer for Windows 10/11 and macOS. This could not be confirmed on Fish Audio's own pages. — [search summary, aitoolsatlas Fish Audio](https://aitoolsatlas.ai/tools/fish-audio)
- Fish Audio's homepage promotes "Live 3", a full-duplex voice model that "listens while it speaks". This is a conversational-agent model, not a voice changer. A July 2026 news item reports a $52M seed round and S2.1 Pro TTS. — [Fish Audio homepage](https://fish.audio); [noqta.tn July 2026](https://noqta.tn/en/news/fish-audio-52m-seed-voice-ai-s21-pro-2026)

**Altered AI (RealTime Pro): genuinely real-time, call-ready**
- "RealTime Pro for Voice & Video Calls" "presents itself as a microphone". It names Discord, Zoom, Microsoft Teams, Google Meet, Skype, WhatsApp and call-centre telecom software. — [Altered RealTime Pro](https://altered.ai/real-time-pro)
- Official FAQ: "algorithmic latency of 135 ms", "the lowest in the market amongst the effects that change the accent". Overall latency depends on CPU speed and the cores allocated. — [Altered FAQ: latency](https://www.altered.ai/faqs/what-is-the-latency-of-the-real-time-voice-changer)
- It runs on "commodity CPUs" with Local Compute (voice data "never leaves your PC"), or on Cloud Compute with a daily cloud-hours allowance. — [Altered RealTime Pro](https://altered.ai/real-time-pro)
- Staleness flag: the page footer reads "2022-2023". — [Altered RealTime Pro](https://altered.ai/real-time-pro)

**Sanas (accent translation): real-time, enterprise / contact-centre**
- Developer docs price Accent Translation model AT5.2 per minute on Sanas Cloud (see Q2). The model spec lists "streaming latency" but gives no number. — [Sanas developer pricing](https://developer.sanas.ai/Docs/Resources/Pricing.md); [Sanas accent translation docs](https://developer.sanas.ai/accent-translation)
- A third-party brand site claims "<20 ms" latency, which is unverified. In March 2026 Sanas launched Real-Time Language Translation covering 13+ languages. — [search summary: geo.sig.ai Sanas](https://geo.sig.ai/brands/sanas-ai.md); [techintelpro: Sanas launches real-time speech translation](https://techintelpro.com/news/ai/enterprise-ai/sanas-launches-real-time-speech-translation-and-enhancement)

**Krisp (AI Accent Conversion): real-time, ~200 ms**
- Launch coverage says accent conversion adds about 200 ms of processing latency. — [heise: Accent-free meetings](https://heise.de/-10328049)
- Output is limited to a North American / US English accent. — [Creative Bloq](https://www.creativebloq.com/ai/new-ai-tech-can-change-your-accent-but-only-to-north-american); [Krisp pricing](https://krisp.ai/pricing/) (call-centre customer-side conversion is "US English output")

**Antinode Audio Shift (formerly Supertone Shift; HYBE-owned Supertone): real-time desktop app**
- Supertone's original materials claimed "best-in-class latency (down to 47ms)". This is a vendor claim with no independent benchmark. — [search summary: supertone.ai/shift, MBW coverage](https://musicbusinessworldwide.com/hybe-owned-supertones-new-ai-voice-changer-lets-artists-change-their-vocals-in-real-time)
- The supertone.ai/shift URL now 301-redirects to antinodeaudio.com/shift. The page is labelled "Formerly Supertone Shift" and run by Antinode Audio Co., Ltd. It claims "best-in-class latency, as close as possible to real-time" but no longer states a ms figure. — [Antinode Shift](https://antinodeaudio.com/shift)

**MetaVoice Live: real-time on-device**
- MetaVoice's setup FAQ describes "real-time on-device AI voice changing". For higher quality it points users to MetaVoice Studio, which is offline. No latency figure was found. — [MetaVoice Live Setup Guide/FAQ](https://metavoice.notion.site/MetaVoice-Live-Setup-Guide-FAQs-ba0f672c2e244632adbb828bb4d27b99)

**Koe Recast: real-time, latency unverified**
- News coverage confirms it works in real time but gives no numbers. A low-reliability directory page claims "sub-100ms latency on consumer-grade GPUs". — [findailist Koe Recast (preview page)](https://preview.findailist.com/tools/koe-recast)

**Kits.ai: not a live-call tool**
- A third-party blog says cloud platforms such as Kits.ai, Jammable and Musicfy "don't advertise latency figures because real-time output isn't their use case". It describes Kits.ai as browser-based, with a free tier of 15 min/month. — [Singing voice changer plugin vs platform (2026)](https://blog-5s7.pages.dev/blog/singing-voice-changer-plugin-vs-platform/)

**Reference latency ranges for consumer/desktop voice changers (vendor-affiliated blog, not independent)**
- Typical figures are DSP ~25–45 ms, AI on GPU ~80–130 ms, and AI on CPU ~280–380 ms. An RTX 3060 is called the "practical minimum" for comfortable real-time AI voice changing. — [Voxbooster: real-time AI voice changer](https://voxbooster.com/blog/real-time-ai-voice-changer); [Voxbooster: sub-100ms tools compared](https://voxbooster.com/blog/real-time-voice-changer)
- One blog in the same series says anything above 500 ms "isn't real-time in a meaningful sense". — [Voxbooster blog](https://voxbooster.com/blog/low-latency-voice-changer)

### Inferences
- "Premium STS quality" and "live call usability" are largely separate product lines in 2026. The vendors with the best-regarded offline conversion (ElevenLabs, Respeecher Marketplace, Resemble STS API, Fish Audio) take a whole clip in and return a file, with clip limits of 5 min on both ElevenLabs and Resemble.
- A DIY live pipeline is possible: chunk mic audio, send it to ElevenLabs' `/speech-to-speech/{voice_id}/stream`, and play the output into a virtual audio cable. It would carry HTTP round-trip and per-chunk model latency, and most likely sit well above the ~135–200 ms of purpose-built tools. No published measurement was found.
- The named, measured live latencies come from Altered (135 ms algorithmic, CPU), Krisp (~200 ms) and Shift (47 ms vendor claim, older pages). These sit in or near the vendor-blog ranges for local AI changers on GPU (80–130 ms) and CPU (280–380 ms). Pro-grade live tools are therefore not clearly lower-latency than good consumer apps. Their difference is in licensing, accent-specific models, enterprise deployment, and cloud offload.

### Gaps
- No official latency figure for Respeecher enterprise real-time, Resemble Live STS, Sanas AT5.2, Koe Recast, MetaVoice Live, or the Cartesia Voice Changer.
- No confirmation of a WebSocket/real-time STS endpoint from ElevenLabs or Cartesia as of Nov 2026. If one launched in late 2026, it did not surface in search.
- Speechify and Voice-Swap: no relevant real-time STS information found in this pass. Voice-Swap appears to be a music/singing conversion service, but this is unverified.
- The ElevenLabs changelog was not checked directly for late-2026 additions.

## Q2. What are the pricing and credit models (per-minute cost, tiers, minimum spend)?

### Takeaway
Pro STS is priced either per minute of audio or as consumption of TTS-style credits:
- ElevenLabs: 1,000 characters per minute
- Respeecher: about $0.50–$1.00 per STS minute
- Sanas API: $0.009/min for accent translation
- Krisp: seat subscription, $8–$30 per user per month with daily accent-conversion caps
- Altered and Respeecher real-time: priced on request or in higher tiers

### Cited Findings
- **ElevenLabs:** Voice Changer usage is "billed at 1,000 characters per minute of processed audio", i.e. drawn from the same character/credit quota as TTS. — [ElevenLabs docs: Voice changer](https://elevenlabs.io/docs/product/speech-synthesis/speech-to-speech)
- **Respeecher Marketplace, Pay-as-you-go** (credits carry over 1 year; real-time not included):
  - $5 for 5 min STS ($1.00/min)
  - $15 for 16 min ($0.94/min)
  - $27 for 30 min ($0.90/min)
  - $70 for 100 min ($0.70/min)
  - $250 for 500 min ($0.50/min)
  - [Respeecher Marketplace pricing](https://respeecher.com/marketplace/pricing); [Respeecher FAQ](https://www.respeecher.com/faq)
- **Respeecher subscriptions** (minutes do not roll over):
  - Creator: $89/mo ($74/mo billed yearly), 90 STS min + 400k TTS chars, ≈$0.99/min
  - Power: $499/mo ($414/mo yearly), 900 STS min + 3M chars, ≈$0.55/min
  - Both show 50% off the first month. Enterprise is custom.
  - The page has typos ("$44,50") and inconsistent TTS character counts, and no effective date. — [Respeecher Marketplace pricing](https://respeecher.com/marketplace/pricing)
- **Respeecher other terms:** a free 3-day trial (no commercial use), and refunds within 30 days are "usually approved" if no conversions were made. — [Respeecher FAQ](https://www.respeecher.com/faq)
- **Resemble AI** (third-party figures that conflict with each other):
  - A comparison site says STS is on the usage-based Flex plan at a flat $0.0005/second (≈$0.03/min).
  - Another site gives $0.001/second (≈$0.06/min) for low-latency real-time synthesis.
  - The official pricing page was not retrieved. — [usagepricing: Resemble](https://usagepricing.com/blueprint/resemble-ai); [aitoolsatlas: Resemble pricing](https://aitoolsatlas.ai/tools/resemble-ai/pricing)
- **Sanas API, per minute on Sanas Cloud:**
  - Accent Translation AT5.2: $0.0090
  - Speech Enhancement: $0.0040
  - Agentic Speech Enhancement: $0.0043
  - Language Translation: $0.0900
  - SDK pricing and volume discounts via sales. — [Sanas developer pricing](https://developer.sanas.ai/Docs/Resources/Pricing.md)
- **Sanas, AWS Marketplace:** a 12-month contract for Accent Translation for 100 users at $72,000 (≈$720/seat/yr), plus Speech Enhancement for 100 users at $18,000. — [AWS Marketplace Sanas listing](https://aws.amazon.com/marketplace/pp/prodview-mr5luwansb4k6)
- **Krisp Meeting AI, per user:**
  - Free Trial: 7 days, no card
  - Core: $16/mo or $8/mo annual, with accent conversion 1 hr/day
  - Advanced: $30/mo or $15/mo annual, with speaker accent conversion 4 hr/day and unlimited listener-side conversion
  - Enterprise: custom
  - [Krisp pricing](https://krisp.ai/pricing/)
- **Krisp Call Center AI:** CC Core is $15/agent/mo (annual) with no accent conversion. CC Advanced (price not listed) includes agent and customer accent conversion. — [Krisp pricing](https://krisp.ai/pricing/)
- **Krisp Developer API:** Voice Translation costs $4.00/hr on Starter (no monthly fee, $30 free credits) or $3.00/hr on Growth ($400/mo). The accent-conversion SDK is Enterprise only. — [Krisp pricing](https://krisp.ai/pricing/)
- **Krisp, Aug 2026 change** (single third-party tracker, treat with caution): Core's listener-side accent conversion was reduced from unlimited to 1 hr/day. — [pricingsaas Krisp diff 2026W33](https://pricingsaas.com/companies/krisp/diffs/2026W33)
- **Altered:**
  - RealTime Pro shows no prices on its page. It mentions monthly/annual, Team and Enterprise plans, prepaid credits, and Cloud Compute hours. — [Altered RealTime Pro](https://altered.ai/real-time-pro)
  - Third-party figures conflict: Altered Studio "from $12/month (Indie)" versus "paid Individual plans starting at $19 per month". — [search summaries: aitoolsatlas Altered Studio](https://aitoolsatlas.ai/tools/altered-studio); [devtoollab Altered](https://devtoollab.com/ai-tools/altered-ai)
- **Antinode / Supertone Shift** (pricing effective 17 Apr 2025, per page):
  - Free: 100+ voices via monthly credits, with 3,000 free credits on download
  - Starter: $3.99/mo (promo $1.99/mo)
  - Pro: $14.99/mo
  - Perpetual: $149.99 per voice
  - Earlier Supertone-era pricing: a ~$49 license plus ~$9/mo per voice. — [Antinode Shift](https://antinodeaudio.com/shift); [search summary of supertone.ai/ja/shift](https://supertone.ai/ja/shift)
- **Fish Audio:** the signed-in free plan gives 8,000 monthly credits. One third-party review says paid plans start at $15/mo. — [Fish Audio voice changer](https://fish.audio/voice-changer/); [tooljunction Fish Audio](https://www.tooljunction.io/ai-tools/fish-audio)

### Inferences
- **Cost per hour of live use:**
  - Sanas API: ≈$0.54/hr of accent translation at $0.009/min
  - Krisp Developer voice translation: $3–4/hr
  - Respeecher STS (offline): $30–60/hr at $0.50–$1.00/min
- On ElevenLabs, 1 hour of voice changing uses 60,000 characters of quota. If anyone ran it continuously as a live call pipeline, it would burn subscription credits fast.
- **Minimum spend:**
  - lowest: Krisp Core at $8/mo annual, Respeecher $5 credit pack
  - highest: Sanas enterprise (the AWS contract is $72k/yr for 100 seats) and Respeecher real-time ("considerably more", custom)

### Gaps
- Current ElevenLabs plan prices and credits per tier (needed to convert 1,000 chars/min into $/min) were not retrieved this pass.
- Official Resemble pricing for STS and real-time STS was not retrieved, and the third-party per-second rates conflict.
- Altered RealTime Pro list prices and Koe Recast / MetaVoice Live pricing were not found.

## Q3. How does quality and realism compare, and are there independent tests or arenas?

### Takeaway
I found no independent arena or benchmark that ranks voice *conversion* (STS) quality across vendors. Public arenas and latency benchmarks cover TTS. Quality claims for live voice changers are vendor marketing or vendor-affiliated blogs.

### Cited Findings
- A 2026 roundup claims ElevenLabs and Respeecher score above 4.5/5 MOS for naturalness. It gives no methodology or test details, so treat it with caution. — [fast.io: Best AI Voice Changers 2026](https://fast.io/resources/best-ai-voice-changers-2026/)
- Independent-style latency benchmarks found were for TTS, e.g. Coval's measurement of Cartesia Sonic 3.5 at ~188 ms P50 time-to-first-audio, not for voice conversion. — [invideo: Cartesia Sonic 3/3.5](https://invideo.io/blog/cartesia-sonic-ai-voice/); [async.com TTS latency vs quality benchmark](https://async.com/blog/tts-latency-vs-quality-benchmark/)
- Product Hunt reviews of Supertone Shift are mixed. Users praise ease of use, low latency and realistic voices. — [Product Hunt: Supertone Shift reviews](https://www.producthunt.com/products/supertone-shift/reviews)
- Altered's RealTime Pro offers 20 "Voice Skins". MetaVoice itself steers users to its offline Studio for "superior quality", which implies a trade-off between live and offline quality. — [Altered RealTime Pro](https://altered.ai/real-time-pro); [MetaVoice Live FAQ](https://metavoice.notion.site/MetaVoice-Live-Setup-Guide-FAQs-ba0f672c2e244632adbb828bb4d27b99)
- A Sacra analysis argues that Sanas's technical lead in latency and speaker-identity preservation may narrow, shifting competition to price and distribution. — [Sacra: Sanas technical moat narrowing](https://sacra.com/chat/h/c26630c4-ca7d-41f7-9944-ebefdfdcd0f3/)

### Inferences
- Since there are no STS arenas, any "pro vs consumer" quality claim in a final report should be framed as vendor-reported or anecdotal.
- The highest-fidelity premium conversion is offline: Respeecher (Hollywood productions since 2019) and ElevenLabs STS v2. Live products trade fidelity for latency, which MetaVoice itself acknowledges. Accent converters (Sanas, Krisp) aim to preserve speaker identity rather than to sound like a different person.

### Gaps
- No independent blind A/B or MOS study comparing live pro tools (Altered, Shift, Koe Recast, Respeecher real-time) against consumer apps (Voicemod etc.) was found.
- No independent end-to-end mic-to-output latency measurements were found for any named pro vendor.

## Q4. What are the practical deployment details: voice cloning, desktop app vs API, virtual mic, Windows/Mac, cloud requirement?

### Takeaway
Only a few pro-grade products are "install and select as microphone":
- Altered RealTime Pro
- Antinode Shift
- MetaVoice Live
- Krisp, as a meeting-app layer

The rest (ElevenLabs, Resemble, Cartesia, Sanas API, Respeecher) are web apps or APIs needing developer setup. Cloning your own target voice is easy on ElevenLabs and Fish Audio for offline use. Respeecher needs a custom plan, and cloning a custom target voice is not advertised for the live desktop tools.

### Cited Findings
- **ElevenLabs:** any cloned or designed voice in your library can be the STS output voice (`voice_id`). Access is web app or API, with no virtual mic. — [ElevenLabs docs: Voice changer](https://elevenlabs.io/docs/product/speech-synthesis/speech-to-speech); [ElevenLabs Zoom guide](https://elevenlabs.io/blog/the-best-voice-changer-for-zoom)
- **Respeecher:**
  - Marketplace is a web app with a Pro Tools plugin; no desktop app is mentioned.
  - Converting into your own voice "requires a custom plan" because training takes extra time and resources.
  - The FAQ says "Respeecher does not provide any public API for creating voices", while elsewhere mentioning an API. — [Respeecher FAQ](https://www.respeecher.com/faq)
- **Resemble:**
  - STS is an API: donor WAV URL in, base64 clip out.
  - Live STS needs a Socket.IO client against Resemble's Live STS server; the sample client runs on an M2 MacBook Air.
  - A LiveKit plugin and Pipecat integration exist for its TTS. — [Resemble STS docs](https://docs.resemble.ai/voice-generation/speech-to-speech); [resemble-live-sts-socket](https://awesome.ecosyste.ms/projects/github.com%2Fresemble-ai%2Fresemble-live-sts-socket); [PyPI livekit-plugins-resemble](https://pypi.org/project/livekit-plugins-resemble)
- **Altered RealTime Pro:**
  - Desktop virtual microphone. The page shows Windows and Mac download buttons, but the FAQ says it "is available on Windows".
  - Local CPU processing or optional Cloud Compute; "commodity CPUs", with no GPU requirement listed.
  - Speaker isolation is based on a "Voiceprint". Custom cloning for the live product is not described. — [Altered RealTime Pro](https://altered.ai/real-time-pro)
- **Antinode / Supertone Shift:**
  - Desktop app v2.1 for Windows 10+ (64-bit only) and macOS 10.14+; "No GPU Required".
  - Its current page mentions neither a virtual mic nor voice cloning (only "blend your voice with character voices").
  - The credits model suggests a server component, but this is not confirmed. — [Antinode Shift](https://antinodeaudio.com/shift)
- **Krisp:**
  - The Developer SDKs support Windows, Mac, Linux, Web, iOS and Android, plus LiveKit, Pipecat and WebRTC.
  - The developer API runs in Krisp's cloud; SDKs run "on-device or on-server" under Enterprise.
  - Speaker-side accent packs: Indian, Filipino, South African, LatAm. — [Krisp pricing](https://krisp.ai/pricing/)
- **Sanas:**
  - Cloud API (Sanas Cloud) with an SDK available via sales. Contact-centre integrations exist, e.g. a Talkdesk AppConnect listing. — [Sanas developer pricing](https://developer.sanas.ai/Docs/Resources/Pricing.md); [Talkdesk AppConnect: Sanas](https://appconnect.talkdesk.com/apps/sanas-real-time-speech-understanding-platform)
- **Fish Audio:**
  - Browser-only voice changer.
  - A custom target voice can be cloned from about 10 seconds of clean audio and then used in the voice changer (offline).
  - Fish says its community library holds over 2 million voices. — [Fish Audio voice changer](https://fish.audio/voice-changer/); [Fish Audio blog](https://fish.audio/blog/best-real-time-ai-voice-changers/)
- **MetaVoice Live:** an on-device real-time app with a setup guide on Notion. — [MetaVoice Live FAQ](https://metavoice.notion.site/MetaVoice-Live-Setup-Guide-FAQs-ba0f672c2e244632adbb828bb4d27b99)
- **Hardware:** a vendor-affiliated blog calls an RTX 3060 the practical minimum for local real-time AI voice changing. Altered and Shift claim CPU-only operation. — [Voxbooster](https://voxbooster.com/blog/real-time-ai-voice-changer); [Altered](https://altered.ai/real-time-pro); [Antinode Shift](https://antinodeaudio.com/shift)

### Inferences
- If you want your *own cloned target voice* live in a call, there is no turnkey pro option in this set. You would need Respeecher's custom/enterprise real-time, Resemble Live STS (developer), or a DIY pipeline on ElevenLabs/Fish clones.
- Turnkey live tools offer preset voices (Altered skins, Shift character voices) or accent conversion (Krisp, Sanas).
- Internet requirements differ. Altered Local Compute and MetaVoice Live run on-device. ElevenLabs, Resemble, Sanas Cloud, Krisp API and Respeecher are cloud-based.

### Gaps
- Mac support status for Altered RealTime Pro is contradictory on its page.
- Whether Antinode Shift processes locally or in the cloud is not stated.
- Koe Recast platform support and pricing were not found.

## Q5. What are the consent and voice-cloning policies and verification requirements?

### Takeaway
Of the vendors checked, Respeecher and ElevenLabs have the most explicit rules. Respeecher requires written consent from the voice owner. ElevenLabs gates Professional Voice Cloning behind verification and blocks "no-go" (celebrity/high-risk) voices. Fish Audio's voice-changer page shows no consent gate, and the live desktop tools publish little.

### Cited Findings
- **Respeecher:**
  - Requires "written consent" from voice owners before work starts and prohibits deceptive uses.
  - Does not clone private individuals or actors without consent. Celebrities need explicit consent; deceased voices need estate/family permission.
  - Calls deepfakes unethical unless educational and clearly labelled. Says it is developing a synthetic-speech detector and audio watermarking. — [Respeecher FAQ](https://www.respeecher.com/faq)
- **ElevenLabs:**
  - A "no-go voices" safeguard detects and blocks creating clones of specific voices, aimed at preventing misinformation; the terms already prohibit impersonation. — [ElevenLabs Help: What are No-Go Voices?](https://elevenlabs.io/docs/help-center/legal/what-are-no-go-voices)
  - Only human-verified Professional Voice Clones can be shared in the Voice Library. — [ElevenLabs: sharing in Voice Library](https://elevenlabs.io/docs/help-center/product/voices/voice-library/can-i-share-an-ai-generated-voice-in-the-voice-library)
  - Its safety policy gates Professional Voice Cloning behind a "technological verification requirement", and celebrity/high-risk voices are blocked at product level.
  - Third-party guides conflict on whether only your own voice can be PVC-cloned and whether verification now covers instant clones. — [conductatlas: ElevenLabs safety policy](https://conductatlas.com/platform/elevenlabs/elevenlabs-safety-policy/); [aiproductivity: ElevenLabs cloning ethics](https://aiproductivity.ai/guides/elevenlabs-voice-cloning-ethics/)
- **Resemble:** sells real-time deepfake detection and watermarking, with a Teams integration and an on-prem/air-gapped option, plus voice "Identity" enrollment. The page cites an August 2026 benchmark. — [Resemble detection page](https://www.resemble.ai/?p=237206)
- **Fish Audio:** the voice-changer page describes no consent requirement for cloning. It covers privacy only (files not shared, demo clips discarded, cloned voices can be private). — [Fish Audio voice changer](https://fish.audio/voice-changer/)
- **Krisp:** sells a "Voice Security" add-on for deepfake and fraud detection. — [Krisp pricing](https://krisp.ai/pricing/)
- **Altered:** links to an "Ethics" page whose content was not retrieved. — [Altered RealTime Pro](https://altered.ai/real-time-pro)

### Inferences
- Live, call-grade voice changing into a *specific real person's* voice is exactly where policies are strictest. Respeecher requires written consent, and ElevenLabs blocks celebrity voices and verifies PVC. Vendors offering live conversion mostly sell preset or accent voices, not arbitrary clones.

### Gaps
- Resemble's current consent/verification process for cloning (e.g. a spoken consent statement) was not retrieved this pass.
- Consent policies for Altered, Antinode Shift, Koe Recast, MetaVoice, Sanas and Cartesia's voice changer were not confirmed.
