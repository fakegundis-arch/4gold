# Real-time face swap for video calls: cross-vendor quality, value, safety, detection and legal limits (as of 14 Nov 2026)

Scope note: research was done on 14 Nov 2026 using web search and page fetches. Several numbers came from search-engine summaries of pages that were not opened in full; these are marked "(search summary)". Vendor-written comparisons are flagged. Reddit threads and YouTube videos did not come up in search (see Gaps).

## 1. Independent head-to-head quality tests: paid tools (Swapface, Magicam, AKOOL, VidMage, Xpression) vs free (Deep-Live-Cam, VisoMaster, DeepFaceLive)

### Takeaway
I found no independent, controlled, side-by-side test of live quality or FPS between Deep-Live-Cam and the paid desktop apps (Swapface, Magicam, AKOOL, VidMage, Xpression) dated 2025–2026. Every "comparison" I found is a listicle, a directory entry or a test run by a vendor of its own product. The facts that can be checked point to a different trade-off from what vendors claim. Paid apps mainly sell convenience: a packaged installer, a virtual-camera output and voice features. They do not show proven better realism. Their hardware needs are about the same as free tools (Swapface needs an RTX 2060 6 GB, Magicam an RTX 2070+), and the free tools' quality ceiling depends mostly on which swap model and enhancer you use.

