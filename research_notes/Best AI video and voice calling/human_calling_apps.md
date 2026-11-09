# Human-to-Human Video and Voice Calling Apps: Video/Audio Quality and AI Features (as of Nov 2026)

Research date: 2026-11-09. 15 tool calls, mostly search snippets plus 3 page fetches. Dates are flagged wherever a source is older than 2026. Many details come from search-result summaries rather than full fetched pages; these are marked "(snippet)".

## Q1. Max resolution, frame rate, codecs and audio quality by app (plans/devices)

### Takeaway
On published specs, Zoom with its paid Enhanced Media add-on is the highest-quality mainstream meeting app as of 2026: 1080p60 participant video at 8–12 Mbps. Standard Zoom, Google Meet (paid) and Teams top out at 1080p, and Teams 1080p is documented mainly for town halls. True 4K camera calls exist only on hardware endpoints (Cisco devices, Google Beam/HP Dimension) or in studio *recording* tools (Riverside, StreamYard). Discord leads on gaming/screen streams at 4K60 with AV1 under Nitro.

### Cited Findings
**Zoom**
- Zoom's official bandwidth doc gives these specs for **Standard Media**:
  - Participant video: 1080p at 30 fps, 4–6 Mbps.
  - Content share: 1080p30, 2560x1440 at 30 fps, or 4K at 10–15 fps.
  - Downlink: up to 30 Mbps.
  — [Zoom Technical Library – Bandwidth control settings](https://library.zoom.com/technical-library/de/administrationsbereich/network-management/quality-of-service-and-network-best-practices-explainer/bandwidth-control-settings)
- The same doc gives these specs for the **Enhanced Media add-on**:
  - Participant video: 1080p at 60 fps, 8–12 Mbps.
  - Content share: 1080p60, or 4K at 10–15 fps.
  - Downlink: up to 100 Mbps in "High Bandwidth Mode".
  - Encoding: simultaneous 720p and 1080p layers.
  - Gallery view: 1080p for 1–4 participants and 720p for 5–9 (versus 360p for 2–9 on Standard).
  - Limit: 100 participants. Above that, the meeting reverts to Standard.
  - Zoom Rooms: 60 fps and higher bitrate are "coming soon."
  — [Zoom Technical Library](https://library.zoom.com/technical-library/de/administrationsbereich/network-management/quality-of-service-and-network-best-practices-explainer/bandwidth-control-settings)
- The Enhanced Media add-on costs $25/month. It is described as "high quality media enhancements for professional collaboration and production environments." The packaging change was tracked in the week of Mar 16–23, 2026. — [PricingSaaS Zoom diff 2026W13](https://pricingsaas.com/companies/zoom/diffs/2026W13)
- In a Zoom community thread from Sept 2026, a user with the add-on reports still not getting Full HD speaker view after configuring it as documented. This is anecdotal. — [Zoom Community](https://community.zoom.com/meetings-2/1080p-in-zoom-meetings-with-the-enhanced-media-add-on-configured-as-documented-still-not-getting-full-hd-82165)
- Ecamm (a third-party vendor) describes the add-on the same way: higher-bitrate streams and higher bandwidth for meetings owned by the licensed account (snippet). — [Ecamm blog](https://ecamm.com/blog/professional-zoom-interviews-the-ultimate-guide-to-using-ecamm-zoom-for-broadcast-quality-video/)

**Google Meet**
- Google lists the following among premium (paid) Meet features: 1080p video (adjustable send/receive), noise cancellation, adaptive audio, Studio sound/look/lighting, portrait touch-up, Speech Translation, translated captions and "Take notes for me". — [Google Meet Help: Premium Meet features](https://support.google.com/meet/answer/10459644?hl=en)
- Eligible plans:
  - Google One Premium 2 TB, AI Pro and AI Ultra.
  - Workspace Individual, Business Starter through Enterprise Plus, Frontline Plus, Education tiers and Essentials.
  — [Google Meet Help](https://support.google.com/meet/answer/10459644?hl=en)
- I found no evidence of 4K in Meet calls. Meet rooms on ChromeOS hardware send 1080p in Spotlight, on large screens or when pinned (third-party snippet). — [jotme.io](https://www.jotme.io/blog/google-meet-new-features)

**Google Beam (formerly Project Starline), 3D video**
- HP Dimension with Google Beam:
  - US list price: $24,999 for hardware only. The Beam license is sold separately and its price is unpublished.
  - Shipping as of Sept 2026 to the US, Canada, the UK, France, Germany and Japan.
  - Bookable rooms at Industrious offices in Atlanta, Chicago, NYC and Palo Alto.
  — [shashi.co, Oct 2026](https://www.shashi.co/2026/10/google-ships-life-size-beam-rooms-to.html); [heise](https://heise.de/-10443802); [Road to VR (June 2025)](https://roadtovr.com/hp-dimension-google-beam-price-release-date/)
- HP Japan pricing, with sales from Oct 2026 (tax included):
  - Wall-mount: ¥6,598,900.
  - Floor stand: ¥7,546,000.
  — [HP Japan press release, 2026-08-27](https://jp.ext.hp.com/info/newsroom/2026/20260827/)
- Beam is a 65-inch light-field 3D display that is enterprise-focused and currently limited to one-on-one calls. — [MobileSyrup](https://mobilesyrup.com/?p=1006136); [smartwatchlife.jp](https://www.smartwatchlife.jp/82797/)

**Microsoft Teams**
- 1080p in Teams town halls:
  - Teams Premium feature, targeted release Nov 2025, GA Jan 2026.
  - Enabled through the TownhallMaxResolution policy. Requires about 4 Mbps per stream and Ultra-Low Latency streaming.
  - Adapts down to 720p/540p.
  - Supported on desktop, macOS, iOS, Android, MTR-A and web.
  — [Microsoft Learn: enable 1080p (town hall)](https://learn.microsoft.com/en-nz/microsoftTeams/enable-1080p-video-resolution-town-hall); [MC1178507](https://mc.merill.net/message/MC1178507)
- From Apr 1, 2026, some features that previously required Teams Premium are included in Teams Enterprise. A third-party blog lists 1080p streaming among them (snippet; verify). — [jotme.io Teams update](https://www.jotme.io/de/blog/microsoft-teams-update); [Microsoft Learn](https://learn.microsoft.com/en-in/MicrosoftTeams/enable-1080p-video-resolution)
- Microsoft Learn also has a general "enable 1080p video resolution" page for meetings, but I did not fetch it, so its plan/device conditions are unverified. — [Microsoft Learn](https://learn.microsoft.com/en-in/MicrosoftTeams/enable-1080p-video-resolution)
- AV1 in Teams is reported for **screen sharing**: about 200 kbps, 63% lower than before. This is older coverage, roughly 2023–24. — [Windows Report](https://windowsreport.com/microsoft-teams-gets-the-av1-codec-for-crisp-video-screen-sharing/); [MSPowerUser](https://mspoweruser.com/microsoft-teams-users-will-soon-be-able-to-share-screens-more-efficiently-with-av1-codec)
- NDI bandwidth increase: up to eight distinct 1080p streams. — [MC1191341](https://www.itelio.com/en/microsoft-message-center/MC1191341)
- An "Efficiency Mode" planned for May 2026 dynamically lowers sent camera resolution on constrained hardware. — [MC1287373](https://mc.merill.net/message/MC1287373)

**Cisco Webex**
- The **Webex AI Codec** is an *audio* codec, announced at WebexOne in Oct 2023. Early demos showed "superior audio quality at up to 16x lower bandwidth" than standard codecs. Reports state it is available in Webex Meetings and Webex Calling. — [heise (2023)](https://heise.de/-9848886); [Cisco IR (2023)](https://investor.cisco.com/news/news-details/2023/Cisco-Unveils-Webex-AI-Strategy-at-WebexOne/default.aspx); [UC Today](https://www.uctoday.com/unified-communications/webex-outlines-ai-strategy-to-revolutionise-communication-and-collaboration/)
- The video counterpart, "Super Resolution", was announced in 2023 to deliver HD regardless of bandwidth. I found no confirmation that it has shipped. — [Computerworld (2023)](https://www.computerworld.com/article/1638082/cisco-unveils-new-ai-strategy-for-its-webex-video-platform.html)
- Webex 4K comes from hardware:
  - Webex Desk Camera: "up to 4K ultra-HD".
  - Desk Pro G2: 2160p30/2160p60 as PC input resolutions.
  - Room Kit EQX: 4K plus spatial audio.
  — [Cisco Desk Camera](https://cisco.com/c/en_in/products/collaboration-endpoints/webex-desk-camera/index.html); [Cisco AI-powered devices PDF](https://cisco.com/c/dam/m/en_us/training-events/events-webinars/cisco-connect-us/ai-powered-devices.pdf)

**Discord**
- AV1 streaming arrived in early 2023 for GeForce RTX 40 GPUs. Nitro users can stream up to 4K at 60 fps at about 8 Mbps. The stream falls back to H.264 for viewers who cannot decode AV1. This applies to Go Live/screen streams; camera video is not covered by these sources.
- Nitro pricing as of 2023: $9.99/month (Nitro Basic $2.99/month). This may be outdated.
— [NVIDIA](https://www.nvidia.com/en-us/geforce/news/nvidia-studio-discord-av1/); [Tom's Hardware (2023)](https://www.tomshardware.com/news/discord-gains-av1-support-on-geforce-rtx-40-gpus); [PC Gamer](https://pcgamer.com/streaming-on-discord-is-one-of-the-better-ways-to-make-use-of-av1-gpu-support)

**FaceTime / WhatsApp / Signal / Telegram**
- A Jan 2026 consumer guide (listicle-grade) says FaceTime, WhatsApp and similar apps look alike at 720p. It says FaceTime has a "slight edge at 1080p in good light on flagship phones," and that WhatsApp drops resolution more aggressively on weak networks. — [bestforandroid.com](https://bestforandroid.com/facetime-alternatives/)
- Apple's Mic Mode **Voice Isolation** (since iOS 15, 2021) works in FaceTime and also in third-party apps such as WhatsApp on iOS. — [MacRumors](https://www.macrumors.com/how-to/enable-voice-isolation-mode-facetime/); [MacRumors – use voice isolation](https://www.macrumors.com/how-to/use-voice-isolation/)
- A source cites a 2022 "MOS Lab" study finding WhatsApp voice comparable to FaceTime in most conditions. I could not verify that study. — [bestforandroid.com](https://bestforandroid.com/facetime-alternatives/)
- FaceTime is Apple-only, but Android users can join through FaceTime web links. WhatsApp and Signal calls are end-to-end encrypted. — [bestforandroid.com](https://bestforandroid.com/facetime-alternatives/)

**Skype successor**
- Skype shut down on May 5, 2025, and accounts were migrated to **Teams Free**. Teams Free has no PSTN calling. Skype data could be exported until Jan 2026. — [TechCrunch (Feb 2025)](https://techcrunch.com/2025/02/28/microsoft-hangs-up-on-skype-service-to-shut-down-may-5-2025); [TechRepublic](https://www.techrepublic.com/article/microsoft-skype-shutting-down/); [Android Authority](https://www.androidauthority.com/skype-shut-down-3550668/)

**Studio / remote-recording tools**
- Riverside pricing reports conflict:
  - One source: Pro at $24/month (annual), with 4K recording and a 15 hours/month cap.
  - Another: Pro at $29/month with 30 hours of 4K.
  - A third: Standard at $19 and Pro at $24.
  - Plans were restructured recently.
  - Free plan: 2 hours one-off, watermarked.
  — [Castmagic (2026)](https://www.castmagic.io/blog/riverside-pricing); [makerstack review](https://makerstack.co/reviews/riverside-fm-review/); [fluxnote](https://fluxnote.io/guides/riverside-pricing-guide-2026)
- StreamYard pricing:
  - Core: $44.99 monthly or $35.99 annual, 1080p.
  - Advanced: $88.99 monthly or $68.99 annual, adds **4K local recording**.
  - Business: about $299.
  — [talks.co (2026)](https://talks.co/p/streamyard-vs-riverside); [toolradar](https://toolradar.com/tools/streamyard/pricing)
- SquadCast is now part of Descript (Hobbyist $24 monthly or $16 annual). It reportedly tops out at **1080p**, with no 4K. — [Castmagic alternatives](https://www.castmagic.io/de/blog/riverside-alternatives)

### Inferences
- For live two-way calls, the effective ceiling for mainstream apps in Nov 2026 is 1080p. Zoom Enhanced Media's 60 fps and doubled bitrate is the clearest published step above that.
- "4K" claims in calling refer to one of three things: hardware endpoints (Cisco), screen/content sharing (Zoom 4K at 10–15 fps, Discord 4K60), or local recordings uploaded after the call (Riverside, StreamYard). None of these is 4K live camera video between two people.
- Audio-quality leadership plausibly goes to Webex, based on the AI Codec and the TestDevLab audio ranking below. Zoom and FaceTime/Apple Voice Isolation are strong for consumers.

### Gaps
- Not verified in this session:
  - Zoom per-plan 720p/1080p rules (Group HD, Pro vs Business), and Zoom audio specs (Original Sound for Musicians, hi-fi 48 kHz/stereo).
  - Meet audio codecs (Opus/Satin/Lyra).
  - FaceTime's official max resolution.
  - WhatsApp/Signal/Telegram official resolution and codec specs.
  - Whereby specs.
  - Discord camera video max resolution and current Nitro price.
- Whether Teams standard meetings (not town halls) support 1080p camera video for all licensed users after Apr 2026 is unconfirmed.

## Q2. AI features (noise removal, voice isolation, translation, enhancement, summaries, avatars)

### Takeaway
Google Meet has the broadest live AI translation as of Oct 2026: Gemini speech translation in 63 languages that keeps the speaker's voice. Teams offers an AI Interpreter tied to a Copilot license. Zoom's AI Companion 3.0 is agentic and now included in paid plans. Video-enhancement AI is most visible in Meet's Studio look/lighting and in Cisco hardware.

### Cited Findings
**Google Meet**
- Speech translation, per Google's Oct 22, 2026 post:
  - 63 languages, powered by "Gemini 3.5 Live Translate", with automatic language detection.
  - Participants can switch it on individually. It is off by default and controlled by admins.
  - It does not work in live streams, recorded meetings, CSE calls, dial-in/interop calls, or with adaptive audio.
  - Free Gmail accounts do not get it. Guests can use it if the host is on an eligible plan.
  — [Workspace Updates blog, Oct 22 2026](https://workspaceupdates.googleblog.com/2026/10/real-time-speech-translation-in-google-Meet-expands-to-63-languages-with-automatic-language-detection.html)
- Translation reached mobile in Apr 2026. — [Workspace Updates, Apr 2026](https://workspaceupdates.googleblog.com/2026/04/speech-translation-in-google-meet-is-now-rolling-out-to-mobile-devices.html?hl=es_HN)
- A June 2026 article says the model covers "70+" languages. This conflicts with Google's official 63 for Meet. — [beri.net](https://www.beri.net/article/google-gemini-live-translate-70-languages-enterprise-meeting-translation-2026)
- Other Meet AI features:
  - Speech Translation "in a voice like yours".
  - Studio look, lighting and sound: generative AI that needs a Gemini add-on or eligible plan plus specific hardware.
  - Generate a background, "Take notes for me", noise cancellation and portrait touch-up.
  — [Google Meet Help](https://support.google.com/meet/answer/10459644?hl=en)

**Microsoft Teams (Copilot)**
- AI Interpreter (simultaneous):
  - Requires a Microsoft 365 Copilot license and is enabled by default for licensed users.
  - Received quality improvements and Traditional Chinese support.
  — [MC1267977](https://mc.merill.net/message/MC1267977)
- The bilingual consecutive interpretation mode with the Interpreter agent had its rollout **paused**, per Message Center. A third-party article describes it as available. Status is unclear. — [MC1239927](https://mc.merill.net/message/MC1239927); [hubsite365](https://www.hubsite365.com/en-ww/crm-pages/microsoft-teams-consecutive-interpretation-explained-new-copilot-feature-for-multilingual-meetings.htm)
- AI "Video recap" (narrated highlight videos) supports 23 languages and 31 locales, for meetings of 10–90 minutes. — [MC1479506](https://mc.merill.net/message/MC1479506)

**Zoom**
- AI Companion 3.0 (agentic) is generally available and announced at Zoomtopia 2025. — [No Jitter](https://www.nojitter.com/ai-automation/zoom-ai-companion-3-0-now-generally-available); [Constellation Research](https://www.constellationr.com/insights/news/zoom-launches-ai-companion-30-bevy-cx-tools)
- Further agentic AI was announced at Enterprise Connect in Mar 2026. — [SiliconANGLE, Mar 10 2026](https://siliconangle.com/2026/03/10/zoom-introduces-agentic-ai-capabilities-drive-productivity-action-work/); [Zoom news](https://news.zoom.com/ec26-zoom-workplace/)
- AI Companion packaging (pricing tracker, Q4 2025):
  - Paid Workplace plans get it without the Custom AI Companion add-on.
  - It produces summaries in Meet and Teams meetings too.
  - The add-on price rose 67% to $20/month in Q1 2026.
  — [PricingSaaS 2025Q4](https://pricingsaas.com/companies/zoom/diffs/2025Q4)
- The Zoom plan list (pricing tracker, may be stale) includes "ZoomMate" at $20. A Japanese blog says AI Companion was rebranded/split into ZoomMate in June 2026. This is unverified against a Zoom source. — [PricingSaaS 2026W13](https://pricingsaas.com/companies/zoom/diffs/2026W13); [laxis.com](https://www.laxis.com/ja/blog/zoom-ai-companion/)

**Webex**
- AI Codec (audio resilience/efficiency), Super Resolution (video, shipping status unknown) and AI-powered Cisco devices; all announced in 2023. — [Cisco IR (2023)](https://investor.cisco.com/news/news-details/2023/Cisco-Unveils-Webex-AI-Strategy-at-WebexOne/default.aspx)

**Discord**
- Krisp ML-based noise suppression, extended to mobile calls (older article). — [GamesBeat](https://gamesbeat.com/discord-launches-noise-suppression-for-mobile-audio-calls)

**Apple**
- Voice Isolation and Wide Spectrum mic modes at the OS level, usable in FaceTime and third-party apps. — [MacRumors](https://www.macrumors.com/how-to/use-voice-isolation/)

### Inferences
- Live speech-to-speech translation is now table stakes for enterprise suites: Meet (included in paid plans) and Teams (requires Copilot). Meet's per-participant, auto-detect, 63-language model is the most consumer-friendly.
- Consumer messaging apps (WhatsApp, Signal, Telegram, FaceTime) lean on OS-level audio AI rather than in-app generative AI for calls.

### Gaps
- Not verified:
  - Zoom real-time translation language counts, avatars, and Zoom/Teams eye-contact correction.
  - FaceTime Live Translation details (iOS 26).
  - WhatsApp/Telegram AI call features.
  - Riverside AI tools (Magic Audio, eye contact).

## Q3. Pricing for top-quality tiers

### Takeaway
The cheapest routes to the best published quality are:
- Zoom: paid plan plus $25/month Enhanced Media.
- Google Meet: any premium plan, including Google One Premium 2 TB or AI Pro.
- Teams: 1080p town halls via Premium, or via Enterprise after Apr 2026.
- Studio 4K recording: Riverside Pro (~$24–29/month) or StreamYard Advanced (~$69–89/month).
- 3D: Google Beam at $24,999+ in hardware.

### Cited Findings
- Zoom: Workplace Pro $14.16, Business $18.33, Enhanced Media add-on $25, ZoomMate/AI add-on $20 (tracker, may be stale). — [PricingSaaS](https://pricingsaas.com/companies/zoom/diffs/2026W13)
- Riverside, StreamYard, Descript/SquadCast and HP Dimension prices are as listed in Q1. — [Castmagic](https://www.castmagic.io/blog/riverside-pricing); [talks.co](https://talks.co/p/streamyard-vs-riverside); [HP Japan](https://jp.ext.hp.com/info/newsroom/2026/20260827/)

### Inferences
- The Zoom add-on means the best Zoom quality costs about $39+/user/month (Pro + Enhanced Media).

### Gaps
- Official Workspace, Teams Premium/Enterprise and Webex prices were not fetched.

## Q4. Independent call-quality tests

### Takeaway
The main lab comparison is TestDevLab's April 2024 benchmark, **commissioned by Zoom**, which ranked Zoom first overall with Webex a close second. Webex was best on audio and most resilient to heavy packet loss. Teams ranked last and struggled above 120 ms latency. No independent 2026 lab test covering consumer apps (FaceTime, WhatsApp, Signal) was found.

### Cited Findings
- TestDevLab (April 2024 testing, commissioned by Zoom), rank-sum scores where lower is better:
  - Overall: Zoom 30, Webex 31, Google Meet 36, Teams 43.
  - Audio: Webex 3, Zoom 7, Meet 9, Teams 11.
  — [Zoom Video and Audio Performance Report 2024](https://www.zoom.com/en/resources/video-audio-quality-report/)
- Under heavy packet loss Webex "soars above the rest", while Teams is barely functional above 120 ms latency. TestDevLab publishes results only when the client chooses to. — [Techzine](https://www.techzine.eu/blogs/devops/124390/inside-testdevlab-the-company-that-breaks-tech-for-a-living)
- TestDevLab has other studies: a noise-suppression comparison involving Teams, and a Meet/Slack/Jitsi/Webex network-constraint study. Figures were not retrieved. — [TestDevLab whitepapers](https://testdevlab.com/content-library/whitepapers)
- Consumer-app comparisons found were SEO listicles of low reliability. — [bestforandroid.com](https://bestforandroid.com/facetime-alternatives/); [ofzenandcomputing](https://ofzenandcomputing.com/best-facetime-apps/)

### Inferences
- The 2024 data is more than two years old and vendor-commissioned, so treat the rankings as directional only. Zoom's 2026 Enhanced Media and Meet's 2026 AI features postdate it.

### Gaps
- I found no 2025–2026 independent test (The Verge, Tom's Guide, PCMag) measuring actual delivered resolution, bitrate or MOS across apps.
- I found no reliable data on Whereby, Telegram or Signal call quality.
