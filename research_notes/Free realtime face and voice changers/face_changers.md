# Free real-time face changers / face swap / avatar tools for live video calls (as of Nov 2026)

Research date: 2026-11-09. Method: official GitHub READMEs fetched via the web (GitHub API was blocked in this session, so stars come from repo pages as rendered on fetch date), vendor and third-party pages, and web searches. Many third-party pages are vendor marketing, which is flagged where it applies. Reddit could not be read directly; only one third-party Reddit mirror turned up.

## Which free tools give the highest quality, are they truly free, and are they maintained?

### Takeaway
The best free option overall is **Deep-Live-Cam**, which is open source and AGPL-3.0. It has about 98k stars, runs on NVIDIA, AMD, Intel and Mac, needs only one photo, and is still actively developed. The free route is the manual install from GitHub. The developer sells a prebuilt "Ultimate" version separately. **VisoMaster** has richer masking and editing and webcam-to-virtual-camera output, but in practice it is NVIDIA-only. **DeepFaceLive** gives the highest realism with a trained DFM model, but it was archived in Nov 2024. **FaceFusion** is very popular (30.6k stars) but is built mainly for processing files. The free tiers of commercial tools (Swapface, Xpression Camera, Facecam and similar) add watermarks, cap daily use, or put live/stream use behind a paid plan.

