# Free Real-Time Voice Changers for Live Calls (Discord, Telegram Desktop, WhatsApp Desktop, Google Meet). State as of November 2026

Research date: 2026-11-09. Note: direct GitHub API access was blocked in this session, so repository facts come from fetched GitHub web pages (no release dates visible for some). Most "best voice changer" listicles found come from competing vendors (VoxBooster, Dubbing AI, EaseUS, Voicemod blogs). They are marked as vendor/affiliate sources and should be treated as low reliability.

## Q1. Which free tools give the most natural, lowest-latency AI voice conversion, and how do they compare?

### Takeaway
The most realistic free option is still local open-source RVC (w-okada VCClient, its deiteris fork, Applio realtime, RVC WebUI). These tools are fully free, with no limits, watermarks or ads. Expect about 120 to 300+ ms of total delay on a decent GPU and more on CPU. Seed-VC gives zero-shot cloning but needs a GPU, adds about 400 ms, and was archived in Nov 2025. Beatrice v2 is the lightweight CPU-only option. Commercial "free tiers" are either effects/DSP (Clownfish, MorphVOX Jr), rotating or limited AI voices (Voicemod), or credit-limited (Voice.ai).

### Cited Findings
**w-okada voice-changer / VCClient (open source)**
- GitHub repo: 21.3k stars, 2.5k forks, 1,755 commits, 433 open issues. Newest listed version is v2.2.2-beta (no date shown on page). Supported models: RVC v1/v2, Beatrice v1 (Windows only), Beatrice v2 (v2.0.0-rc0 supported in v2.2.2-beta), and MMVC, so-vits-svc and DDSP-SVC (v1 only). — [GitHub w-okada/voice-changer](https://github.com/w-okada/voice-changer)
- Since v2.2.1, each edition supports different models. "std" edition is Beatrice only and runs on Windows, Mac (M1), Linux x86-64 and aarch64. "cuda" edition is RVC + Beatrice, Windows only. "onnx" edition is RVC + Beatrice, Windows and Mac (M1). It can run standalone or offload conversion to another PC over the network, and offers a REST API. The macOS app is unsigned, so Gatekeeper warns and the user must Ctrl-click to open. — [GitHub w-okada/voice-changer](https://github.com/w-okada/voice-changer)
- Binaries are distributed via the Hugging Face repo `wok000/vcclient000`, last updated Aug 24, 2025, e.g. `MMVCServerSIO_win_onnxgpu-cuda_v*`. ("MMVCServerSIO" is the server binary name of this same app, not a separate product.) — [HF guide by Lenylvt, Feb 2024](https://huggingface.co/blog/Lenylvt/w-okada); [HF wok000/vcclient000](https://huggingface.co/wok000/vcclient000)
- Recommended settings from the community guide (Feb 2024):
  - NVIDIA GPU: RMVPE or CREPE_TINY, chunk 112, extra 4096–16384.
  - AMD/Intel GPU: RMVPE_ONNX or CREPE_TINY, chunk 112. These GPUs need models converted to ONNX.
  - CPU: Dio or Harvest, chunk 448, extra 4096–8192.
  - Mac M2 Max and below: chunk 448, extra 131072. Mac M2 Max and above: chunk 256.
  - A July 2025 comment says the guide is outdated and recommends the deiteris fork plus "VAC Lite" instead of VB-Cable. — [HF guide](https://huggingface.co/blog/Lenylvt/w-okada)
- Dupple (Oct 2026) lists VCClient as MIT-licensed, real-time, Windows/Mac (M1)/Linux, supporting RVC and Beatrice. RVC WebUI is listed as MIT with a real-time interface on Windows/Ubuntu. — [Dupple, Oct 12 2026](https://dupple.com/learn/best-free-ai-voice-changers)

**deiteris/voice-changer (performance fork of w-okada, RVC only)**
- RVC-only fork focused on performance across backends:
  - Windows: DirectML ("dml") for AMD, Intel and CPU; CUDA for NVIDIA.
  - Linux: CUDA, ROCm and CPU.
  - macOS: Apple Silicon and Intel CPU builds, marked "experimental".
  - Colab/Kaggle notebooks are also provided.
  - 191 stars. The fork does not accept code contributions. — [GitHub deiteris/voice-changer](https://github.com/deiteris/voice-changer)
- Hardware floor: 6 GB RAM and 6 GB disk.
  - CPU-only minimum: i5-4690K / FX-6300. Recommended: i5-10400F / Ryzen 5 1600X.
  - VRAM: about 2 GB in FP32, about 1 GB in FP16.
  - Minimum GPU: Radeon Vega 7 iGPU, GTX 900, RX 400 or Arc A300. GTX 700 works only via DirectML.
  - Recommended GPU: RTX 20, RX 6000 or Arc A500.
  - "Intel integrated GPUs perform poorly". RX 7000 on DirectML "may be unable to achieve low latency (below 256ms)". Keep "perf" time below chunk time to avoid stutter. — [GitHub deiteris/voice-changer](https://github.com/deiteris/voice-changer)

**Applio (RVC fork with Realtime tab)**
- The Realtime tab captures the mic, runs RVC, and outputs to a chosen device such as CABLE Input. Suggested settings are a chunk of about 100–150 ms on a fast GPU and the FCPE F0 method, described as the fastest extractor. Source is a third-party docs mirror. — [mintlify mirror of Applio docs](https://mintlify.wiki/IAHispano/Applio/features/realtime)

**Seed-VC (zero-shot, no training needed)**
- Real-time GUI added 2024-10-27. Tiny model optimized for real-time 2024-11-26. Apple Silicon support 2025-03-03. Repo archived (read-only) Nov 21, 2025. License GPL-3.0. — [GitHub Plachtaa/seed-vc](https://github.com/Plachtaa/seed-vc)
- Claims about 300 ms algorithm delay plus about 100 ms device delay. Tested config (seed-uvit-xlsr-tiny on an RTX 3060 Laptop) gives 430 ms total latency and about 150 ms inference per 0.18 s block. Settings: 10 diffusion steps, CFG 0.7, block 0.18 s. Clones from 1–30 s of reference audio. A GPU is "strongly recommended". The README suggests VB-CABLE for routing. — [GitHub Plachtaa/seed-vc](https://github.com/Plachtaa/seed-vc)

**Beatrice v2 (low-CPU)**
- A Japanese article (Jul 2024) says Beatrice runs on CPU alone, single-thread, about 35 MB. 2.0.0-beta.0 was released Jul 20, 2024, and the author felt no noticeable delay. — [Impress Window Forest](https://forest.watch.impress.co.jp/docs/serial/yajiuma/1611613.html)
- An unofficial HF model card claims <50 ms latency (unverified). — [HF SatiricalGuru/beatrice-voice-models](https://huggingface.co/SatiricalGuru/beatrice-voice-models)
- Beatrice v2 runs in the VCClient "std" edition on Windows, Mac (M1) and Linux. — [GitHub w-okada](https://github.com/w-okada/voice-changer)

**2025–2026 research-grade open models (not consumer apps)**
- MeanVC2 (2026, Apache 2.0, ASLP-lab): streaming zero-shot, 18M params. Reports 110 ms end-to-end first-packet latency at 40 ms chunks and RTF < 0.633 on a single CPU core. Its predecessor MeanVC (2025) includes a mic real-time script. — [HF ASLP-lab/MeanVC2](https://huggingface.co/ASLP-lab/MeanVC2)
- RT-VC (ACL 2025 demo, UC Berkeley): 61.4 ms end-to-end CPU latency; code availability unconfirmed. — [arXiv 2506.10289](https://arxiv.org/html/2506.10289v1)
- LLVC (Koe AI, 2023): under 20 ms latency at 16 kHz and about 2.8x faster than real time on a consumer CPU. It is any-to-one, not zero-shot. — [arXiv 2311.00873](https://arxiv.org/abs/2311.00873v1); [demo](https://koeai.github.io/llvc-demo)
- GenVC (MIT): language-model-based zero-shot voice conversion with streaming support; no CPU numbers found. — [HF ZexinCai/GenVC](https://huggingface.co/ZexinCai/GenVC)

**Latency benchmarks (vendor-sourced, low reliability)**
- Local GPU AI voice changers run about 120–200 ms; CPU about 280–380 ms. — [VoxBooster (competing vendor)](https://voxbooster.com/blog/real-time-voice-changer)
- Dubbing AI claims "sub-30 ms" latency; this is self-promotional and unverified. — [Dubbing AI blog](https://dubbingai.io/articles/en/compare/dubbing-ai-vs-w-okada)

**Commercial apps' free tiers**
- **Voicemod:** free download for PC and Mac, 200+ voices, "no usage cap stated" on the free version. — [Dupple, Oct 2026](https://dupple.com/learn/best-free-ai-voice-changers). The free plan has a "very limited daily voice rotation" and VoiceLab (custom voice creator) is Pro-only. — [aitoolsatlas](https://aitoolsatlas.ai/tools/voicemod/review); [TemperStack](https://www.temperstack.com/plans/voicemod/)
  - Pro price conflicts across sources: $10/mo (TemperStack, verified Mar 16 2026) vs about $30–60/yr (aitoolsatlas). Voicemod's own pricing page fetched showed no price. — [Voicemod pricing page](https://www.voicemod.net/pricing/)
- **Voice.ai:** free plan of 5,000 credits/month, with a 500-character cap per conversion and 5 min per conversion for audio tools. — [Dupple](https://dupple.com/learn/best-free-ai-voice-changers). Once starting credits run out, real-time AI voices need credit packs; DSP stock effects stay free. — [VoxBooster (competitor)](https://voxbooster.com/blog/is-voice-ai-free)
- **MorphVOX Junior:** free, with 3 voice types (man, woman, "little folk") plus sound effects and no watermark or time limit shown. It is effects-based, not AI. — [Dupple](https://dupple.com/learn/best-free-ai-voice-changers); [Screaming Bee](https://screamingbee.com/Product/Info/4865). Reviews say it is Windows-only and has not had meaningful updates in years. — [VoxBooster (competitor)](https://voxbooster.com/blog/voice-changer-free)
- **Clownfish:** described as fully free, no limits, system-wide, with no AI capabilities. Sources are secondary only. — [VoxBooster](https://voxbooster.com/blog/free-voice-changers); [Dubbing AI list](https://dubbingai.io/articles/en/list/best-free-realtime-voice-changers)
- **NVIDIA Broadcast:** free, but its voice features are cleanup (noise and echo removal, Studio Voice EQ), not voice transformation. Requires an RTX 2060 or better. Studio Voice requirement reportedly lowered to RTX 3060 in Broadcast 2.2 (June 2026, not confirmed in NVIDIA release notes); the older FAQ said RTX 4080/5080. — [NVIDIA FAQ](https://www.nvidia.com/en-gb/geforce/broadcasting/broadcast-app/faq); [Tom's Hardware](https://www.tomshardware.com/pc-components/gpus/nvidia-broadcast-upgrade-brings-studio-grade-mic-and-lighting-features)
- **ElevenLabs Voice Changer:** not real-time; it converts recorded or uploaded clips. 10,000 credits/month free, non-commercial. — [Dupple](https://dupple.com/learn/best-free-ai-voice-changers)

### Inferences
- **Best quality/price for live calls:**
  - NVIDIA GPU: w-okada VCClient (cuda edition) or Applio realtime with a good RVC v2 model. Fully free, best realism of the free options.
  - AMD/Intel GPU on Windows: the deiteris fork (DirectML).
  - CPU-only laptops: Beatrice v2 via the VCClient std edition, or RVC at large chunks (about 448), which adds noticeable lag.
  - Mac (Apple Silicon): VCClient onnx/std edition, or Seed-VC on MPS (archived project).
- The gap between "AI voice changers" (RVC-style conversion keeping your intonation) and DSP pitch/formant shifters (Clownfish, MorphVOX Jr, Voicemod's basic voices) is large. DSP output sounds obviously processed.
- Seed-VC's ~430 ms delay is borderline for conversation: noticeable but usable on calls, poor for fast back-and-forth.

### Gaps
- No independent, measured end-to-end latency benchmarks of RVC/Beatrice on specific low-end hardware (e.g. Ryzen iGPU, i5 laptop CPU, M1 base) were found. Figures above are settings guidance or vendor claims.
- Release date of VCClient v2.2.2-beta and whether development continued in 2026 could not be confirmed (GitHub API blocked).
- Dubbing AI, HitPaw VoicePea, AV Voice Changer and Fish Audio free-tier specifics were not found from primary or neutral sources. Fish Audio real-time capability is unknown.
- Applio's official docs and release status were not verified directly.

## Q2. How is audio routed into Discord, Telegram Desktop, WhatsApp Desktop and Google Meet?

### Takeaway
Every call app just needs a microphone device. Commercial apps (Voicemod, Voice.ai) install their own virtual mic. Open-source tools output to a virtual cable such as VB-CABLE or VoiceMeeter, and you pick "CABLE Output" as the mic in the call app. Turning off the call app's own noise suppression and refreshing the browser for Meet are the main gotchas.

### Cited Findings
- **w-okada routing:**
  - Use "server audio" mode, which is faster than client audio.
  - Set input to the real mic and output to `[MME] CABLE Input (VB-Audio Virtual Cable)`.
  - Use the monitor output to hear yourself.
  - In Discord or other apps, select `CABLE Output` as the input. — [HF guide](https://huggingface.co/blog/Lenylvt/w-okada)
- Applio realtime uses the same CABLE Input → CABLE Output routing. — [mintlify mirror](https://mintlify.wiki/IAHispano/Applio/features/realtime)
- VB-CABLE itself adds under about 14 ms at 48 kHz, depending on buffer settings. — [VB-Audio forum](https://forum.vb-audio.com/viewtopic.php?p=1612)
- A July 2025 user comment says VB-Cable can cause issues on Windows and recommends "VAC Lite" (Virtual Audio Cable Lite) with the deiteris fork. — [HF guide comments](https://huggingface.co/blog/Lenylvt/w-okada)
- **Google Meet:**
  - Select the virtual mic in Meet's audio settings.
  - Meet caches audio devices, so refresh the page after creating the virtual mic.
  - Meet applies its own noise cancellation on top of the processed audio.
  - High-intensity effects often garble speech.
  - Sources are vendor blogs. — [VoxBooster Meet guide](https://voxbooster.com/blog/voice-changer-google-meet-guide); [allthings.how](https://allthings.how/?p=11286)
- Voicemod works across PC and Mac with a virtual mic. Voice.ai routes via a virtual mic for Discord and games. — [Dubbing AI list (vendor)](https://dubbingai.io/articles/en/list/best-free-realtime-voice-changers)

### Inferences
- **Telegram Desktop and WhatsApp Desktop:** both have a microphone selector in call/voice settings, so selecting "CABLE Output" or the app's virtual mic should work the same as in Discord. No source specifically documents WhatsApp Desktop.
- **Discord:** disabling Krisp/noise suppression and echo cancellation (and Meet's noise cancellation) is likely to reduce artifacts on AI-converted voice. This follows from the stacking issue above.
- **Mac:** needs a virtual audio driver; BlackHole is commonly used, though this is not covered by the sources above. VB-CABLE is also offered for macOS per the Applio docs mirror.

### Gaps
- No source on WhatsApp Desktop or Telegram Desktop virtual-mic quirks (e.g. whether WhatsApp's Microsoft Store/UWP build respects the default device).
- No measured latency for Voicemod/Voice.ai virtual mics found.

## Q3. Where to get voice models legally and safely?

### Takeaway
Weights.gg, the largest RVC model hub, shut down around March 31 / April 1, 2026. Hugging Face and Discord communities are now the main sources. Many shared models clone real celebrities without consent, which carries legal and ethical risk. Prefer .pth/.onnx weights (Beatrice ships its own format) over executables.

### Cited Findings
- Weights.gg has shut down, with servers offline on March 31, 2026 or April 1, 2026 (sources differ). The cause is disputed: profitability vs. an acquisition rumor. — [aidirectory](https://aidirectory.com/news/weights-gg-shuts-down-coreweave-weights-and-biases-acquisition-clarification); [peerlist post](https://peerlist.io/alexandra_hayes/articles/my-new-goto-for-ai-cover-no-signup-just-results)
- An "OpenAI acquired weights.gg" claim appears only on a low-quality aggregator and is unreliable. — [oreateai](https://discover.oreateai.com/discover/openai-acquired-weightsgg-and-ended-the-wild-west-of-ai-voice-cloning)
- Model creators re-host RVC models on Hugging Face (e.g. FurnTheFurnace/rvc-v2-models, lowo/RVC_weights), and community trading moved to Discord. — [HF FurnTheFurnace](https://huggingface.co/FurnTheFurnace/rvc-v2-models); [aidirectory](https://aidirectory.com/news/weights-gg-shuts-down-coreweave-weights-and-biases-acquisition-clarification)
- VCClient bundles licensed voices (Tsukuyomi-chan, Amitaro, Kikoto Mahiro), each with its own usage restrictions. — [GitHub w-okada](https://github.com/w-okada/voice-changer)
- MeanVC2's repo asks users to obtain consent from the people whose voices are converted. — [HF MeanVC2](https://huggingface.co/ASLP-lab/MeanVC2)

### Inferences
- The legally cleanest path is bundled or explicitly licensed voices (VCClient sample voices, Beatrice/MeanVC demo voices), self-trained models of your own voice or consenting speakers, or zero-shot cloning from consenting reference audio (Seed-VC, MeanVC2).
- Safety:
  - Older RVC `.pth` files are PyTorch pickles that can embed code, so ONNX or safetensors is safer.
  - Download apps only from the official GitHub repos and the `wok000` Hugging Face repo. Third-party "W-Okada download" sites (e.g. EaseUS, CapCut pages in search results) are SEO/marketing pages.

### Gaps
- No primary-source confirmation of the weights.gg shutdown cause.
- No documented malware incidents in RVC model files were found this session.

## Q4. Malware, adware and privacy concerns; user sentiment

### Takeaway
Voice.ai had a documented 2023 GPL-violation controversy, plus DRM concerns and billing complaints; no cryptominer evidence was found. Open-source tools have no ads or telemetry concerns reported, but their Mac builds are unsigned. Fake "AI app" downloads are a real malware vector, so use official sources only. User sentiment: Voicemod is the most-discussed on Reddit, Voice.ai is seen as the strongest free AI option but credit-limited, and w-okada/RVC is the choice for tinkerers.

### Cited Findings
- **Voice.ai GPL controversy (Feb 2023):**
  - Developer Ronsor found GPL code used without compliance, and raised DRM concerns.
  - Voice.ai called the misappropriation claims false but said it had removed the GPL code in an update. — [The Register, Feb 8 2023](https://www.theregister.com/2023/02/08/voiceai_open_source); [Ronsor write-up](https://engineered.at/articles/voice-ai-gpl-violations-with-a-side-of-drm); [Neowin](https://www.neowin.net/news/jailbreak-hacker-uncovers-stolen-open-source-code-in-voiceai/)
- **Voice.ai resource sharing:** an opt-in program, similar to Folding@Home, that uses users' GPUs to train voice models. Some reviews call the software a scam and cite billing complaints. No cryptomining link was found. — [NordVPN blog](https://nordvpn.com/blog/is-voice-ai-safe/); [Trustpilot](https://uk.trustpilot.com/review/voice.ai?page=4)
- **Gipy malware:** a Kaspersky-reported campaign that steals passwords under the guise of an AI application. It shows fake AI-tool installers are an active threat. — [Kaspersky](https://www.kaspersky.co.uk/about/press-releases/gipy-malware-steals-passwords-under-the-guise-of-ai-application)
- **Unsigned Mac build:** the VCClient macOS app is unsigned and requires Ctrl-click to bypass Gatekeeper. — [GitHub w-okada](https://github.com/w-okada/voice-changer)
- **Sentiment:**
  - Voicemod is the most-discussed on Reddit by volume; its AI voices are seen as weaker than Dubbing AI per a vendor blog.
  - Voice.ai is called the strongest free AI option for Discord.
  - W-Okada is "for tinkerers".
  - These are vendor-written summaries of Reddit. — [VoxBooster Reddit summary](https://voxbooster.com/blog/best-voice-changer-reddit); [Dubbing AI list](https://dubbingai.io/articles/en/list/best-free-realtime-voice-changers)
- **Seed-VC:** archived Nov 2025, so there will be no fixes. — [GitHub](https://github.com/Plachtaa/seed-vc)

### Inferences
- Voicemod has had its own past controversies (e.g. bundled-installer and anti-cheat/driver complaints are widely recalled). I did not re-verify these this session, so treat them as unconfirmed.
- Commercial AI voice changers that process in the cloud or require accounts carry more privacy exposure than local open-source tools that run fully offline.

### Gaps
- No actual Reddit threads or GitHub issue threads were fetched (only vendor summaries). Genuine first-hand sentiment and common failure reports (e.g. DirectML crashes, robotic artifacts) remain uncaptured.
- Voicemod privacy/adware history was not verified with primary sources this session.
- No info found on Dubbing AI's privacy policy or ownership.