### Cited Findings
**No independent test found**
- A search for head-to-head comparisons found only setup guides and vendor pages, with no measured FPS or artifact comparison of Deep-Live-Cam, Swapface and DeepFaceLive on the same hardware and clip — [dev.to listicle](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j); [topai.tools](https://topai.tools/alternatives/deep-live-cam) (search summary).

**The most detailed comparison is vendor-written (facecam.ai, Oct 2026)**
- Facecam's own "Live Face Swap Apps Compared: 9 Apps Checked (2026)" is published by Facecam to promote Facecam. Its only measured number is from Facecam's own test call (2026-10-03): 1280×720 at 30 fps input, 16.8 swapped frames per second on average. Details for the other apps were copied from their own websites on 2026-10-16, and the page gives no quality ratings — [facecam.ai guide](https://www.facecam.ai/guides/live-face-swap-apps-compared).
- Figures from that page:
  - Deep-Live-Cam: free, AGPL-3.0, local, GPU recommended; runs in its own window, so routing into calls needs OBS or similar.
  - Swapface: local, NVIDIA RTX 2060 or 3060 with 6 GB+, "free to start", no published speed.
  - VidMage: runs locally on Apple-silicon Macs; $14.99/mo or $8.33/mo billed yearly; free tier is 5 min/day with a watermark.
  - xpression camera: Windows 10 or macOS 12.3+; integrated graphics minimum, GTX 1660 suggested; $12/mo with a 7-day Pro trial.
  - Cloud tools: FaceLive and LiveSwap $12/mo for 15 min (LiveSwap at 480p); Liveface $7.99/day or $19.99 for 30 days.
  - Source: [facecam.ai guide](https://www.facecam.ai/guides/live-face-swap-apps-compared).

**Hardware and pricing listings (secondary sources)**
- Magicam needs an RTX 2070 or better. Paid plans are listed at $8.99/mo or $49.90/yr; the free tier carries a watermark — [dev.to listicle](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j) (search summary).
- Mac Informer (dated 12 Oct 2026) describes Magicam's free plan as single-photo real-time swap with unlimited time, a watermark and virtual-camera output. Pro is $8.99/mo and removes the watermark and adds "enhanced HD" — [Mac Informer listing](https://macdownload.informer.com/magicam/) (search summary).
- Magicam on Product Hunt: 6 reviews, rated 5.0, praising easy setup and convincing swaps. Criticisms: "efficiency and accuracy under load", limited payment options, paywalled features. Magicam's voice cloning is reported to have a slight delay or mismatch with the face — [Product Hunt Magicam](https://www.producthunt.com/products/magicam/reviews); [dev.to listicle](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j) (search summary). The sample is very small and not independent.
- xpression camera Product Hunt reviews (about 1–2 years old) say face tracking is poor ("head is always cut off") — [Product Hunt xpression](https://www.producthunt.com/products/xpression-camera/reviews?review=560145) (search summary).

**Deep-Live-Cam's own speed figures**
- About 8 fps on a 6 GB NVIDIA card, about 20 fps on high-end cards, 6–10 fps on AMD or Mac. The FAQ says "desktop is way faster than laptop even when using similar CPU/GPU" — [topai.tools quoting Deep-Live-Cam FAQ](https://topai.tools/alternatives/deep-live-cam); [promptzone tutorial](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c) (search summary).

**Deep-Live-Cam: current state and paid build**
- The README is titled 2.1.6. A paid pre-built "2.8 Ultimate" edition is advertised with "30+ exclusive features" and priority support; no price is shown on GitHub.
- The repo had 98.1k stars and 14.3k forks at fetch time.
- The README warns to download only from deeplivecam.net or the GitHub repo.
- Source: [GitHub hacksider/Deep-Live-Cam](https://github.com/hacksider/Deep-Live-Cam).
- Release notes say the "2.7.5 Ultimate" build is downloadable only from deeplivecam.net/index.php/quickstart — [Deep-Live-Cam releases](https://github.com/hacksider/Deep-Live-Cam/releases) (search summary).

**DeepFaceLive**
- Described as archived upstream; one guide says newcomers "may want to consider actively maintained alternatives" — [tooljunction](https://www.tooljunction.io/ai-tools/deepfacelive); [deepface.cam blog](https://deepface.cam/blog/deep-face-cam-vs-deepfacelive/). The second source is a competing vendor.
- Up to about 25 fps, with a 35+ TFLOPS GPU suggested for that rate. A promotional page claiming 60 fps should be discounted — [tooljunction](https://www.tooljunction.io/ai-tools/deepfacelive) (search summary).

**Model quality ceiling**
- inswapper_128, the one-shot model used by Deep-Live-Cam/FaceFusion-class tools, was trained on 128×128 face crops. It "can appear slightly blurry or lacking fine details" and is usually paired with an enhancer or upscaler. The "128" is the crop size, not the output resolution — [1337sheets model comparison](https://1337sheets.com/comparing-face-swap-models-blendswap-ghost-inswapper-simswap-uniface/); [deepwiki inswapper_128](https://deepwiki.com/deepinsight/inswapper-512-live/5.1-first-generation:-inswapper_128) (search summary).
- InsightFace (deepinsight) has published "inswapper-512-live". It claims less than 1/10 the compute of inswapper_128 and 16× the pixel count; these are the vendor's own figures — [GitHub deepinsight/inswapper-512-live](https://github.com/deepinsight/inswapper-512-live) (search summary).

**Trend Micro on price vs quality (July 2025)**
- Trend Micro's July 2025 underground research says "higher prices often reflect better performance, which can make deepfakes harder to detect". It also notes that paid plans remove watermarks.
- It names free tools (Deep-Live-Cam, DeepFaceLive, Avatarify) as the ones criminals actually use for live swaps, and says open-source tools "need technical skill and powerful hardware".
- Source: [Trend Micro, "Deepfake It 'til You Make It", 9 Jul 2025](https://www.trendaisecurity.com/en-gb/resources-insights/research/deepfake-it-til-you-make-it-a-comprehensive-view-of-the-new-ai-criminal-toolset).

### Inferences
- With no independent test, a ranking cannot honestly say "paid looks better than Deep-Live-Cam". The defensible framing: the paid desktop apps (Swapface, Magicam) run the same kind of one-shot swap locally on similar GPUs. What they sell is packaging, a virtual camera, presets and voice features, not a proven realism gain.
- Hypothesis, not verified: many one-shot apps may use InsightFace-family models like the open tools. None of the paid vendors I checked disclose their model.
- Free tools can match or beat paid quality on the same GPU if the user enables an enhancer, mouth mask and a newer model. The cost is setup effort.
- Trained per-identity models (DeepFaceLive DFM) are the classic route to higher fidelity. But DeepFaceLive is reported archived, and no source in this session measured DFM against inswapper quality.
- On value, Magicam ($8.99/mo) and xpression ($12/mo) are cheap enough that the real costs are watermark removal and recurring billing risk (Section 4), not the sticker price.

### Gaps
- No Reddit threads (r/DeepFaceLab, r/FaceFusion, r/StableDiffusion) and no YouTube head-to-head videos appeared in search results. Reddit consensus could not be documented.
- No security-lab evaluation (Sensity, Kaspersky, Trend Micro) found that rates live realism of named tools against each other.
- Not found: AKOOL live-camera pricing and hardware needs, VidMage Windows availability, and Swapface current pricing.
- No measured comparison of DeepFaceLive DFM vs inswapper_128 vs inswapper-512-live.

## 2. Known realism weaknesses of real-time face swap, and settings that help

### Takeaway
Live one-shot swaps fail most often on profile views (past about 45° yaw), hands or objects crossing the face, glasses, hairlines and jawlines, fast motion (tracking drift), and lighting or skin-tone mismatch. The 128 px swap crop also leaves the face soft. In Deep-Live-Cam the main fixes are:
- **Mouth mask:** keeps the real mouth and chin, so lip movement looks natural.
- **Face enhancer** (GFPGAN, GPEN-256 or GPEN-512, now all ONNX): sharpens the face but costs heavy FPS, from about 20 down to 6 fps on an RTX 4080 Super in one report.
- **Many Faces off:** keeps FPS up.
- **A good frontal, well-lit source photo.**

### Cited Findings
**Failure modes**
- Profile views carry the least identity information, so cheap tools "drift exactly when the head moves" — [itechguides](https://www.itechguides.com/why-do-ai-face-swaps-slip-during-head-turns-6-fixes-that-help/) (search summary).
- An early face-swap CNN paper found results worse for profile than frontal views because training data skewed frontal. Glasses "were removed by the network and can lead to artefacts" — [Korshunova et al., arXiv 1611.09577](https://arxiv.org/pdf/1611.09577).
- Hard-mask swaps fail at "jawlines, hairlines, glasses, hands in front of the face". Cheaper tools "smear occluders into the skin" instead of drawing them over the swap — [morphed.app (vendor)](https://morphed.app/blog/advanced-face-swap-techniques) (search summary).
- Past roughly 45° rotation, live deepfake tools "typically produce edge blurring, texture smearing, or a warping artifact around the jaw and ear line". A 90° profile "often breaks the illusion". A quick hand wave across the face often makes the face "leak" through the hand or glitch at the edge — [netarx](https://www.netarx.com/blog/how-to-spot-deepfake-video-call); [adaptivesecurity](https://www.adaptivesecurity.com/blog/how-to-detect-deepfake-ai-videos-visual-audio-and-behavioral-techniques-that-work) (search summaries; vendor blogs).
- Telltales listed by HitPaw: unnatural blinking, mismatched skin tones, inconsistent lighting or shadows, and artifacts in fast motion — [HitPaw guide](https://online.hitpaw.com/learn/real-time-face-swap.html) (search summary; vendor).
- In an April 2026 test of 10 face-swap tools (free tiers, non-real-time), the headline claimed 80% "failed on side profiles". The article gives no per-angle data. The only number is a ~65% side-face failure rate for Live3D, which was 0/10 usable, with no method shown. Small samples; no disclosed affiliation — [dev.to test](https://dev.to/alyna_sylvan/i-tested-10-face-swap-tools-80-failed-on-side-profiles-heres-why-j84).
- Deep-Live-Cam GitHub issue #1462: on an RTX 5090 with CUDA 12.8 and onnxruntime-gpu 1.22.0, the face mask was misaligned and flickered — [GitHub issue #1462](https://github.com/hacksider/Deep-Live-Cam/issues/1462) (search summary).
- GANs are near real-time. Diffusion swappers handle hard angles and lighting better but "cannot do real-time at all yet" — [lovart.ai guide](https://www.lovart.ai/es/blog/complete-guide-ai-face-swap-photo-video) (search summary; vendor).

**Settings that help**
- **Mouth mask:** "Retain your original mouth for accurate movement using Mouth Mask" — [GitHub README](https://github.com/hacksider/Deep-Live-Cam). The slider runs from 0 (inserted mouth) to 100 (original mouth and chin kept), and is described as a cheap way to keep natural lip movement — [terminalskills page](https://terminalskills.io/skills/deep-live-cam) (search summary).
- **Face enhancer:** rebuilt fully on ONNX, with a choice of GFPGAN, GPEN-512 or GPEN-256; enabling it lowers performance — [Deep-Live-Cam releases](https://github.com/hacksider/Deep-Live-Cam/releases) (search summary). The README lists `face_enhancer` using `gfpgan-1024.onnx` — [GitHub README](https://github.com/hacksider/Deep-Live-Cam).
- **Measured enhancer cost:** an RTX 4080 SUPER user reported 20 fps without the enhancer and 6 fps with it, with the GPU "barely loaded" (i.e. a software or config bottleneck) — [GitHub issue #708](https://github.com/hacksider/Deep-Live-Cam/issues/708) (search summary).
- **Mouth-mask speed claim:** 25–30 fps on an RTX 3060 with mouth mask on, settings unstated and unverified — [terminalskills page](https://terminalskills.io/skills/deep-live-cam) (search summary).
- **Many Faces:** listed as a common cause of low FPS; disable it for single-person calls. Advice is to leave the enhancer off while framing — [promptzone tutorial](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c) (search summary).
- **Other features:** Face Mapping (different faces per subject) and Many Faces (`--many-faces`). Poisson blending, interpolation and colour correction are not on the README page — [GitHub README](https://github.com/hacksider/Deep-Live-Cam).
- **Testing advice:** test side profiles, glasses, occlusion and mouth movement on a short clip before committing to any tool — [deepface.cam guide](https://deepface.cam/blog/local-face-swap-software/) (search summary; vendor).

### Inferences
- For video calls, the best realism-per-FPS settings on a mid GPU are:
  - mouth mask on;
  - enhancer off, or GPEN-256 only if FPS allows;
  - Many Faces off;
  - a high-quality frontal source image with similar skin tone and lighting;
  - camera at eye level with soft frontal light;
  - avoid head turns past 45°, hands near the face, and thick-framed glasses.
- These weaknesses are also exactly what call partners and fraud screeners test (Section 5). A ranking should not call any current tool "undetectable".

### Gaps
- No controlled study found that measures artifact rates by yaw angle or occlusion for Deep-Live-Cam vs paid tools.
- No source found on how much a trained DFM model (DeepFaceLive) improves profile or occlusion handling compared with one-shot tools.

## 3. Face swap plus voice changer on an RTX 5060 Laptop (8 GB VRAM, 16 GB RAM); Blackwell / CUDA 12.8 compatibility

### Takeaway
**Compatibility:** Deep-Live-Cam's current README targets a Blackwell-ready stack: CUDA Toolkit 12.8.0, PyTorch from the cu128 index, onnxruntime-gpu 1.26.0. So an RTX 50-series laptop should work if installed per the current README. Older guides that pin onnxruntime-gpu 1.16.3 and CUDA 11.x will fail or fall back to CPU. VisoMaster on RTX 50-series is still messy: issue #130 is open, unresolved and has no maintainer reply. ONNX Runtime 1.27+ wheels on PyPI default to CUDA 13, so the CUDA major version must match across torch and onnxruntime.

**Performance:** no benchmark exists for this exact laptop. Deep-Live-Cam's own numbers (8 fps on 6 GB cards, about 20 fps high-end, laptops slower than desktops) and RVC guidance (6 GB+ VRAM, "8 GB comfortable") suggest running both on 8 GB is feasible but tight. Expect roughly 10–20 fps without the enhancer, and well under 10 fps with it (inference).

### Cited Findings
**Compatibility**
- Current Deep-Live-Cam README:
  - Python 3.11–3.14 supported, 3.14 recommended;
  - NVIDIA: CUDA Toolkit 12.8.0 and cuDNN v8.9.7 for CUDA 12.x;
  - PyTorch installed with `-U` from the cu128 index;
  - onnxruntime-gpu 1.26.0;
  - DirectML or legacy CoreML use onnxruntime 1.21.0;
  - RTX 50-series not mentioned.
  - Source: [GitHub README](https://github.com/hacksider/Deep-Live-Cam).
- An older archived README copy pinned `onnxruntime-gpu==1.16.3`, which needs CUDA 11.x, not 12.x — [archived README mirror](http://gitlab.zodioo.com/diaojiaolou/Deep-Live-Cam/src/commit/03fb6bf619fd0cff8bced128fdcd060c8bfff100/README.md) (search summary).
- Common Deep-Live-Cam GPU errors: "[ONNXRuntimeError] : 1 : FAIL : LoadLibrary failed with error 126" for `onnxruntime_providers_cuda.dll`, and "CUDA_PATH is set but CUDA wasn't able to be loaded". Both come from mismatched CUDA/cuDNN/onnxruntime versions, and most reports are CUDA 11.x-era — [issue #954](https://github.com/hacksider/Deep-Live-Cam/issues/954); [issue #1140](https://github.com/hacksider/Deep-Live-Cam/issues/1140) (search summary).
- PyTorch: only cu128 (CUDA 12.8) and later builds include sm_120 (Blackwell) kernels; cu126 and below do not — [PyTorch forum sm_120 RTX 5060](https://discuss.pytorch.org/t/pytorch-support-for-sm-120-nvidia-geforce-rtx-5060/220941); [localaimaster fix](https://localaimaster.com/blog/no-kernel-image-available-rtx-50) (search summary).
- ONNX Runtime: from version 1.27, onnxruntime-gpu wheels on PyPI are built with CUDA 13.0 by default. CUDA 12.x packages need CUDA 12.8+. onnxruntime-gpu works with PyTorch only when both use the same CUDA/cuDNN major version — [ONNX Runtime CUDA EP docs](https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html) (search summary).
- Example of silent CPU fallback: RAGFlow on RTX 50-series fell back to CPU because of an onnxruntime cu12 vs torch cu13 mismatch — [ragflow issue #14565](https://github.com/infiniflow/ragflow/issues/14565) (search summary).
- **VisoMaster issue #130** (opened 5 Dec 2025, still open, no maintainer reply):
  - Reporter has an RTX 5060 Ti 16 GB; another user's error reads "RTX 5090 Laptop GPU with CUDA capability sm_120 is not compatible with the current PyTorch installation".
  - Suggested fix (one user, unconfirmed by others): PyTorch 2.7–2.8 cu128, onnxruntime-gpu 1.22.0, TensorRT 10.13.x.
  - One user reports success with CUDA 13.0 plus nightly PyTorch cu130.
  - Another reports VisoMaster "has not worked on any RTX 50-series PC since April 2025", still failing in March 2026.
  - A commenter offered paid help via WhatsApp, a likely scam vector.
  - Source: [VisoMaster issue #130](https://github.com/visomaster/VisoMaster/issues/130).

**Performance and VRAM**
- Deep-Live-Cam: about 8 fps on 6 GB NVIDIA cards, about 20 fps high-end, and laptops markedly slower than desktops with similar chips — [topai.tools](https://topai.tools/alternatives/deep-live-cam); [promptzone](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c) (search summary).
- Enhancer cost: 20 fps without, 6 fps with, on an RTX 4080 SUPER — [issue #708](https://github.com/hacksider/Deep-Live-Cam/issues/708) (search summary).
- RVC (w-okada) voice changer:
  - "Any NVIDIA RTX card with 6GB+ VRAM can run AI voice conversion inference in real-time. 8GB VRAM is comfortable; 12GB gives headroom." Another guide gives 4 GB minimum, 8 GB+ recommended for 48 kHz.
  - Latency: sub-200 ms, or 50–150 ms "with proper configuration", noticeable in direct conversation. Chunk size and extra-buffer settings are the latency levers.
  - Sources: [voxbooster GPU guide](https://voxbooster.com/blog/voice-changer-gpu-acceleration-explained); [voxbooster latency guide](https://voxbooster.com/blog/real-time-ai-voice-changer); [Hugging Face w-okada guide](https://Huggingface.co/blog/Lenylvt/w-okada) (search summaries; blogs, not benchmarks).
- No source found that tests a face swap and a voice changer on the same GPU at the same time — (search returned none).
- Magicam bundles real-time voice cloning, reported to have slight delay or mismatch with the face — [dev.to listicle](https://dev.to/hoffmon/7-real-time-ai-face-swap-tools-to-consider-in-2026-4c7j) (search summary).
- Trend Micro: in January 2025 a criminal said he used DeepFaceLive with DeepFaceLab plus "AI Voice Changer" to pass KYC at two crypto exchanges — so face and voice combined is an established pattern — [Trend Micro, Jul 2025](https://www.trendaisecurity.com/en-gb/resources-insights/research/deepfake-it-til-you-make-it-a-comprehensive-view-of-the-new-ai-criminal-toolset).

### Inferences
- **On an 8 GB RTX 5060 Laptop:**
  - Deep-Live-Cam (enhancer off, mouth mask on) plus an RVC voice changer will compete for VRAM and compute. Expect lower FPS than either tool alone.
  - A reasonable expectation is low-to-mid teens fps for the swap with the enhancer off, dropping to single digits with GFPGAN. This is extrapolated from 6 GB ≈ 8 fps, high-end ≈ 20 fps and laptop < desktop; it is not measured.
  - Laptop power limits (TGP) will matter.
- 16 GB system RAM is likely adequate but tight when running OBS, a browser or call app, the face swap and RVC together. No source measured this.
- Voice-changer latency (50–200 ms) plus face-swap frame latency will desync lips unless audio and video delays are matched in OBS or the call app. This is inference; no source tested it.
- **Practical rule for the report:** RTX 50 laptops need CUDA 12.8+ builds of both PyTorch and onnxruntime-gpu with the same CUDA major. Avoid one-click installers or old guides pinning onnxruntime-gpu 1.16.x or CUDA 11.8. Paid packaged apps sidestep the dependency problem only if the vendor has shipped a Blackwell-compatible build; I found no vendor statement on this for Swapface, Magicam or AKOOL.

### Gaps
- No benchmark for any face-swap tool on an RTX 5060 Laptop GPU specifically.
- No confirmation of Blackwell (RTX 50) support from Swapface, Magicam, AKOOL, VidMage or xpression.
- No source on VRAM use of Deep-Live-Cam models (inswapper_128 plus GFPGAN or GPEN) or of RVC models when run together.
- DeepFaceLive on RTX 50-series: no reports found. It is reportedly archived, so updates for new CUDA versions are unlikely.

## 4. Safety: malware, lookalike sites and cracked apps; vendor privacy; billing complaints

### Takeaway
**Malware:** the free route carries real supply-chain risk.
- Trojanized "Deep-Live-Cam" builds on lookalike GitHub accounts (e.g. `deeplivecamvfx`) delivered AsyncRAT/VenomRAT stealers.
- On 8 Sep 2026 the official hacksider/Deep-Live-Cam repo itself was compromised for about 9.5 hours with a crypto-clipboard hijacker in `requirements.txt`.

**Billing:** the paid route carries billing risk.
- AKOOL: Trustpilot complaints describe trials auto-renewing into annual charges of $200–375, and charges after cancelling (March 2026).
- Swapface: TrustScore 2.5/5 on a small sample (8 reviews), with cancellation and refund complaints.
- xpression camera: "charging me each month… for nothing" complaints on Product Hunt.
- Vendor privacy terms for live face swap were mostly unclear or not found.

### Cited Findings
**Supply-chain compromise of the official repo (Sep 2026)**
- What happened: commit `7895c547`, titled "chore: update requirements.txt", was pushed to `main` of the official hacksider/Deep-Live-Cam at 15:58:54 UTC on 8 Sep 2026. It rewrote 18 entries and added `requests @ git+https://github.com/pypls/requests.git`. Issue #1930 was opened at 01:26 UTC on 9 Sep, and the revert `55d306d5` came at 01:37 UTC — about 9 h 39 min of exposure.
- How it ran: hidden encoded code in the fake package's `setup.py` (pushed 434 spaces off-screen) runs at install time, on Windows and macOS only. It fetches a stage-2 payload from a Telegraph page. The payload hijacks the clipboard every ~0.3 s and swaps BTC, ETH, Tron and Solana addresses for attacker addresses.
- Persistence: `HKCU\...\Run\SysHelper` on Windows; `~/Library/LaunchAgents/com.user.syshelper.plist` on macOS.
- Indicators of compromise: `%LOCALAPPDATA%\WindowsHelper\sys.pyw` and `~/Library/Application Support/HowToFind/sys.py`.
- Reverting `requirements.txt` does not remove dropped files.
- The maintainer reported unusual account access despite 2FA.
- No infection counts are known.
- Source: [SafeDep technical analysis](https://safedep.io/deep-live-cam-supply-chain-attack/).

**Lookalike GitHub account and mirrors**
- ANY.RUN sandbox flagged `github.com/deeplivecamvfx/Deep-Live-Cam/releases/download/DeepLiveCam_NVIDIA/DeepLiveCam_NVIDIA_build_25_05_2024.rar` as malicious, tagged asyncrat, rat, stealer and autorun-sched, with a VenomRAT certificate. `deeplivecamvfx` is a lookalike account, not the official hacksider repo — [ANY.RUN report](https://any.run/report/983ec40b11e19476453291698f6379b1e1c9dc0b4ed149dc3b3507430efb3201/ce1f6e31-69f5-4d26-b943-f7afca161c46) (search summary).
- A site at deeplivecamvfx.com ("Deep Live Cam VFX – Free Real-time Face Swap AI Software") appears in search results — [deeplivecamvfx.com](https://www.deeplivecamvfx.com/). Not verified as malicious; it shares its name with the malware-hosting GitHub account.
- The official sources are github.com/hacksider/Deep-Live-Cam and deeplivecam.net only — [GitHub README](https://github.com/hacksider/Deep-Live-Cam).
- The SourceForge page is an unofficial mirror "not affiliated" with the project. Third-party portable builds such as `iikuzmychov/deep-live-cam-builds` exist with no security audit found — [SourceForge mirror](https://sourceforge.net/projects/deep-live-cam.mirror/); [portable builds repo](https://github.com/iikuzmychov/deep-live-cam-builds) (search summary).

**Wider pattern**
- Fake AI-tool installers are a known pattern: McAfee found fake DeepSeek installers delivering keyloggers and password stealers, often reached via search engines — [TechRadar](https://www.techradar.com/pro/security/fake-deepseek-installers-are-infecting-your-device-with-dangerous-malware) (search summary).
- A "fake camera failure" Web3 job-interview scam pushes victims to install "fixes" that are infostealers. This is relevant to anyone hunting for webcam or face-swap drivers — [cyberpress](https://cyberpress.org/fake-camera-scam-drops-malware/) (search summary).
- VisoMaster issue #130 includes a stranger offering paid "help" via WhatsApp — [VisoMaster issue #130](https://github.com/visomaster/VisoMaster/issues/130).

**Billing: Swapface**
- Swapface (swapface.org) on Trustpilot: TrustScore 2.5/5 from 8 reviews, with 33% of negative reviews answered. One reviewer says the company "keeps card information and constantly charges", that they could not cancel and had to block the card. A January 2026 one-star review says a refund request was ignored. Swapface replies that it supports users via email, Discord and Telegram — [Trustpilot swapface.org (nl-be)](https://nl-be.trustpilot.com/review/swapface.org) (search summary).

**Billing: AKOOL (Trustpilot)**
- A 3-day trial "automatically rolled over into an annual subscription and I was charged 200+ USD".
- A $375 charge was reimbursed after a "misunderstanding".
- A 2025 review says the site wouldn't allow cancelling, so the user had to email support; AKOOL points to account → billing → subscription.
- In a 2026 reply, AKOOL says users often "did not cancel the subscription successfully, or they have multiple accounts".
- A March 2026 reviewer was charged after cancelling a trial and was ignored.
- Sources: [Trustpilot AKOOL p.3](https://uk.trustpilot.com/review/akool.com?page=3); [Trustpilot AKOOL p.2](https://ie.trustpilot.com/review/akool.com?page=2) (search summary).

**Billing: xpression, Magicam, VidMage**
- xpression camera (Product Hunt, about 1–2 years old): "Kind of a rip-off. They've been charging me each month since December for nothing"; "zero support… only one option: pay" — [Product Hunt xpression reviews](https://www.producthunt.com/products/xpression-camera/reviews?review=560145) (search summary).
- No Trustpilot pages found for Magicam, VidMage or xpression. A "Magica" (magica.com) Trustpilot complaint is a different company — (search summary; [Trustpilot Magica](https://uk.trustpilot.com/review/magica.com)).

**Privacy**
- A "SwapFace App" privacy policy (effective 1 Aug 2024) says photos and videos are "stored on the SwapFace's server" and that facial feature data is used only to provide face swapping — [SwapFace App privacy policy](https://sites.google.com/view/swapface-privacy-policy) (search summary). It is unclear whether this is the same company as the swapface.org desktop app; it may be an unrelated mobile app with the same name.
- An App Store "SwapFace AI – Face Swap" listing shows "Data Not Collected" (the developer's own label) — [App Store](https://apps.apple.com/us/app/-/id6752252675) (search summary).
- Deep-Live-Cam processes locally, and its README says a built-in check blocks nudity, graphic content and war footage. It asks users to get consent and label outputs as deepfakes, and says the project may add watermarks or shut down if legally required — [GitHub README](https://github.com/hacksider/Deep-Live-Cam).

### Inferences
- **Safety ranking:**
  - Local tools (Deep-Live-Cam, Swapface desktop, Magicam desktop) keep face data on-device during live use, which is better for privacy. But open-source installs from source carry supply-chain risk, and unofficial builds carry trojan risk.
  - Cloud live-swap services (FaceLive, LiveSwap, Liveface, AKOOL) necessarily upload webcam frames.
  - Paid apps carry recurring-billing risk, especially trials that convert to annual plans.
- **Safest practical path for the free tool:**
  - install only from github.com/hacksider or deeplivecam.net;
  - pin to a commit made after the 9 Sep 2026 revert;
  - check that `requirements.txt` has no `git+https://github.com/pypls` lines;
  - never download "cracked" or "Ultimate" builds from third parties.
- **Safest path for paid apps:** pay monthly rather than via a trial that rolls over, use a virtual or limited card, and screenshot cancellation confirmations.

### Gaps
- Not found: current privacy policies of swapface.org, Magicam, AKOOL live-camera, VidMage and xpression, including whether face images are uploaded or retained.
- No specific reports found of fake "cracked Swapface/Magicam" sites. The general fake-AI-installer pattern is documented, but not for these brands.
- Trustpilot samples are small and unverified. Review authenticity could not be checked.
- VidMage had no billing or complaint data in results.

## 5. Legal, ToS, fraud use and detection (brief)

### Takeaway
Live face swap for consenting, non-deceptive fun is legal in most places, but the boundaries are tightening:
- **EU:** AI Act Art. 50(4) deepfake disclosure has applied since 2 Aug 2026. The Digital Omnibus did not delay it.
- **US:** the TAKE IT DOWN Act's 48-hour platform takedown duty has been FTC-enforced since 19 May 2026, at up to $53,088 per violation.
- **UK:** creating sexually explicit deepfakes of adults without consent has been a crime since 6 Feb 2026.

Platform rules ban deceptive impersonation (Discord) and non-consensual intimate media; Meta has shifted to labelling. Live deepfakes are documented in romance and pig-butchering scams, KYC bypass and executive-impersonation fraud. Detection is moving to real-time multimodal tools (Fraunhofer prototype, Aug 2026) and active challenges (head turn, hand wave, screen-light probing). None is foolproof.

### Cited Findings
**EU**
- The Digital Omnibus on AI, Regulation (EU) 2026/1744, has been in force since 27 Jul 2026. It moved high-risk obligations (Annex III to 2 Dec 2027; Annex I to 2 Aug 2028) but not the Art. 50 transparency duties.
- Deepfake labelling under Art. 50(4) applied from 2 Aug 2026 as planned. Only Art. 50(2) machine-readable marking gets a grace period to 2 Dec 2026 for generative systems already on the market.
- Sources: [Mayer Brown, Jul 2026](https://www.mayerbrown.com/en/insights/publications/2026/07/eu-ai-act-news-digital-omnibus-on-ai-new-guidance-on-risk-classification-gpai-and-transparency-obligations); [Technology.org, 13 Oct 2026](https://www.technology.org/2026/10/13/eu-ai-act-deadlines-after-the-digital-omnibus-what-applies-from-december-2026-to-august-2028/); [TechTimes](https://www.techtimes.com/articles/320101/20260710/eu-ai-act-enforcement-here-chatbot-rules-live-high-risk-ai-delay-now-binding-law.htm) (search summaries; secondary legal commentary, Official Journal not checked).

**US**
- TAKE IT DOWN Act platform duties have been enforced by the FTC since 19 May 2026. Platforms must remove non-consensual intimate images, including AI "digital forgeries", and known copies within 48 hours of a valid request, at civil penalties up to $53,088 per violation.
- FTC Chair Ferguson sent compliance letters to Amazon, Alphabet, Apple, Discord, Match Group, Meta, Microsoft, Reddit, Snapchat, TikTok, X and others.
- State laws (e.g. CA, NY, TX) may impose stricter requirements.
- Sources: [WilmerHale, 15 Jun 2026](https://www.wilmerhale.com/en/insights/client-alerts/20260615-the-take-it-down-act-goes-live); [Wiley](https://www.wiley.law/alert-May-19-Deadline-for-TAKE-IT-DOWN-Act-Compliance-Is-Your-Company-Prepared); [ComplexDiscovery](https://complexdiscovery.com/ftc-sets-may-19-enforcement-clock-for-the-take-it-down-act-with-53088-per-violation-on-the-table/) (search summaries).

**UK**
- Data (Use and Access) Act 2025 s.138: from 6 Feb 2026, intentionally creating or requesting "purported intimate images" of an adult without consent is an offence.
- The sharing offence (which covers deepfakes) was added by the Online Safety Act 2023.
- The government is designating creation as a priority offence under the Online Safety Act.
- A Crime and Policing Act 2026 adds measures against nudification tools. A Kingsley Napley article dated 28 May 2026 refers to it as an Act; Royal Assent status was not independently verified.
- Sources: [gov.uk press release](https://gov.uk/government/news/better-protection-for-victims-thanks-to-new-law-on-sexually-explicit-deepfakes); [Lawtons](https://www.lawtonslaw.co.uk/resources/law-on-explicit-deepfakes-uk/); [Kingsley Napley, 28 May 2026](https://www.kingsleynapley.co.uk/our-insights/articles/deepfakes-to-deletion-orders-tackling-technology-enabled-sexual-offending-in-the-crime-and-policing-act-2026/) (search summaries).

**Platforms**
- **Discord:** the Community Guidelines (effective 29 Sep 2025) prohibit deceptive impersonation of a person, group or organization; this is a third-party summary of rule 18. Pseudonyms are allowed. AI-generated non-consensual intimate media and AI sexualisation of minors are banned. Discord may act on off-platform behaviour and report to law enforcement. It went "teen-by-default" globally from March 2026. Sources: [Discord Community Guidelines](https://discord.com/guidelines); [Discord Identity & Authenticity explainer](https://discord.com/safety/identity-authenticity-policy-explainer) (search summary). No Discord rule specific to live deepfakes was found.
- **Meta:** reportedly requires AI-content labels on Facebook and Instagram from May 2026, and stops removing deepfakes as a standalone violation from July 2026; removal is kept only when another standard is broken. These details are secondhand via trade press. The Oversight Board (March and June 2026) called Meta's deepfake protections "inadequate", especially for non-public figures — [techjacksolutions](https://techjacksolutions.com/ai-brief/meta-shifts-to-labeling-deepfakes-not-removing-them-what-cha/); [MediaPost](https://www.mediapost.com/publications/article/418115/meta-deepfake-protections-are-inadequate-oversi.html) (search summaries).
- **Telegram:** deepfake pornography violates its terms, but enforcement is reactive. It says it removed 952,000 pieces of offending content in 2025, which researchers call insufficient — [creati.ai, 30 Jan 2026](https://creati.ai/ai-news/2026-01-30/millions-create-deepfake-nudes-on-telegram-fueling-digital-abuse-crisis) (search summary).

**Fraud use**
- Trend Micro (9 Jul 2025):
  - In November 2024, a criminal-forum actor shared a playbook for live deepfakes using Deep-Live-Cam plus OBS over a webcam.
  - KYC bypass "appears to be the biggest use of deepfake creation". A December 2024 tutorial covered crypto exchanges, dating and finance apps and casinos, using VcamPro virtual cameras and "a Windows-only deepfake tool requiring an RTX 2070 or better".
  - Attempted deepfake video scam scenarios rose from 4% (Feb 2025) to 24% (Mar 2025) in Trend's data.
  - Hong Kong police arrested 27 people in a deepfake face-swap romance scam ring (Oct 2024).
  - A Hong Kong firm lost $25M on an all-deepfake executive video call (Feb 2024).
  - Source: [Trend Micro](https://www.trendaisecurity.com/en-gb/resources-insights/research/deepfake-it-til-you-make-it-a-comprehensive-view-of-the-new-ai-criminal-toolset).
- Underground "KYC bypass-as-a-service" against Onfido, Jumio, Sumsub and Veriff priced at about $30–600 (one secondary source says $30–200) — [Trend Micro AI vs AI: DeepFakes and eKYC](https://www.trendmicro.com/vinfo/us/security/news/cyber-attacks/ai-vs-ai-deepfakes-and-ekyc) (search summary).
- Amazon Threat Intelligence reported actors using AI agents ("ARTEX") to bypass crypto-exchange KYC via real-time deepfake injection — [AWS Security Blog](https://aws.amazon.com/blogs/security/amazon-threat-intelligence-observes-threat-actors-running-cybercrime-campaigns-with-artex-ai-agents/) (search summary; not opened).
- An iProov red-team exercise, documented in MITRE ATLAS, used Faceswap through a virtual camera against KYC — [SecurityBrief Asia](https://securitybrief.asia/story/mitre-flags-deepfake-kyc-threat-using-face-swap-tools) (search summary).

**Detection**
- Fraunhofer SIT / ATHENE prototype (research news, 3 Aug 2026):
  - It combines audio and video to show a deepfake probability during videoconferences.
  - It was trained with compression, blur and quality augmentation, and on about 19,000 real and 160,000 spoofed audio recordings.
  - No accuracy figures are given. It is proof-of-concept only, with integration partners sought and no dates.
  - It notes that video compression removes the artifacts older detectors relied on.
  - Source: [Fraunhofer press release](https://www.fraunhofer.de/en/press/research-news/2026/august-2026/a-real-time-warning-system-for-fake-videoconferences.html).
- Research on active checks:
  - Farid group CVPR 2022: active illumination patterns projected on the caller's face — [paper](https://hfarid.org/downloads/publications/cvpr22a.pdf).
  - Active probing with corneal reflection — [arXiv 2210.14153](https://arxiv.org/pdf/2210.14153).
  - Gaze-tracking detection in two-person (dyadic) calls — [arXiv 2509.25503](https://arxiv.org/pdf/2509.25503).
- Trend Micro sells live-call deepfake alerts (Vision One AI Security; consumer Deepfake Inspector) but calls such tools "not foolproof" — [Trend Micro](https://www.trendaisecurity.com/en-gb/resources-insights/research/deepfake-it-til-you-make-it-a-comprehensive-view-of-the-new-ai-criminal-toolset).
- Common human checks are head turns to profile and a hand wave across the face. Evidence for them is weak: "no published study yet measures a trained interviewer against a real-time deepfake in a live hiring conversation" — [BrightHire](https://brighthire.com/blog/detect-deepfake-candidates-video-interviews/); [netarx](https://www.netarx.com/blog/how-to-spot-deepfake-video-call) (search summaries; vendor blogs).

### Inferences
- **For the ranking:** private, consensual entertainment use (e.g. with friends who know) is the defensible case. Using any tool to deceive a call partner about identity breaches Discord's impersonation rule and can be fraud. Any sexual use without consent is criminal in the UK and is subject to takedown duties in the US.
- **EU AI Act Art. 50(4):** it obliges "deployers" to disclose deepfakes. Art. 2(10) exempts natural persons in purely personal, non-professional activity. This is from background knowledge of the Act text and was not re-verified this session, so check it. Streamers and creators publishing swapped content in the EU should label it.
- **Detection risk:** tool choice (paid vs free) matters less than settings and behaviour. Profile turns and hand occlusion still break all one-shot live swaps. Platform-level detection (Fraunhofer-style) is not yet deployed in mainstream call apps as far as these sources show.

### Gaps
- No primary-text check of Google (Meet/YouTube) or WhatsApp policies on live deepfakes or impersonation.
- No state-by-state US deepfake law summary was gathered; one source only notes that CA, NY and TX have stricter rules.
- Accuracy numbers for real-time call deepfake detectors were not found. A claim that detectors fall below 50% accuracy in the wild (Deepfake-Eval-2024) was seen only second-hand.
- No enforcement action under the TAKE IT DOWN Act since 19 May 2026 was confirmed.
- Meta's 2026 deepfake policy change was not confirmed from Meta's own policy pages.