### Cited Findings
**Deep-Live-Cam (hacksider/Deep-Live-Cam)**
- 97.9k stars, 14.3k forks. License AGPL-3.0. The README is headed "Deep-Live-Cam 2.1.6". It also advertises a separate "Pre-built Deep-Live-Cam 2.8 Ultimate" sold through deeplivecam.net with "30+ exclusive features" (no price on the README). The GitHub Releases section is empty, so the free version means installing manually from source, and the README says this "requires technical skills" — [GitHub README](https://github.com/hacksider/Deep-Live-Cam)
- Needs one source photo. Models: inswapper_128_fp16.onnx plus gfpgan-1024.onnx (about 300 MB downloaded on first run). Features: Mouth Mask (keeps your real mouth movement), Face Mapping (different faces on several people at once). It has a built-in content check that blocks nudity and graphic media — [GitHub README](https://github.com/hacksider/Deep-Live-Cam)
- Python version conflict: the current README says Python 3.11–3.14 (3.14 recommended) with CUDA Toolkit 12.8 and cuDNN — [GitHub README](https://github.com/hacksider/Deep-Live-Cam). A setup tutorial updated in Sep 2026 still says to use Python 3.10 and warns that newer versions break pinned dependencies — [PromptZone tutorial](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c.md). The README should be treated as authoritative.
- The swapper model works at only 128×128 face resolution, and detection input is 320×320. Realism comes from the enhancer pass (GFPGAN or CodeFormer at 512×512) — [VerSprite](https://versprite.com/security-resources/real-time-deepfake-face-swapping)
- A security firm (VerSprite) tested Deep-Live-Cam, DeepFaceLive, FaceFusion, Roop and SimSwap and called Deep-Live-Cam "the best open-source option" for real time. It described some of the others as too slow, some as uncanny, and "many as abandoned" — [VerSprite](https://versprite.com/security-resources/real-time-deepfake-face-swapping)

**DeepFaceLive (iperov/DeepFaceLive)**
- 31k stars, GPL-3.0. **Archived by the owner on Nov 13, 2024**, so the repo is now read-only and gets no updates. Windows 10 builds are hosted on yandex.ru and mega.nz — [GitHub](https://github.com/iperov/DeepFaceLive)
- Two swap modes. DFM uses trained face models, either from a public library or trained yourself in DeepFaceLab "for higher quality". Insight swaps from a single photo. It also has a Face Animator mode — [GitHub](https://github.com/iperov/DeepFaceLive)

**FaceFusion (facefusion/facefusion)**
- 30.6k stars, 5.0k forks, license OpenRAIL-AS. Repo topics include face-swap and lip-sync. Its README lists only run, headless-run and batch-run commands and does not mention webcam or live mode. It says installation "needs technical skills" and links Windows and macOS installers — [GitHub](https://github.com/facefusion/facefusion)
- Install targets: CPU/default, CUDA (cuda@12), CoreML, DirectML, MIGraphX (AMD), OpenVINO — [FaceFusion docs](https://docs.facefusion.io/installation)

**VisoMaster (visomaster/VisoMaster), the Rope-lineage tool**
- 2.1k stars, 375 forks, GPL-3.0, 433 commits, 101 open issues. Installer links point to v0.1.1. Features: "Live Swapping via Webcam: Stream to virtual camera for Twitch, YouTube, Zoom", multiple swapper models, DFM (DeepFaceLab) model support, XSeg occlusion masks, an expression restorer, LivePortrait-based face editor, face restoration, TensorRT — [GitHub](https://github.com/visomaster/VisoMaster)

**Commercial free tiers**
- Swapface: the free plan is reported at $0 with watermark and about 10 swaps per day. Paid plans are reported from $39/month (Pro, no watermark), $69/month (Advance), $249/month (Enterprise) — [ToolMage](https://www.toolmage.com/en/tool/swapface/). One listing says the free plan excludes stream face swap — [Creati.ai](https://creati.ai/ai-tools/swapface-org). An Apr 26, 2026 listing says credits cannot be used for stream swap and live use needs a subscription — [ToolWorthy](https://www.toolworthy.ai/en/tool/swapface). These sources conflict, and none is official.
- Xpression Camera: the free plan carries a watermark. Pro is $8/month or $84/year and Premium $49/month or $499/year according to OpenTools — [OpenTools](https://opentools.ai/tools/xpression-camera). ToolJunction instead lists a $19.99/month Starter plan — [ToolJunction](https://tooljunction.io/ai-tools/xpression-camera). Prices are unverified.
- Facecam (browser-based, Chrome, works with Meet and Discord): "$20–$50 per month + free version with limited functionality" — [AlternativeTo](https://alternativeto.net/software/facecam/about/)
- Facecast: browser tool with a free allowance that outputs through OBS Virtual Camera. The allowance length was not stated — [Facecast](https://facecast.org/)
- Snap Camera shut down in 2023. Streamfog markets itself as the free replacement (AR lenses and VTuber avatars as a virtual camera), but that is a vendor claim — [Streamfog](https://streamfog.com/beauty/snap-camera-alternative/). Webcamoid is a free, open-source filter camera — [AlternativeTo](https://alternativeto.net/software/snap-camera/)

**VTuber / avatar options (fully free, light on the GPU)**
- VSeeFace: free, Windows-only, tracks face and hands for VRM and VSFAvatar 3D models, with no paid tier. Its virtual camera can be selected in Discord calls — [AlternativeTo](https://alternativeto.net/software/vseeface/about); [Streamlabs](https://streamlabs.com/ja-jp/content-hub/post/best-free-vtuber-software)
- VTube Studio has a free tier and can use iPhone face tracking. Animaze, the successor to FaceRig, is listed by some sources as free and by others as free trial/paid — [Streamlabs](https://streamlabs.com/ja-jp/content-hub/post/best-free-vtuber-software); [iTechGuides](https://www.itechguides.com/best/vtuber-software/)
- SplitCam: a free virtual camera with no watermark that can wrap avatar apps for Zoom, Discord, Meet and Teams — [SplitCam](https://splitcam.com/for/vtubers)

### Inferences
- Ranking for realism among free tools: DeepFaceLive with a trained DFM model ≈ VisoMaster with DFM > Deep-Live-Cam with enhancer > Deep-Live-Cam/roop-style 128px swap alone > avatars. Trained DFM models need many hours of training work, so for one-photo use Deep-Live-Cam and VisoMaster are the practical choices.
- None of the commercial "free tiers" found is free without a watermark, a daily cap, or a paywall on live use. For live calls, the open-source tools are the only genuinely free option.
- The 128px inswapper resolution limits sharpness on close-up 1080p video. Enhancers improve it but cut the frame rate heavily (see the hardware section).

### Gaps
- No exact latest release dates for Deep-Live-Cam, FaceFusion or VisoMaster: the Releases sections did not render, and the GitHub API was blocked.
- Did not verify the current status of Rope (Hillobar), roop-cam, iRoopDeepFaceCam or s0md3v/roop. roop is widely reported as discontinued in 2023, but I did not fetch a source for that.
- Did not verify whether FaceFusion 3.x currently has a webcam or stream mode (it had one in older versions), or the official pricing for AKOOL Live Camera, VidMage live swap, Warudo, Webcam Motion Capture, or NVIDIA Broadcast avatar features. The VidMage "best live face swap app 2026" blog page returned only site navigation when fetched.
- Found no newer (2025–2026) open-source real-time face swapper that clearly beats Deep-Live-Cam or VisoMaster.

## Which tools run on ordinary PCs (no NVIDIA, AMD/Intel, CPU-only, laptops, Mac), at what FPS, and do they output a virtual camera?

### Takeaway
Deep-Live-Cam has the widest hardware support: CUDA, DirectML (AMD and Intel on Windows), OpenVINO (Intel), CoreML (Apple Silicon) and CPU fallback. Only NVIDIA CUDA is reliably smooth for live use. DirectML and CoreML work but are slower, and CPU-only is impractical for live calls. Even an RTX 4080 laptop GPU gets only about 15 FPS with the swap alone and about 5 FPS with GFPGAN. DeepFaceLive has a DirectX12 build for AMD and Intel but is Windows-only and archived. VisoMaster is effectively NVIDIA-only. Avatar apps are the realistic choice for weak laptops. For Discord, Telegram, WhatsApp Desktop and Meet, most face-swap tools need OBS Virtual Camera.

### Cited Findings
- Deep-Live-Cam launch flags: `--execution-provider cuda` (NVIDIA), `coreml` (Apple Silicon), `dml` (DirectML on Windows), `openvino` (Intel). CPU is the default fallback "but slower". The prebuilt (paid) builds are listed for Windows, Mac Silicon, CPU, NVIDIA and AMD — [GitHub README](https://github.com/hacksider/Deep-Live-Cam)
- Unofficial free portable builds of Deep-Live-Cam (168 stars, AGPL-3.0, not affiliated with the developers, rebuilt daily from upstream): Windows DirectML for "any GPU / most Windows users", CUDA (needs CUDA 12 and cuDNN 9) for NVIDIA, OpenVINO for Intel, CoreML for macOS. CPU fallback is "much slower", and the first macOS launch takes about 2 minutes — [deep-live-cam-builds](https://github.com/iikuzmychov/deep-live-cam-builds)
- Measured FPS on an RTX 4080 Laptop GPU (12 GB) with 960×540 frames: Deep-Live-Cam about 15 FPS for swap only and about 5 FPS with GFPGAN. VerSprite's optimized fork (DLC4P) reached 27 FPS for swap only and 20 FPS with CodeFormer. The firm's stated minimum is an RTX 3060 with 8 GB+ VRAM — [VerSprite](https://versprite.com/security-resources/real-time-deepfake-face-swapping)
- Qualitative ranking (Sep 2026 tutorial): "A discrete NVIDIA GPU with CUDA is the only configuration that holds a comfortable live frame rate". Apple Silicon/CoreML is usable but slower. DirectML on AMD/Intel is usable but generally behind CUDA. OpenVINO is best on Intel-only machines. CPU-only is "not practical for live webcam use". If two onnxruntime packages are installed, the app can silently fall back to CPU at "a few frames per second". Recommendations: 16 GB+ RAM for live mode, lower capture resolution to gain FPS, keep the Face Enhancer and Many Faces off — [PromptZone](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c.md)
- One DEV Community post claims CPU-only gives about 10–15 FPS but names no hardware, so the figure is unverified and conflicts with the tutorial above — [DEV Community via search](https://dev.to/localfaceswap/deep-live-cam-free-real-time-ai-face-swap-software-1i41)
- DirectML is rated "Good" against "Excellent" for CUDA in one qualitative comparison. I found no independent numeric FPS benchmarks for AMD DirectML or M1/M2 webcam mode — [search summary of pyshine/addrom pages](https://pyshine.com/Deep-Live-Cam-Real-Time-Face-Swap/)
- DeepFaceLive requirements: any DirectX12 GPU, recommended RTX 2070+ or Radeon RX 5700 XT+, an AVX CPU, 4 GB RAM plus a 32 GB+ paging file, Windows 10. The DirectX12 build supports NVIDIA, AMD and Intel. The NVIDIA build (GT730+) is faster. Face Animator runs at 25 FPS on a 35 TFLOPS GPU — [GitHub](https://github.com/iperov/DeepFaceLive)
- VisoMaster: the automatic installer is for "Windows users with an Nvidia GPU" and needs CUDA 12.4.1 and cuDNN. It has built-in virtual camera output — [GitHub](https://github.com/visomaster/VisoMaster)
- FaceFusion supports CPU, CUDA, CoreML, DirectML, MIGraphX (AMD) and OpenVINO — [FaceFusion docs](https://docs.facefusion.io/installation)
- Virtual camera: Deep-Live-Cam shows output only in its own preview window. The usual workflow is to capture that window in OBS, start OBS Virtual Camera, and pick it in Zoom, Meet or Discord — [PromptZone](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c.md); [GitHub README](https://github.com/hacksider/Deep-Live-Cam). Discord may need a full restart before a new camera shows up — [search summary, Facecam guide](https://www.facecam.ai/live-face-swap)
- Avatar setups: one guide says a high-end GPU is not needed for VTubing and that avatar rendering adds minimal load. That is a blog claim, not a benchmark — [Streamlabs](https://streamlabs.com/ja-jp/content-hub/post/best-free-vtuber-software). VSeeFace is Windows-only — [AlternativeTo](https://alternativeto.net/software/vseeface/about)

### Inferences
- **NVIDIA RTX 3060+**: Deep-Live-Cam or VisoMaster plus OBS Virtual Camera. Expect roughly 15–25 FPS at 540p–720p with the enhancer off, based on the 4080-laptop figures.
- **AMD/Intel Windows desktop or laptop**: Deep-Live-Cam with DirectML (or OpenVINO on Intel), or DeepFaceLive's DX12 build. Expect FPS well below the CUDA figures, likely too low for smooth calls on integrated graphics. This is an inference, since no numbers were found.
- **Mac (Apple Silicon)**: Deep-Live-Cam with CoreML is the main free option. Deep-Live-Cam has no built-in virtual camera, and the OBS Virtual Camera route is not verified here for macOS. Do not expect smooth 30 FPS.
- **CPU-only or weak laptops**: real-time face swapping is not practical. VSeeFace or VTube Studio avatars, or browser tools with watermarks, are the fallback.
- Telegram Desktop and WhatsApp Desktop pick up any system webcam device, so OBS Virtual Camera should appear in them like any webcam. This is an inference; I found no source that tested these two apps specifically.

### Gaps
- No verified numeric FPS for Deep-Live-Cam on AMD (DirectML), Intel iGPU (OpenVINO), M1–M4 (CoreML) or CPU-only. Reddit and GitHub issues could not be accessed directly.
- Not verified whether Deep-Live-Cam's live mode on macOS works with OBS Virtual Camera in each target app, or whether WhatsApp Desktop (Windows Store/UWP version) accepts OBS Virtual Camera reliably.

## Which download sources are official, and which lookalike sites carry malware or scam risk?

### Takeaway
Download only from the official sources: github.com/hacksider/Deep-Live-Cam and deeplivecam.net for Deep-Live-Cam, plus each project's own GitHub repo for the other tools. Many lookalike domains exist (for example deeplivecamai.com and deeplive.cam). Their red flags so far come from reputation scanners, not confirmed malware findings.

### Cited Findings
- The Deep-Live-Cam README names deeplivecam.net as the only official website and tells users to be careful about downloading from anywhere other than deeplivecam.net or the GitHub repo. Models are hosted on Hugging Face — [GitHub README](https://github.com/hacksider/Deep-Live-Cam)
- deeplivecamai.com: Gridinsoft lists it as suspicious. ScamAdviser shows "Warned", while BitDefender, Kaspersky, ESET and Google Safe Browsing show "clean". The domain was about 4 months old as of an Aug 2026 report — [Gridinsoft](https://gridinsoft.com/online-virus-scanner/url/deeplivecamai-com)
- deeplive.cam: a Gridinsoft page from Mar 2025 says the domain is about 6 months old and its content looks AI-generated and "created hastily" — [Gridinsoft](https://gridinsoft.com/online-virus-scanner/url/deeplive-cam)
- Many forks and mirrors of Deep-Live-Cam exist on GitHub and Gitee (for example CesarNog, jmhublar, Harshitjoc, gitee markhoo/TUAL), along with copycat "localfaceswap" marketing posts on DEV Community — [search results](https://dev.to/localfaceswap/deep-live-cam-for-mac-exclusive-for-apple-silicon-58o)
- Official DeepFaceLive binaries are linked from the GitHub README to yandex.ru and mega.nz — [GitHub](https://github.com/iperov/DeepFaceLive)
- Official VisoMaster: github.com/visomaster/VisoMaster. Official FaceFusion: github.com/facefusion/facefusion and docs.facefusion.io — [VisoMaster](https://github.com/visomaster/VisoMaster); [FaceFusion docs](https://docs.facefusion.io/installation)

### Inferences
- Paid "Deep-Live-Cam" downloads or "online Deep-Live-Cam" sites that are not deeplivecam.net are unofficial. The unofficial portable builds repo is open source and rebuilds automatically from upstream, which lowers the risk somewhat, but it is still third-party.

### Gaps
- Found no confirmed malware campaign, security-vendor advisory, or VirusTotal report tied to a specific Deep-Live-Cam lookalike.

## What do users say about quality and ease of use?

### Takeaway
Users find Deep-Live-Cam the easiest high-quality one-photo tool, but installing it from source is fiddly (Python and onnxruntime conflicts). Users see DeepFaceLive as more "professional" but complex and NVIDIA-leaning. Quality depends heavily on lighting, head pose, occlusion and the source photo.

### Cited Findings
- A Reddit snapshot (mirror dated Feb 2026) calls Deep-Live-Cam the tool "currently blowing up on TikTok". It describes DeepFaceLive as the more "professional" (and complicated) veteran that is "incredibly powerful but lean-heavy on Nvidia/CUDA" — [Reddit mirror](https://reddit.sentinel-team.org/posts/1reh179/snapshots/2026-02-27T16%3A20%3A05.855409Z)
- Swap quality "varies with lighting, camera resolution, occlusions, and head pose" — [FitGap listing](https://us.fitgap.com/products/033646/deep-live-cam)
- "Lighting matters more than GPU power for clean output". Recommendations: a sharp, front-facing, evenly lit source photo with a neutral expression and a 720p/1080p webcam. Common pitfalls: wrong Python version, duplicate onnxruntime packages, models placed in a subfolder, FFmpeg missing from PATH, macOS camera permission — [PromptZone](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c.md)
- One competing tool (Picsi) is noted as failing on inner-mouth details — [VerSprite](https://versprite.com/security-resources/real-time-deepfake-face-swapping)
- Deep-Live-Cam went viral in Aug 2024 (number one on GitHub), with coverage focused on identity-fraud risk — [Biometric Update](https://www.biometricupdate.com/202408/free-face-swap-tool-goes-to-number-one-on-github); [Ars/PetaPixel coverage](https://petapixel.com/2024/08/14/deep-live-cam-deepfake-ai-tool-lets-you-become-anyone-in-a-video-call-with-single-photo-mark-zuckerberg-jd-vance-elon-musk)

### Inferences
- For non-technical users, setup difficulty (not quality) is the main barrier to the free open-source tools. This is why paid "prebuilt" versions and lookalike sites exist.

### Gaps
- Could not access Reddit, GitHub Issues or YouTube reviews directly, so there is no first-hand sentiment on VisoMaster live mode, FaceFusion webcam use, or AMD/Mac performance.
