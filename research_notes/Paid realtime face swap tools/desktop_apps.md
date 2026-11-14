# Paid desktop real-time face swap / face changer apps (virtual webcam for live calls), state as of mid-November 2026

Research date: 2026-11-14. Most vendor pages were captured on this date; when a page carries its own date, it is noted. Many of the "best of" comparison pages that come up in search are written by vendors that sell a competing product: Facecam.ai, VidMage.ai, and the Swapface/DeepLiveCam sites themselves. Those pages are tagged **[VENDOR/BIASED]** below. I found no independent lab-style benchmark of live-swap FPS, realism or latency for any of these apps.

---

## Q1. Candidate landscape: which products are true live face swappers with a virtual webcam, and which are not

### Takeaway
Six paid or freemium products swap your face live with a single photo and run locally on your own GPU: Swapface, the DeepLiveCam Ultimate prebuilt, Magicam, VisoMaster/VisoMaster Fusion packages, and VidMage (Mac only). The cloud services in this space are Facecam.ai, LiveSwap, LiveSwapAI, FaceLive, Liveface and LiveFaceSwap AI. Several names on the candidate list are not live face swappers into another person:
- Xpression Camera animates a photo with your expressions.
- Pickle builds an AI clone of yourself, and only on macOS.
- NVIDIA Broadcast offers eye contact only.
- ManyCam offers masks and effects only.
- Snap Camera is dead.
- DeepFaceLive and iRoopDeepFaceCam are free open-source projects, not paid apps.

### Cited Findings

**Swapface (swapface.org): local desktop app, Windows and Apple-silicon Mac**
- The homepage says "Lightweight · Hyper-realistic · Real-time", "Running 100% on your own device. Free to start", and offers downloads for Windows and Mac (Apple silicon). It also offers image, multi-person, full-head (hair included), video and GIF swaps. — [Swapface homepage](https://swapface.org/)
- It has a built-in virtual camera. On first use you click "Install Virtual Camera" and then select **SwapFaceCam** in Stream Output. The alternative output is "OBS Virtual Camera" (requires OBS Studio; "We use version 30.0"). The manual is dated 2026.09.01. — [Swapface Windows User Manual](https://swapface.org/docs/swapface-stream-user-manual/)
- Inputs can be a USB camera ("We recommend a 2K USB camera or higher"), another virtual camera (ManyCam, WeCam, or a video file), or a phone camera via iVCam/Iriun. — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)

**Deep-Live-Cam "Ultimate" paid prebuilt (deeplivecam.net)**
- The open-source project is hacksider/Deep-Live-Cam on GitHub. The README says "Ultimate includes 30+ exclusive features, performance optimizations, and priority support" and "We only have a single official website which is https://deeplivecam.net". — [GitHub Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam)
- Release timeline from the official news posts:
  - 2.7 Ultimate: 17 July 2026
  - 2.7.5 Ultimate: 7 September 2026
  - 2.8 Ultimate Early Access: 21 October 2026
  - DeepLiveCam 1.2.1 Lite: 28 July 2026

  — [deeplivecam.net home/news](https://deeplivecam.net/)
- Editions:
  - **Lite** is for low-end PCs. It runs on the CPU and uses the Decart cloud API, and "decart api not included, bring your own key".
  - **Ultimate** has a one-click batch installer and the Inswapper 128, ReSwapper 256, HyperSwap 256 and FluxRT models.

  — [DeepLiveCam Lite/Ultimate page](https://deeplivecam.net/index.php/quickstart); [plans page](https://deeplivecam.net/index.php/plans?plan_id=0&group_id=0)

**Magicam (magicam.ai): local, Windows only**
- The site offers "One-Photo & One-click face swap", a real-time voice changer, a built-in virtual camera and a LivePortrait feature, with Free and Pro tiers. — [Magicam homepage](https://magicam.ai/)
- "Magicam is currently compatible only with Windows systems." (blog post dated 17 February 2025) — [Magicam install guide](https://magicam.ai/blog/2025/02/17/step-by-step-guide-how-to-install-magicam-on-your-computer/)
- The homepage footer still shows "© 2024 Magicam", so the page may be stale. — [Magicam homepage](https://magicam.ai/)

**Xpression Camera (EmbodyMe): a photo-reenactment app, not a true face swap**
- "Reflects your facial expressions on any photo in real-time … with a single photo without any processing time." It is a virtual camera app for Zoom and Twitch, and has a "Voice2Face" mode that animates the image from your voice when you are off camera. — [xpressioncamera.com](https://xpressioncamera.com/)

**VisoMaster / VisoMaster Fusion**
- The original open-source VisoMaster is github.com/visomaster/VisoMaster, GPL-3.0, release v0.1.6 dated 9 March 2025. visomaster.com says of itself that it "is not the official VisoMaster or Rope repository" and that it sells "paid, pre-packaged Windows builds for NVIDIA GPUs". — [visomaster.com FAQ](https://visomaster.com/)
- VisoMaster Fusion (a community fork) covers "image, video, webcam, and virtual camera workflows". Its swapper models include Inswapper128, InStyleSwapper, SimSwap, GhostFace, CSCS and DeepFaceLive DFM models. — [VisoMaster-Fusion README](https://github.com/VisoMasterFusion/VisoMaster-Fusion)

**DeepFaceLive: free, open source, trained-model approach**
- It runs on DirectX12 with NVIDIA, AMD or Intel cards; RTX 2070+ / RX 5700 XT+ is recommended. Its Face Animator module reaches "real-time streaming at 25 fps using 35 TFLOPS GPU". — [DeepFaceLive README](https://github.com/iperov/DeepFaceLive)
- The repository is reported archived since November 2024. — [VidMage blog [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app); [dev.to listicle](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j)

**iRoopDeepFaceCam: free open-source fork**
- It swaps 1 to 10 faces live from a webcam, has a Mouth Mask and auto face-tracking, and routes output through the OBS virtual webcam. I found no paid build. — [iRoopDeepFaceCam GitHub](https://github.com/iVideoGameBoss/iRoopDeepFaceCam)

**Pickle: AI clone of yourself, macOS only**
- It is a "MacOS app that generates a hyper-realistic AI clone of you and replaces your camera feed during video calls". Windows is on the roadmap. Setup is a 5-minute video recording, and training takes 24–36 h. — [ToolDirectory (reviewed June 2026)](https://tooldirectory.ai/tools/pickle); [VideoSDK listing](https://www.videosdk.live/ai-apps/pickle)

**NVIDIA Broadcast: eye contact only, not a face changer**
- Eye Contact "uses AI to make it appear as if you're looking directly at camera". The RTX 50-era update (January 2025) "adds gaze stability and subtle random eye movements". — [NVIDIA blog](https://blogs.nvidia.com/blog/studio-ai-geforce-rtx-50-series/); [TechPowerUp](https://techpowerup.com/331837/new-nvidia-broadcast-ai-features-now-streaming-with-geforce-rtx-50-series-gpus)

**Snap Camera, ManyCam, Live3D**
- Snap Camera "shut down on January 25, 2023". ManyCam is "a virtual camera with over 12,000 masks, objects and effects … no face swap listed". Live3D does no live swap of your face. — [Facecam comparison guide [VENDOR/BIASED], checked 2026-10-16](https://www.facecam.ai/guides/live-face-swap-apps-compared)

**Avatarify**
- The Avatarify Desktop wiki calls it the "Successor of Avatarify Python". The SourceForge listing shows its latest update as 2025-09-05. I found no confirmation that it was discontinued, and nothing showing a paid live face-swap product. — [Avatarify Desktop wiki](https://github.com/alievk/avatarify-desktop/wiki/Avatarify-Desktop); [SourceForge](https://sourceforge.net/app/avatarify/)

**Newer 2025–2026 entrants**

| Product | Type | Platform / details | Source |
|---|---|---|---|
| Facecam.ai | Cloud | Chrome extension plus a "Facecam for PC and Mac" desktop app | [Facecam live face swap](https://facecam.ai/live-face-swap) |
| LiveSwap | Cloud | Browser | [LiveSwap pricing](https://liveswap.io/pricing) |
| LiveSwapAI | Cloud models | Windows 11 x64 desktop app with a virtual camera; "macOS version is listed as coming soon" | [dev.to](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j); [LiveSwapAI pricing](https://liveswapai.com/pricing) |
| VidMage | Local | Apple-silicon Mac app with a camera extension | [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared) |
| FaceLive, Liveface, LiveFaceSwap AI | Cloud | Browser | [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared) |

### Inferences
- Only Swapface, DeepLiveCam Ultimate, Magicam and VisoMaster (Fusion-based packages) are local, Windows, paid, one-photo live face swappers that fit an NVIDIA laptop.
- Xpression Camera fits a different need. It animates a photo, so the head, hair and background come from that photo, while the swappers keep your real head and body. Its output will likely look like an animated photo rather than a live person turning their head (my judgment, not tested).
- Pickle and NVIDIA Broadcast don't meet the "change your face into someone else" goal at all.

### Gaps
- **FaceDancer:** I did not verify its current status. My understanding is that it is a research face-swap model (WACV 2023), not a consumer app with a virtual camera, but this is unconfirmed in this session.
- **SplitCam and CamMagic:** I did not verify what AI face features they have.
- **Paid DeepFaceLive model packs or forks** (sellers of pre-trained DFM celebrity models): not researched.
- **iRoopDeepFaceCam:** the README fetch from raw GitHub returned 404 on the `main` branch, so its feature claims come from the search snippet only.

---

## Q2. Pricing, metering, trials and watermarks

### Takeaway
- The local apps charge flat fees with no per-minute metering: DeepLiveCam Ultimate is $22/mo or $40 per quarter (NVIDIA/AMD) and $32/mo for Mac; Magicam Pro is $8.99/mo or $49.90/yr; VisoMaster packages are about $19.99 one-time (claimed).
- Swapface's live-stream subscription price is not publicly readable. Third parties quote $39–$249/mo and say the live stream needs a separate subscription.
- Cloud apps meter by the minute:
  - Facecam: $10–$50/mo for about 2.6–21.7 h, which works out to about $0.04–0.06/min.
  - LiveSwap: $12–$299/mo for 15–400 min, about $0.73–0.83/min.

### Cited Findings

**DeepLiveCam Ultimate (official plan pages, captured 2026-11-14)**
- NVIDIA: Monthly $22.00/month, or Quarterly $40.00 per 3 months (labelled "33% off"). Both include priority support and downloads of the latest Quickstart. — [NVIDIA plans](https://deeplivecam.net/index.php/plans/nvidia-gpu?plan_id=0&group_id=1)
- AMD: same pricing, $22/month or $40 per 3 months. — [AMD plans](https://deeplivecam.net/index.php/plans/amd-gpu?plan_id=0&group_id=2)
- Mac (Apple silicon): $32/month or $60 per 3 months. — [Mac plans](https://deeplivecam.net/index.php/plans/mac-silicon-edition?plan_id=0&group_id=3)
- Licensing terms:
  - "You can register up to 2 computers per day."
  - "Can I still use Deep-Live-Cam even after my subscription expires? Yes! … the most basic features."
  - Registration uses your username plus the invoice number.

  — [DeepLiveCam FAQ](https://deeplivecam.net/index.php/faq)
- I saw no free trial or watermark terms on the official pages. The GitHub source edition is free (AGPL-3.0). — [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared); [GitHub](https://github.com/hacksider/Deep-Live-Cam)
- Lite (cloud) mode requires your own Decart API key, which means an extra cost from Decart. — [DLC plans](https://deeplivecam.net/index.php/plans?plan_id=0&group_id=0)

**Swapface**
- The official pricing page (swapface.org/price/) renders client-side. The captured HTML shows only the FAQ ("Should I get Pay-as-you-go or a subscription?", "How to get a refund?"), with no plan amounts. — [Swapface pricing](https://swapface.org/price/)
- ToolWorthy (content updated 29 April 2026) says the official page states "credits cannot be used for stream face swap" and that live-stream/video-call workflows "require another subscription plan". It adds that the page "does not show a full, transparent table of all subscription amounts". — [ToolWorthy Swapface review](https://www.toolworthy.ai/en/tool/swapface)
- Third-party price tables conflict and appear to cover image/video swaps, not the live stream:
  - AiMojo: Free (10 image + 10 video swaps per day), Pay-as-you-go $19 for 100 credits or $49 for 500 credits, Pro $39/mo (50 per day), Advance $69/mo (100 per day), Enterprise $249/mo (300 per day). — [AiMojo](https://aimojo.io/tools/swapface/)
  - Techshark and SimilarLabs give similar numbers. — [techshark](https://techshark.io/tools/swapfaceorg/); [SimilarLabs](https://similarlabs.com/p/swapface)
  - A search summary of Swapface's own Product Hunt listing mentioned "unlimited live face swaps for about a dollar a day". The page itself returned 403, so this is unverified. — [Product Hunt](https://www.producthunt.com/products/swapface-org)
- Swapface has a free tier ("Free to start", "Get free credits" / invite-a-friend credits). — [Swapface homepage](https://swapface.org/)
- "Paid users can … enable acceleration" (NVIDIA acceleration, "about a 2× speed boost"). In other words, the free tier is speed-limited. — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/); [Swapface Windows install guide](https://swapface.org/docs/install-the-swapface-on-windows/)

**Magicam (official homepage)**
- Pro is $8.99/month (struck-through $29.99) or $49.9/year (struck-through $198.99), shown with a countdown timer.
- The Free tier includes multiple real-time face swap modes, "Unlimited FaceSwap Duration", "Unlimited Face Uploads" and the "Built-In Virtual Camera".
- Pro adds "4K HD video FaceSwap", a "High-definition face model", "Advanced Tuning Mode" and "No Watermark". That implies the free output carries a watermark.

  — [Magicam homepage](https://magicam.ai/)
- Aggregators conflict: one says paid from $8.99/mo with no lifetime plan, another lists $4.15/mo, and SaaSWorthy says "Free Trial is not available". — [SaaSWorthy](https://www.saasworthy.com/product/magicam-ai/pricing); [Magicam search aggregators](https://creati.ai/ai-tools/magicam/)

**VisoMaster (visomaster.com, an unofficial reseller of packaged builds)**
- The "All-in-One Package" is $19.99, marked down from $59.99 ("SAVE 50%" — the arithmetic is actually 67%), sold as "One-Time Payment, Lifetime Access!".
- The same page also says "Paid all-in-one package on Patreon", which conflicts. Patreon is normally a recurring membership, so verify the billing model before buying.

  — [visomaster.com](https://visomaster.com/)
- The open-source VisoMaster and VisoMaster Fusion are free on GitHub. — [VisoMaster-Fusion](https://github.com/VisoMasterFusion/VisoMaster-Fusion)

**Xpression Camera**
- Free Basic tier with a 7-day Pro trial; Pro is $12/mo. — [Facecam guide [VENDOR/BIASED], checked 2026-10-16](https://www.facecam.ai/guides/live-face-swap-apps-compared); [VidMage blog [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)
- An older affiliate page instead says "paid from $9.99/mo". — [BityClips](https://bityclips.com/tool/xpression-camera/pricing)
- The official /pricing page returned 403 to my fetch.

**Facecam.ai (cloud, official pricing page, captured 2026-11-14 with a "40% off every plan" promo)**

| Plan | Monthly | Annual | Credits per month | ≈ Live face swap per month |
|---|---|---|---|---|
| Starter | $10 | $100/yr | 720 | 2.6 h |
| Premium | $20 | $200/yr | 2,400 | 8.7 h |
| Pro | $50 | $500/yr | 6,000 | 21.7 h |

- "Live face swap uses 4.6–6.4 credits a minute, only while it's swapping."
- Credits don't roll over.
- "Payments aren't refundable, except where the law says otherwise."
- There are no free live minutes. Free photo swaps are limited to 1 a day with a watermark.

  — [Facecam pricing](https://facecam.ai/pricing)

**LiveSwap (cloud)**
- "1 credit = 1 live minute, metered to the second."

| Plan | Price | Live minutes per month | Max resolution |
|---|---|---|---|
| Basic | $12/mo | 15 | 480p |
| Creator | $29/mo | 40 | 720p |
| Pro | $99/mo | 120 | 1080p |
| Studio | $299/mo | 400 | 1080p |

  — [LiveSwap pricing](https://liveswap.io/pricing)

**LiveSwapAI (cloud models with a Windows desktop virtual camera)**
- One-time credit packs that never expire: 1,200 credits $15; 4,616 credits $29; 15,000 credits $69; 25,000 credits $99; 40,000 credits $149; 55,000 credits $199.
- Free trial: 30 credits for 3 days.
- The time estimate "is based on Xmax X2.1", but the per-minute rate was not shown in the capture.

  — [LiveSwapAI pricing](https://liveswapai.com/pricing)

**Other cloud services (as listed by Facecam, checked 2026-10-16 [VENDOR/BIASED])**
- FaceLive: $12/mo for 15 min.
- Liveface: $7.99 per day or $19.99 for 30 days, plus 30 free watermarked minutes at sign-up.
- LiveFaceSwap AI: $12/mo for about 18 min.
- VidMage (Mac): $14.99/mo, or $8.33/mo billed yearly, plus 5 free watermarked minutes a day.

  — [Facecam guide](https://www.facecam.ai/guides/live-face-swap-apps-compared)

**Pickle**
- "Starting Price: $24 per month" per SourceForge. Other directories say "price on request" or "not disclosed". Unverified. — [SourceForge Pickle](https://www.sourceforge.net/software/product/Pickle-AI); [Techjockey](https://www.techjockey.com/detail/pickle-ai)

### Inferences
- **Per-minute cost:**
  - Facecam Starter: $10 / ~156 min ≈ $0.064/min. Facecam Pro: $50 / ~1,304 min ≈ $0.038/min.
  - LiveSwap: about $0.73–0.83/min.
  - LiveSwap Basic's 15 min/month at 480p is not usable for regular calls.
- **Heavy use:** For anyone making calls several hours a week, a flat-fee local app (DLC $22/mo, or $13.33/mo on quarterly billing; Magicam $8.99/mo) is far cheaper than metered cloud services, provided the GPU can carry it.
- **Swapface:** Because of the lack of a public stream price, a buyer should check the in-app price before subscribing. Given the Trustpilot billing complaints (Q6), paying with a card or service that allows easy cancellation is prudent.

### Gaps
- Swapface's current live-stream (Stream) subscription price, and whether it is unlimited by time. The official page is JS-rendered; third-party numbers conflict and are probably image/video quotas.
- Xpression Camera's official current price and whether Pro has a watermark or resolution cap (official pricing page blocked).
- The LiveSwapAI credits-per-minute rate.
- Whether DeepLiveCam Ultimate has any free trial or refund policy. Neither was stated on the pages I could read.

---

## Q3. Local GPU vs cloud, hardware requirements, NVIDIA-only status, RTX 50-series support

### Takeaway
- **Swapface:** local, NVIDIA RTX 2060/3060 6 GB minimum, RTX 4060 Ti 16 GB / RTX 5070 recommended, and the manual says RTX 4070 Ti+ for smooth real time.
- **DeepLiveCam Ultimate:** local, with NVIDIA, AMD and Apple-silicon builds; NVIDIA needs CUDA 13.0/13.2. Version 2.7 explicitly added RTX 50 detection.
- **VisoMaster packages:** local, NVIDIA-only, native RTX 50 (sm_120) builds.
- **Magicam:** local, Windows/NVIDIA, 8 GB VRAM and 32 GB RAM recommended.
- **Facecam, LiveSwap and LiveSwapAI:** cloud, no GPU needed, but metered and dependent on the internet connection.

### Cited Findings

**Swapface system requirements (Windows)**
- Minimum: Windows 10 64-bit 22H2; Intel i5 10th gen / Ryzen 5 3600; **16 GB RAM**; "NVIDIA RTX 2060 / RTX 3060 or better, 6GB+ VRAM"; 10 GB SSD.
- Recommended: Windows 11; i7 12th gen+ / Ryzen 7 5700X; **32 GB RAM**; "NVIDIA RTX 4060 Ti 16 GB / RTX 5070 or better"; 20 GB+ NVMe.

  — [Swapface homepage](https://swapface.org/); [Swapface install guide](https://swapface.org/docs/install-the-swapface-on-windows/)
- "For better realtime performance, we recommend NVIDIA RTX 4070 Ti or a more powerful GPU." — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)
- "Running 100% on your own device … All procedure and data is running on your local machine." — [Swapface homepage](https://swapface.org/)

**DeepLiveCam Ultimate requirements**
- NVIDIA build: "3060 or higher GPU (recommended is 6GB or higher VRAM)", Windows 10+, "CUDA 13.0 for 2.7.5 below and CUDA 13.2 for 2.8 and up (Install this first before subscribing…)", "RTX Video effects for the low latency upscaling", and "OBS (install this if you want to use virtual cameras)".
- AMD build: 6 GB+ VRAM. Mac build: Apple silicon only.

  — [DLC plans](https://deeplivecam.net/index.php/plans?plan_id=0&group_id=0)
- Version 2.7 (17 July 2026):
  - Added TensorRT "turbo acceleration for NVIDIA GPUs (up to ~3× faster)".
  - Removed PyTorch, TensorFlow, InsightFace and GFPGAN dependencies.
  - The installer "detects a user's exact graphics card — NVIDIA (including the latest RTX 50-series), AMD, Apple Silicon".

  — [DLC 2.7 release post](https://deeplivecam.net/index.php/news/deep-live-cam-2-7-ultimate-lands-with-its-biggest-upgrade-yet)
- Version 2.8 Early Access (21 October 2026): "400% performance improvement over 2.7.5", CUDA 13.2, more reliable TensorRT engine loading, and "Better Windows webcam capture". — [DLC 2.8 post](https://deeplivecam.net/index.php/news/deeplivecam-2-8-ultimate-early-access)
- "Local face swapping runs on your machine. Optional cloud AI workflows, including Decart integrations, use external services and require your own API key." — [deeplivecam.net](https://deeplivecam.net/)
- On laptops, the FAQ tells users to force the NVIDIA GPU (NVIDIA Control Panel → Preferred graphics processor → High performance) and warns "Do not expect top performance on laptops. Desktop is way faster than laptop even when using similar CPU/GPU." — [DLC FAQ](https://deeplivecam.net/index.php/faq); [DLC quickstart FAQ](https://deeplivecam.net/index.php/quickstart)

**VisoMaster (visomaster.com packages)**
- Minimum: dedicated NVIDIA GPU with 6 GB VRAM and 8 GB RAM. Recommended: RTX 40/50 with 8 GB+ VRAM and 16 GB+ RAM.
- "RTX 50 Series (5070, 5070 Ti, 5080, 5090 … desktop and laptop): fully supported with native Blackwell (sm_120) builds."
- "AMD and Intel GPUs: not currently supported."
- "6GB cards should run one restorer model with threads set to 1, while 8GB+ cards can enable TensorRT engines."
- The RTX 50 archive is 27.86 GB compressed.

  — [VisoMaster system requirements](https://visomaster.com/system-requirements); [visomaster.com](https://visomaster.com/)
- Fusion README: 6 GB VRAM minimum, 8–12 GB+ recommended for heavier workflows. — [VisoMaster-Fusion](https://github.com/VisoMasterFusion/VisoMaster-Fusion)

**Magicam**
- Recommended: Windows 10+, "NVIDIA GTX 1060 or above with 8GB VRAM or higher", i5-9400+, "Memory: 32 GB (16 GB minimum)". — [Magicam install guide (Feb 2025)](https://magicam.ai/blog/2025/02/17/step-by-step-guide-how-to-install-magicam-on-your-computer/)
- The homepage FAQ says "preferably RTX 2070 or higher" and "All data is processed locally". — [Magicam homepage](https://magicam.ai/)

**Xpression Camera**
- Very light requirements.
  - Minimum: i5-9400 / Ryzen 5 2600 with 8 GB RAM (AVX2 required) and Intel UHD 630 integrated graphics.
  - Recommended: i5-11400 / Ryzen 5 3600 with 16 GB RAM, or Apple M1, and a GeForce 1660 / RX 580.
  - OS: Windows 10 or macOS 12.3+.

  — [xpressioncamera.com](https://xpressioncamera.com/)

**DeepFaceLive**
- Any DirectX12 GPU (NVIDIA, AMD or Intel); RTX 2070+ recommended. — [DeepFaceLive README](https://github.com/iperov/DeepFaceLive)

**Facecam (cloud)**
- "Graphics card needed: None … it runs on our GPUs." The first start takes "20 to 30 seconds, sometimes up to a minute" while a cloud GPU spins up, and restarting takes about 5 s. "Nothing recorded … Facecam saves no video or pictures of your call." — [Facecam live face swap](https://facecam.ai/live-face-swap)

**Desktop apps can still be cloud-backed**
- "A desktop app can capture the camera and provide a virtual camera while using a cloud service for AI processing." LiveSwapAI is an example. — [dev.to](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j)

### Inferences
- All the serious local Windows options effectively want NVIDIA; DLC alone has an AMD build. An RTX 50-series card is explicitly supported by DLC (2.7+) and VisoMaster (sm_120 builds).
- Swapface lists the RTX 5070 as "recommended", which implies Blackwell support, but I found no explicit RTX 50 compatibility note for it.
- Older pip/CUDA 12 installs of the open-source Deep-Live-Cam (the README still mentions cuDNN 8.9.7 for CUDA 12.x) are a classic source of RTX 50 errors. The paid prebuilds avoid this by shipping the matching runtime (CUDA 13.x / sm_120).

### Gaps
- Swapface's explicit RTX 50 laptop support and its VRAM use at each resolution.
- Magicam's RTX 50 support. The requirement pages date from 2024–2025.
- Xpression Camera's local-vs-cloud split. The page implies local processing but does not say so.

---

## Q4. Real-world FPS, resolution, latency, and realism (one-photo vs trained model)

### Takeaway
Hard numbers are scarce and mostly self-reported by vendors.
- **DeepLiveCam:** its own FAQ says about 8 fps on a 6 GB NVIDIA card and up to about 20 fps on an i9 with a 24 GB GPU. Face enhancer cuts output from 15 to 4 fps. Newer TensorRT builds claim 3× (2.7) and "400%" (2.8) speedups, which are untested independently. Output resolution can be switched among 320, 480, 520, 720 and 1080.
- **Facecam (cloud):** 1280×720 at 30 fps output with 16.8 newly swapped frames per second and about 0.2 s lag, measured by the vendor.
- **LiveSwap (cloud):** claims under 500 ms latency and 30 fps.
- **Swapface and Magicam:** no published FPS.
- **Realism:** depends on the swap model's face resolution (Inswapper is 128×128; HyperSwap and ReSwapper are 256). One-photo swappers degrade at large head turns and in harsh lighting; trained DeepFaceLive models are regarded as more robust.

### Cited Findings

**DeepLiveCam (official FAQ)**
- "Nvidia GPU with 6GB VRAM is around 8 fps … It can go as high as 20fps if you have i9 and 24GB VRAM or higher. For AMD/Mac, usually it's around 6 to 10 FPS."
- "Face enhancer itself is so intensive that it cuts the speed by 1/4 (from 15 fps to 4fps on my end)."
- Ultimate offers "Resolution Switch … 320, 480, 520, 720, 1080".
- Models: "Inswapper (128), ReSwapper (256), Hyperswap (256), FluxRT".
- Masks cover the forehead, lips, eyes, chin and face.

  — [DLC Lite/Ultimate & FAQ](https://deeplivecam.net/index.php/quickstart)
- The FAQ's "Face swap models" entry lists "Inswapper (128x128) and HyperSwap (256x256)".
- "Mouth mask — Shows your real mouth instead of the deepfaked mouth" helps with tongue and hand-to-mouth moments.
- "Frameskip buffer — makes the FPS smoother faster but gives a bit of delay."
- "Sharpness … good on inswapper to make it look more natural."

  — [DLC FAQ](https://deeplivecam.net/index.php/faq)
- Version 2.7 quality changes: "Poisson blend + feathering", "Fixed lip-mask symmetry, ghosting, and edges", "Better color matching", "Real-time frame interpolation", "RTX Upscaler". — [DLC 2.7 post](https://deeplivecam.net/index.php/news/deep-live-cam-2-7-ultimate-lands-with-its-biggest-upgrade-yet)
- Version 2.8: "400% performance improvement over 2.7.5", a "LivePortrait" model, "Optimized HyperSwap processing — works within the face area", and frame interpolation on a separate worker. — [DLC 2.8 post](https://deeplivecam.net/index.php/news/deeplivecam-2-8-ultimate-early-access)
- **Conflicting third-party numbers:**
  - VidMage's table says DeepLiveCam reaches "20–25 FPS" at 1080p, DeepFaceLive "Up to 25 FPS" at 1080p, and Swapface "Real-time" at 1080p, tested on an RTX 3060 desktop and an M2 MacBook Pro over 12 hours. — [VidMage blog, updated 16 July 2026 [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)
  - Facecam's guide says the Deep-Live-Cam "Preview takes 10 to 30 s to appear" and that Swapface publishes "None" for speed. — [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared)

**Facecam (vendor test, October 2026)**
- "The camera sends 1280×720 at 30 frames a second … about 17 of those frames each second were newly swapped" (16.8 measured).
- "The new face moves with you, about a fifth of a second behind in our test."

  — [Facecam live face swap](https://facecam.ai/live-face-swap)

**LiveSwap**
- Claims "Under 500 ms" and 30 fps. Resolution depends on the plan: 480p (Basic), 720p (Creator), 1080p (Pro and Studio). — [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared); [LiveSwap pricing](https://liveswap.io/pricing)

**VidMage (Mac)**
- "30 FPS (M1)", "4K (Subscriber)". In the vendor's own test: "During fast lateral movement or harsh side lighting, I occasionally noticed brief drift, but the model recovered within a frame or two." — [VidMage blog [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)

**One-photo vs trained models**
- DeepFaceLive trains a custom DFM model "on hours of footage". It "produces swap quality that single-photo tools cannot match, especially in complex scenes with varied lighting, extreme angles, and layered expressions". — [VidMage blog [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)
- VisoMaster Fusion can load DeepFaceLive DFM models alongside one-photo swappers. — [VisoMaster-Fusion](https://github.com/VisoMasterFusion/VisoMaster-Fusion)

**Swapface realism and stability guidance**
- Use "a front-facing … evenly lit, high-clarity image … without large occlusion".
- "Occlusions such as glasses can affect face recognition and swap quality."
- A 2K or higher USB camera is recommended. A "Beauty Filter" option exists.

  — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)

**Magicam**
- Pro advertises a "High-definition face model". I found no published FPS. — [Magicam homepage](https://magicam.ai/)
- Product Hunt shows 5.0 from only 6 reviews, with short "very realistic" comments. — [Product Hunt Magicam reviews](https://www.producthunt.com/products/magicam/reviews)

**Xpression Camera**
- Claims real time "without any processing time". VidMage lists it at 1080p. — [xpressioncamera.com](https://xpressioncamera.com/); [VidMage [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)

### Inferences
- **Bottlenecks:** Inswapper's 128×128 face output is the main realism bottleneck for one-photo swaps. Upscaling or enhancing it (GFPGAN/GPEN) costs most of the frame rate in live use, which is why DLC added the RTX Upscaler and 256-px models (HyperSwap/ReSwapper). For realism on calls, the 256-px models plus the mouth mask are probably the best one-photo setting.
- **Frame rate needed:** Video calls usually run at 15–30 fps. At about 8–15 swapped fps, motion looks choppy, which DLC's frame interpolation is meant to hide.
- **Latency:** All local swappers add latency, roughly 0.1–0.5 s in vendor claims. Audio usually reaches the other side first, so lip sync can look off unless the call app or OBS delays the audio. This is my inference; no source measured lip sync.
- **Unverified speedups:** The "3×" and "400%" DLC claims are relative to earlier DLC builds and are vendor claims. The 8 fps / 20 fps FAQ figures probably predate the TensorRT builds, so real 2.8 numbers on an 8 GB RTX 5060 Laptop could be well above 8 fps, but this is unverified.

### Gaps
- No independent measured FPS or latency for Swapface, Magicam, VisoMaster live mode or DLC 2.8 on any RTX 50 laptop. A search for "Deep-Live-Cam RTX 5060 laptop fps" returned only gaming benchmarks.
- No YouTube side-by-side realism comparisons were retrieved. Search returned listicles only.
- No published head-turn angle limits or occlusion robustness metrics for any product.

---

## Q5. Built-in virtual camera and compatibility with Discord, Telegram Desktop, WhatsApp Desktop and Google Meet

### Takeaway
- **Google Meet (in a browser) and Discord:** work with any properly registered virtual camera, including SwapFaceCam, OBS Virtual Camera and the Facecam Virtual Camera.
- **WhatsApp Desktop for Windows:** the problem case. Swapface's own September 2026 docs say WhatsApp "may not be able to call SwapfaceCam directly". They give two workarounds:
  - Relay the feed through ManyCam or WeCam.
  - Run Android WhatsApp in the Nox emulator.

  OBS forums have long reported that OBS Virtual Camera does not appear in WhatsApp Desktop.
- **Telegram Desktop:** has scattered reports of OBS Virtual Camera not being listed.
- **DeepLiveCam:** has no camera driver of its own. Its "Virtual Camera" button drives OBS Virtual Camera.

### Cited Findings

**Virtual camera mechanics per app**
- Swapface:
  - Outputs SwapFaceCam (its own driver) or OBS Virtual Camera.
  - "Some apps need to be restarted after the virtual camera is installed before they can detect SwapFaceCam."
  - "Some apps require OBS Virtual Camera as the output option, such as Messenger."
  - "Do not click Start Virtual Camera in OBS."

  — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)
- Swapface WhatsApp guide (1 September 2026): "When using WhatsApp on Windows, WhatsApp may not be able to call SwapfaceCam directly. Therefore, you need ManyCam or WeCam as a virtual camera relay … Camera → Swapface → ManyCam / WeCam → WhatsApp." In WhatsApp you then select "ManyCam Virtual Camera". — [Swapface WhatsApp on Windows guide](https://swapface.org/docs/use-swapface-for-whatsapp-video-calls-on-windows/)
- Swapface's alternative route for WhatsApp: USB camera (rotated 90°) → Swapface → OBS Virtual Camera → WeCam/ManyCam → Nox Android Emulator, using AN9Picker to inject the camera → Android WhatsApp. — [Swapface Android emulator tutorial](https://swapface.org/docs/swapface-android-emulator-tutorial/)
- DeepLiveCam: "After Installing OBS … While doing live, press 'Virtual Camera'. It should turn green … On MS Teams, choose OBS Virtual Camera." OBS is required for the virtual camera on the NVIDIA, AMD and Mac builds. — [DLC FAQ](https://deeplivecam.net/index.php/faq); [DLC plans](https://deeplivecam.net/index.php/plans?plan_id=0&group_id=0)
- DeepLiveCam is "Its own window; capture it in OBS". Swapface's support for Zoom, Meet and Discord is "Not stated on its site". — [Facecam guide [VENDOR/BIASED]](https://www.facecam.ai/guides/live-face-swap-apps-compared)
  - The Swapface manual does show SwapFaceCam selected in Zoom and lists Zoom and OBS, which conflicts with that table. — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)
- Magicam: a "Built-In Virtual Camera", "Embeddable in Zoom or Twitch". — [Magicam homepage](https://magicam.ai/)
- Xpression Camera: "select 'xpression camera' from your webcam settings" in Zoom or Twitch. — [xpressioncamera.com](https://xpressioncamera.com/)
- Facecam:
  - Google Meet "Works. In Chrome."
  - Discord "Works" on discord.com in Chrome with the extension, and in the Discord desktop app with "Facecam for PC and Mac".
  - Desktop apps work with "any app that lets you pick a camera".
  - The page lists no WhatsApp or Telegram.

  — [Facecam live face swap (updated 19 October 2026)](https://facecam.ai/live-face-swap)
  - **Conflict:** the Facecam homepage still says "Get the Facecam desktop app — Leave your email and we'll send you the download as soon as early access opens". — [Facecam homepage](https://facecam.ai/)

**WhatsApp Desktop**
- WhatsApp for Windows 11 switched from the native UWP app to a Chromium/WebView2 web wrapper. Reports date this to July/August 2025, and the WebView2 build uses more RAM. — [Windows Latest, 21 July 2025](https://www.windowslatest.com/2025/07/21/whatsapp-for-windows-11-is-switching-back-to-chromium-web-wrapper-from-uwp-native/); [TechSpot](https://www.techspot.com/news/108752-whatsapp-dropping-native-windows-app-favor-web-based.html); [Windows Latest, 13 June 2026](https://windowslatest.com/2026/06/13/whatsapp-is-eating-1-2gb-ram-on-windows-11-even-as-microsoft-kills-web-app-slop)
- OBS forum users report OBS Virtual Camera not appearing in WhatsApp Desktop.
  - One user attributes this to WhatsApp using Media Foundation while the OBS virtual camera is DirectShow-only.
  - Reported workarounds: DroidCam Virtual Output, SplitCam, NDI, or a capture card. Most of these threads date from 2021–2023 and are anecdotal.

  — [OBS forum: new WhatsApp desktop does not work with OBS virtual camera](https://obsproject.com/forum/threads/new-whatsapp-desktop-application-does-not-work-with-obs-virtual-camera.140414/); [OBS forum: WhatsApp desktop app](https://obsproject.com/forum/threads/obs-virtual-cam-is-not-working-with-whatsapp-desktop-app.144629/); [OBS forum: DroidCam virtual output & WhatsApp](https://obsproject.com/forum/threads/obs-droidcam-virtual-output-and-whatsapp-desktop-on-windows-10.175574)

**Telegram Desktop**
- One forum thread reports OBS no longer appearing in Telegram Desktop on an M1 Mac. Others report it missing from Telegram's camera list on Windows. No confirmed fix. — [OBS forum: OBS not working on Telegram Desktop](https://obsproject.com/forum/threads/obs-not-working-on-telegram-dekstop.166901/)

**Google Meet and Discord**
- Chrome-based Meet and discord.com list virtual cameras such as the Facecam Virtual Camera. — [Facecam live face swap](https://facecam.ai/live-face-swap)
- VidMage's tester says Swapface's camera feeds "directly into OBS or Discord". — [VidMage [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)

### Inferences
- **Ranking for the user's four apps:**
  - Meet (in Chrome or Edge) and Discord: easy with any of these apps.
  - Telegram Desktop: usually works but is hit-and-miss.
  - WhatsApp Desktop: hardest. Plan on a ManyCam/WeCam relay (as Swapface documents) or WhatsApp Web in a Chromium browser, and test before paying for a long plan.
- **Testing the new client:** Because the WebView2 WhatsApp client is Chromium-based, virtual cameras that Chrome sees may now appear in WhatsApp Desktop. The old forum complaints mostly predate the switch. This is unverified, so test with the trial or free tier first.
- **Cost of relays:** Any relay adds a hop, which means extra latency and possible scaling or mirroring issues. ManyCam's free tier may add its own watermark; this is not verified here.

### Gaps
- No 2026 primary source confirms whether the WebView2 WhatsApp Desktop build lists OBS Virtual Camera, SwapFaceCam or the Magicam camera.
- No vendor documents Telegram Desktop specifically.
- Magicam's and DLC's compatibility with WhatsApp is undocumented.

---

## Q6. Independent reviews, Reddit/YouTube sentiment, Trustpilot and billing complaints

### Takeaway
- Independent evidence is thin. Most "best live face swap" content is written by competing vendors (Facecam, VidMage) or AI-tool directories with affiliate incentives.
- Swapface has a small, poor Trustpilot record: 2.5/5 from 8 reviews, with complaints about charges continuing after cancellation and an ignored refund request.
- Facecam's terms state that payments are non-refundable.
- I found no Reddit threads on realism through the search tools.

### Cited Findings

**Swapface on Trustpilot**
- TrustScore 2.5/5 from 8 reviews.
- A 1-star review (29 July 2025): "They keep your card information and constantly charge, you cannot contact support and cannot cancel your subscription."
- A 1-star review (January 2026): asked for a refund and was "ignored".
- The company's reply says support is offered via email, Discord and Telegram.

  — [Trustpilot NL-BE](https://nl-be.trustpilot.com/review/swapface.org); [Trustpilot IT](https://it.trustpilot.com/review/swapface.org)

**Swapface in directories and reviews**
- A web-search summary of Swapface review listings mentions "unclear pricing or credit limits … weak customer support" and "complaints regarding unauthorized payments, difficulty canceling subscriptions". The search summary did not say which listing these phrases came from, so treat them as unverified. Candidate pages: [ai-productreviews](https://ai-productreviews.com/swapface-review/); [firmsuggest](https://www.firmsuggest.com/software/swapface/)
- The VidMage blog names Swapface "Best for Twitch Streamers", saying "Facial expressions and blink timing transfer cleanly at low latency". — [VidMage [VENDOR/BIASED]](https://vidmage.ai/blog/best-live-face-swap-app)

**Magicam**
- Product Hunt shows 5.0 from 6 reviews, which is too few to be meaningful. SourceForge has no user reviews. I found no Reddit threads. — [Product Hunt Magicam](https://www.producthunt.com/products/magicam/reviews)

**DeepLiveCam press coverage**
- The press coverage is about misuse and fraud risk (Ars Technica, August 2024: "real-time face swapping on webcams, raising fraud concerns"; PetaPixel; Trend Micro on eKYC), not quality reviews of the paid build. — [Ars Technica (linked from deeplivecam.net)](https://arstechnica.com/information-technology/2024/08/new-ai-tool-enables-real-time-face-swapping-on-webcams-raising-fraud-concerns/)
- Read counts on the official news posts: the 2.7 post shows 16,268 hits and the 2.8 post 5,917, indicating an active paying user base. — [DLC 2.7 post](https://deeplivecam.net/index.php/news/deep-live-cam-2-7-ultimate-lands-with-its-biggest-upgrade-yet); [DLC 2.8 post](https://deeplivecam.net/index.php/news/deeplivecam-2-8-ultimate-early-access)
- The GitHub README warns about fake download sites: "We only have a single official website which is https://deeplivecam.net". — [GitHub](https://github.com/hacksider/Deep-Live-Cam)

**VisoMaster reseller site**
- visomaster.com shows "from 99+ happy users". It is a reseller of packaged builds, not the original authors (it says so itself). — [visomaster.com](https://visomaster.com/)

**Facecam terms**
- "Payments aren't refundable, except where the law says otherwise … If a session fails because of us … we'll give you the credits back." — [Facecam pricing](https://facecam.ai/pricing)

**Bias flags**
- Facecam's comparison guide is "By Facecam team" and promotes its own product. — [Facecam guide](https://www.facecam.ai/guides/live-face-swap-apps-compared)
- VidMage ranks itself "Best Overall". — [VidMage blog](https://vidmage.ai/blog/best-live-face-swap-app)
- The dev.to listicle is flagged "AI-assisted", from an account that joined in September 2026, and lists LiveSwapAI first. — [dev.to](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j)

### Inferences
- The billing complaints concentrate on Swapface, perhaps because it has more users or because of how its cancellation flow works. Either way, its opaque in-app pricing combined with auto-renewal is a risk worth flagging.
- For DeepLiveCam, the risk is mostly fake or unofficial resellers rather than billing complaints.

### Gaps
- No Reddit posts were retrieved; the search returned none for these products.
- No YouTube comparison videos with measured results were retrieved.
- Trustpilot pages for DeepLiveCam, Magicam and Xpression Camera could not be fetched (403), and search returned no review data for them.

---

## Q7. Suitability for the user's HP Victus 15 (i7-13620H, RTX 5060 Laptop 8 GB, 16 GB RAM)

### Takeaway
The laptop meets or exceeds the minimum GPU spec of every local app (6 GB+ VRAM; RTX 3060-class or better) and has a Blackwell GPU that DLC 2.7+ and VisoMaster support explicitly. Its 16 GB RAM is only at the minimum for Swapface and Magicam, both of which recommend 32 GB. Laptop thermal and power limits mean lower FPS than desktop figures, per the DLC FAQ.

Most practical paid local picks:
1. **DeepLiveCam Ultimate (NVIDIA build, $22/mo):** TensorRT, RTX 50 support, 256-px models, mouth mask.
2. **Swapface:** easiest built-in virtual camera, but no public stream price and some billing complaints.
3. **Magicam Pro ($8.99/mo):** cheapest, but thin evidence of quality.

A cloud fallback such as Facecam ($10–50/mo, 720p30) avoids the GPU load but is metered.

### Cited Findings

**Specs vs requirements**
- Swapface:
  - Minimum: 16 GB RAM and RTX 2060/3060 6 GB+. Recommended: 32 GB RAM and RTX 4060 Ti 16 GB / RTX 5070. — [Swapface](https://swapface.org/)
  - "For better realtime performance, we recommend NVIDIA RTX 4070 Ti or a more powerful GPU." — [Swapface manual](https://swapface.org/docs/swapface-stream-user-manual/)
- DLC NVIDIA build:
  - "3060 or higher … 6GB or higher VRAM", CUDA 13.0/13.2. — [DLC plans](https://deeplivecam.net/index.php/plans?plan_id=0&group_id=0)
  - Version 2.7 auto-detects "the latest RTX 50-series". — [DLC 2.7](https://deeplivecam.net/index.php/news/deep-live-cam-2-7-ultimate-lands-with-its-biggest-upgrade-yet)
  - "Do not expect top performance on laptops." — [DLC quickstart FAQ](https://deeplivecam.net/index.php/quickstart)
  - Force the dGPU in the NVIDIA Control Panel. — [DLC FAQ](https://deeplivecam.net/index.php/faq)
- VisoMaster:
  - Native sm_120 builds for RTX 50 "desktop and laptop". The named models are 5070 and up; the 5060 is not named.
  - 8 GB+ enables TensorRT engines.
  - Recommended RAM is 16 GB+.

  — [VisoMaster system requirements](https://visomaster.com/system-requirements)
- Magicam: 8 GB+ VRAM recommended, 32 GB RAM recommended, 16 GB minimum. — [Magicam install guide](https://magicam.ai/blog/2025/02/17/step-by-step-guide-how-to-install-magicam-on-your-computer/)
- Xpression Camera: runs on integrated graphics at minimum, so the RTX 5060 is far more than needed. — [xpressioncamera.com](https://xpressioncamera.com/)
- DLC FPS anchors: 6 GB VRAM ≈ 8 fps; high-end ≈ 20 fps (pre-TensorRT FAQ). — [DLC quickstart FAQ](https://deeplivecam.net/index.php/quickstart)

### Inferences
- **DLC on this laptop:** An 8 GB RTX 5060 Laptop sits above the "6 GB ≈ 8 fps" tier. With TensorRT (2.7+) and the 720p output switch, roughly 15–25 fps is plausible but unverified.
- **Settings for best realism on 8 GB:**
  - Use HyperSwap or ReSwapper at 256 px with the mouth mask.
  - Turn off GFPGAN/GPEN face enhancement (the 15 → 4 fps hit).
  - Use the RTX Upscaler or frame interpolation instead.
- **RAM:** 16 GB is the tightest constraint. Running the swapper, OBS, a ManyCam/WeCam relay, the call app (WhatsApp's WebView2 build alone is RAM-heavy) and Chrome at the same time could cause paging. Upgrading to 32 GB would match Swapface's and Magicam's recommended spec.
- **Power and thermals:** Keep the laptop plugged in and in performance mode. Laptop RTX 5060 power limits vary by model, and the DLC FAQ explicitly warns that laptops run slower.
- **Lighting:** Expect visible artifacts at head turns past roughly 45° and under side lighting with all one-photo tools (VidMage's own test reported brief drift under fast lateral movement and side lighting). Front-facing, evenly lit reference photos and a good webcam (Swapface suggests 2K+) materially help.
- **Ownership cost:** DLC quarterly billing at $40 per 3 months (about $13.33/mo) is the lowest-cost route to TensorRT and RTX 50 support. The VisoMaster package (about $19.99 one-time, claimed) is cheaper still, but it is an unofficial reseller and its live-call workflow is less documented.

### Gaps
- No measured FPS for any of these apps on an RTX 5060 Laptop 8 GB, or any RTX 50 laptop.
- Not verified whether Swapface's "NVIDIA acceleration" for paid users supports Blackwell.
- Not verified whether VisoMaster's sm_120 build names or tests the 5060 Laptop.
