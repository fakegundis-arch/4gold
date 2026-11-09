# Compatibility, Routing and Hardware for Free Real-Time Face + Voice Changers in Calls (researched 2026-11-09)

Note on dates: most compatibility evidence is user forum reports from 2021 to 2025. I found no official 2026 statement from Discord, Telegram or WhatsApp about virtual devices. Treat app behavior as version-dependent, and test before any real call.

## Q1. Do Discord, Telegram Desktop, WhatsApp Desktop and Google Meet accept virtual cameras and virtual audio devices? Known issues?

### Takeaway
Browser Meet and Discord usually accept OBS Virtual Camera and VB-Cable/VoiceMeeter/BlackHole inputs, but some users hit failures. Telegram Desktop is inconsistent, especially on macOS. WhatsApp Desktop is the problem case: its own FAQ has been quoted as saying virtual audio and video devices are not supported, and OBS Virtual Camera often does not show up. The common Windows workaround is the DroidCam Virtual Output plugin, which uses Media Foundation drivers.

### Cited Findings
**General pipeline**
- Deep-Live-Cam does not create a virtual webcam itself. Its README tells users to use "a screen capture tool like OBS to stream". The chain is Deep-Live-Cam preview window, then OBS (Window Capture), then OBS Virtual Camera, then the call app. — [Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam); [DEV Community guide](https://dev.to/localfaceswap/deep-live-cam-free-real-time-ai-face-swap-software-1i41)
- OBS publishes an official Virtual Camera guide and a video-call streaming tutorial. — [OBS KB: Virtual Camera Guide](https://obsproject.com/kb/virtual-camera-guide); [OBS KB: Video Call Streaming Tutorial](https://obsproject.com/kb/video-call-streaming-tutorial)
- General Windows troubleshooting: turn on "Let desktop apps access your camera" in Windows privacy settings, and start OBS Virtual Camera before you launch the chat app or browser. NDI is an alternative route when the virtual camera fails. (third-party guide) — [VDO.Ninja docs: OBS Virtual Camera not working](https://docs.vdo.ninja/common-errors-and-known-issues/obs-virtual-camera-not-working)
- If OBS Virtual Camera is missing on Windows, a forum user suggests running `virtualcam-install.bat` as administrator from `data\obs-plugins\win-dshow` in the OBS folder to re-register it. It did not fix the problem in that thread. — [OBS forum](https://obsproject.com/forum/threads/the-obs-virtual-camera-does-not-appear-on-desktop-whatsapp.165969)

**Discord**
- Typical setup: User Settings → Voice & Video → Camera → "OBS Virtual Camera". — [Discord community post](https://support.discord.com/hc/da/community/posts/360052375433-OBS-Virtual-Cam-to-Discord)
- Known issues: some users get an endless camera loading icon after selecting OBS Virtual Camera, or the camera stops. — [Discord community post](https://support.discord.com/hc/da/community/posts/360052375433-OBS-Virtual-Cam-to-Discord); [OBS forum: virtual camera not working with Discord](https://obsproject.com/forum/threads/obs-virtual-camera-not-working-with-discord.191384/)
- July 20, 2025 (Windows Support forum): the Discord desktop app did not recognize OBS Virtual Camera, but Discord in a web browser worked. The thread had no replies or fix. — [OBS forum thread 187674](https://obsproject.com/forum/threads/discord-desktop-app-completely-refusing-to-pick-up-obs-virtual-cam.187674)
- I found no evidence that Discord deliberately blocks virtual cameras. The reports describe bugs or detection failures, not a policy.

**Telegram Desktop**
- An older report says Telegram detected OBS Virtual Camera directly, without DroidCam. — [OBS forum: Telegram desktop](https://obsproject.com/forum/threads/obs-not-working-on-telegram-dekstop.166901/)
- A more recent macOS report (Apple M1, OBS 30.2.3, Telegram Desktop 11.3): OBS stopped appearing under Input Device. Another user said the problem had lasted months. No confirmed fix. — [OBS forum Telegram tag](https://obsproject.com/forum/tags/telegramdesktop/); [OBS forum thread](https://obsproject.com/forum/threads/obs-not-working-on-telegram-dekstop.166901/post-622741)

**WhatsApp Desktop (Windows app and Mac app)**
- A forum post quotes WhatsApp's desktop-calling troubleshooting FAQ as saying group calls were not supported on desktop at the time, and that "virtual audio and video devices aren't supported". I could not load the live FAQ page, so the wording is unverified and may be out of date. Desktop group calls have been added since. — [OBS forum thread 144629](https://obsproject.com/forum/threads/obs-virtual-cam-is-not-working-with-whatsapp-desktop-app.144629/post-529441)
- Windows: OBS Virtual Camera does not appear in the new WhatsApp Desktop app. Users explain that DroidCam's drivers are Media Foundation, while OBS uses DirectShow, which is why native apps like WhatsApp detect DroidCam and not OBS. This is a user explanation, not an official one. — [OBS forum thread 165969](https://obsproject.com/forum/threads/the-obs-virtual-camera-does-not-appear-on-desktop-whatsapp.165969); [OBS forum thread 175574](https://obsproject.com/forum/threads/obs-droidcam-virtual-output-and-whatsapp-desktop-on-windows-10.175574)
- Working Windows workaround (Dec 18, 2024): the DroidCam Virtual Output OBS plugin worked with WhatsApp on Windows 11. Install its drivers, which are separate from the DroidCam app's, then restart. One user said the output was 16:9 rather than 9:16. — [OBS forum thread 140414, latest page](https://obsproject.com/forum/threads/new-whatsapp-desktop-application-does-not-work-with-obs-virtual-camera.140414/post-671686)
- Hardware workaround (Jan to Feb 2025): send OBS output over HDMI (with an EDID passthrough or dummy display) into a USB capture card, which WhatsApp sees as a normal camera. A reply warns that cheap capture cards have inconsistent latency. — [OBS forum thread 140414](https://obsproject.com/forum/threads/new-whatsapp-desktop-application-does-not-work-with-obs-virtual-camera.140414/post-671686)
- macOS: the widely shared fix is to remove WhatsApp's code signature, the same as for Zoom, Skype and Teams. Users report it does not work with the App Store version. Removing a signature is a security tradeoff, and app updates undo it. — [OBS forum thread search summary](https://obsproject.com/forum/threads/new-whatsapp-desktop-application-does-not-work-with-obs-virtual-camera.140414/post-604608)
- Virtual microphone in WhatsApp: a voice-changer vendor (VoxBooster) says WhatsApp Desktop accepts any virtual microphone, but its steps are for Windows. I found no independent test with BlackHole on the Mac app. — [VoxBooster blog (vendor)](https://voxbooster.com/blog/voice-changer-whatsapp-video-desktop)
- Mac NDI-to-WhatsApp attempt: unanswered thread. — [OBS forum thread 177649](https://obsproject.com/forum/threads/how-to-use-ndi-obs-on-whatsapp-of-mac.177649/)

**Google Meet (Chrome / Edge / Firefox)**
- Choose the camera in Meet under ⋮ → Settings → Video. — [Ceedo guide](https://www.ceedo.com/how-to-use-obs-virtual-camera/)
- Mixed reports: OBS Camera missing in Meet on Chrome but working in Edge. Missing in Firefox for some users, fixed for others after restarting. Reloading the page sometimes helps. The camera can also look zoomed in on Chrome/Edge but not on Firefox. — [OBS forum: Meet via Chrome](https://obsproject.com/forum/threads/obs-wont-work-with-google-meet-via-chrome.123878); [OBS forum: Firefox](https://obsproject.com/forum/threads/obs-camera-not-showing-up-when-using-firefox.140011/); [OBS forum: zoomed in Chrome/Edge](https://obsproject.com/forum/threads/virtual-camera-zoomed-in-on-chrome-edge-but-not-on-firefox.174249/); [OBS forum: not showing in Meet & Zoom](https://obsproject.com/forum/threads/virtual-camera-not-showing-as-available-to-choose-in-meet-zoom.174012/)
- The VDO.Ninja guide (third party) calls Firefox the most compatible browser for virtual cameras and says Edge works better than Chrome for Meet. This conflicts with some of the forum reports above. — [VDO.Ninja docs](https://docs.vdo.ninja/common-errors-and-known-issues/obs-virtual-camera-not-working)
- Error "camera being used by some other process" in Edge web apps when the virtual camera is shared. — [OBS forum thread 168544](https://obsproject.com/forum/threads/trying-to-access-obs-v-c-in-browser-msg-rcvd-c-m-being-used-by-some-other-process-that-does-not-not-allow-devices-to-be-read.168544)
- Meet noise cancellation removes "non-speech noises" (typing, echo, construction). It can run on the device or in the cloud. It is ON by default for Workspace Business, Enterprise, Frontline and Individual plans and Google One 2TB+ subscribers. It is OFF by default for Education editions. Turn it off at ⋮ → Settings → Audio → Noise cancellation, before or during a meeting. Google itself recommends turning it off for electrolarynx users, which shows it can alter synthetic or unusual voices. — [Google Meet Help 9919960](https://support.google.com/meet/answer/9919960)

**Virtual audio devices**
- The w-okada voice changer README links a community GPU and chunk-size chart. Typical guides route its output to VB-Cable or VoiceMeeter, then pick "CABLE Output" or the VoiceMeeter output as the microphone in the call app. — [w-okada README](https://www.github.com/w-okada/voice-changer/blob/master/README_en.md); [Voicemeeter & RVC tutorial](https://frozenyears.github.io/2025/07/18/Voicemeeter-RVC-Voice-Changer-Tutorial)
- macOS BlackHole: one user found BlackHole desktop audio in OBS worked only once until OBS was reinstalled. — [OBS forum thread 157662](https://obsproject.com/forum/threads/macos-with-blackhole-desktop-audio-only-works-1-time-then-i-need-to-reinstall-obs.157662)
- FaceTime recognized OBS Virtual Camera (OBS v31), but VB-Cable audio did not reach the other side in that report. — [OBS forum thread 182824](https://obsproject.com/forum/threads/obs-vb-cable-and-facetime.182824/post-702423)

### Inferences
- Most to least reliable for a face swap plus voice changer: Discord (web or desktop) and Meet in a browser (try Edge or Firefox if Chrome fails), then Telegram Desktop on Windows, then WhatsApp Desktop. WhatsApp on Windows needs the DroidCam Virtual Output plugin. WhatsApp on Mac needs the unsign hack, and only the non-App-Store version.
- Virtual microphones are generally less of a problem than virtual cameras. Most failures reported are camera enumeration (DirectShow vs Media Foundation, macOS code signing).
- If the Discord desktop app won't see the camera, using Discord in a browser is a reported workaround.

### Gaps
- I could not access the current WhatsApp desktop-calling FAQ (the page returned "not found"), so I could not confirm the current "virtual devices not supported" wording.
- No official Telegram or Discord statement on virtual-camera support. Nothing found on whether the Unity Capture virtual camera works in WhatsApp or Telegram.
- No verified 2026 reports. Behavior may have changed in newer app versions.

## Q2. Can these be used on mobile calls (Android/iOS)?

### Takeaway
No reliable free method injects a PC face swap or AI voice into a native mobile call. The practical route is to make the call from the desktop or web version of the same account (WhatsApp Desktop, Telegram Desktop, Discord, Meet in a browser), so the person on the phone receives the altered stream.

### Cited Findings
- The face-swap and voice tools researched here run on desktop. Deep-Live-Cam supports CUDA, CoreML (Apple Silicon M1 to M5), DirectML, OpenVINO and CPU, all on desktop operating systems. — [Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam)
- Meet's device-based noise cancellation runs on most Android phones (Pixel 4+, Samsung S10+). A phone-side participant's settings do not affect what the PC sends, but the PC sender must turn off cancellation on their own side. — [Google Meet Help 9919960](https://support.google.com/meet/answer/9919960)

### Inferences
- Calling from the PC app works because the receiving party can be on mobile. The receiver's device does not need a virtual camera.
- Phone-call bridging (for example, routing a cellular call through a PC's Bluetooth/Phone Link) is not a documented path for virtual microphone injection. I would not recommend it without testing.

### Gaps
- I did not research or verify Microsoft Phone Link or Android/iOS virtual-camera apps (search budget). There are no sources on rooted-Android or jailbreak camera-injection methods, and these likely violate app terms anyway.

## Q3. Hardware: minimum/recommended specs for face swap + AI voice changer simultaneously; integrated vs mid-range GPU; free cloud alternatives

### Takeaway
To run both at once in real time you realistically need a dedicated NVIDIA GPU. About 6 GB of VRAM is commonly cited for Deep-Live-Cam alone, and about 8 GB+ (RTX 3060-class or better) is a sensible target for both, since the two models share the GPU. Integrated graphics and CPU-only are described as impractical for live use. Google Colab explicitly prohibits "creating deepfakes" on all runtimes and prohibits remote desktop/web-UI use on free runtimes, so it is not an allowed or practical option for live calls.

### Cited Findings
**Face swap (Deep-Live-Cam)**
- The README (v2.1.6 heading, © 2026) gives no explicit GPU or VRAM spec. Python 3.11 to 3.14 is supported. On first run it downloads about 300 MB of models (inswapper_128_fp16, GFPGAN). CPU mode "is more likely to work on your computer but will be slower". In webcam mode, the preview takes 10 to 30 s to start after clicking "Live". — [Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam)
- The official paid prebuilt (Windows/NVIDIA) listing says it needs "6GB VRAM or higher" and claims 10 to 20 fps depending on the GPU. This is a vendor claim. — [hacksider Gumroad](https://hacksider.gumroad.com/l/vccdmm)
- Measured: about 20 FPS with face enhancement on, on an RTX 4080 Laptop GPU (12 GB). — [VerSprite security write-up](https://versprite.com/security-resources/real-time-deepfake-face-swapping)
- Unverified blog claims: 60+ FPS at 1080p on an RTX 4090, about 30 FPS at 720p on an RX 7900 (DirectML), about 25 FPS at 720p on an M2 Max, and 10 to 15 FPS CPU-only. None cites a source. — [DEV Community](https://dev.to/localfaceswap/deep-live-cam-free-real-time-ai-face-swap-software-1i41); [promptzone](https://www.promptzone.com/damonwho/deep-live-cam-setup-tutorial-c0c.md)
- More cautious sources say CPU-only "is workable for processing a saved video file and impractical for live webcam use" and that it doesn't run smoothly "on a CPU or old integrated graphics". — [starlog article](https://starlog.is/articles/ai-dev-tools/hacksider-deep-live-cam); [themenonlab](https://themenonlab.blog/blog/deep-live-cam-real-time-face-swap-deepfake)
- An unofficial mirror claims 4 GB VRAM support, which I could not confirm. — [jmhublar fork](https://github.com/jmhublar/Deep-Live-Cam)
- The README's `--max-memory` option caps RAM. A tutorial advises setting the memory cap to VRAM minus 1 to 2 GB, leaving room for Windows (for example, 8 on a 10 GB RTX 3080). — [Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam)

**Voice changer (w-okada / RVC)**
- The README has no hardware spec. Its default input chunk is 192, and it links a community GPU chart of known-working chunk and "extra" values. — [w-okada README](https://www.github.com/w-okada/voice-changer/blob/master/README_en.md); [VoiceChangerGuide GPU chart](https://rentry.co/VoiceChangerGuide)
- Guides list a minimum of GTX 1060 6 GB or RX 580 8 GB and recommend RTX 20-series or newer. Another guide calls an RTX 3060 8 GB the minimum viable option. AMD users report more setup trouble. — [dubbingai guide](https://dubbingai.io/articles/en/article/w-okada-voice-changer-setup-guide); [Apatero guide](https://apatero.com/blog/rvc-real-time-voice-conversion-streaming-2026)
- Latency: an RTX 3070 on stock w-okada gets about 170 to 213 ms chunk latency. The deiteris fork is reported faster on NVIDIA. Another user reports about 0.5 s total latency on an RTX 3060. These are anecdotal. — [rentry fork guide](https://rentry.co/forkvoicechangerguide); [Huggingface w-okada guide](https://Huggingface.co/blog/Lenylvt/w-okada)
- Smaller chunks lower latency but raise GPU load sharply. Common starting points are chunk 96 to 128 with extra 8192. Raise the chunk in steps of 64 until crackling stops. — [Huggingface guide](https://Huggingface.co/blog/Lenylvt/w-okada); [voicechanger.live troubleshooting](https://voicechanger.live/blog/rvc-troubleshooting-guide)

**Free cloud (Colab / Kaggle)**
- Colab FAQ, disallowed on ALL managed runtimes: "creating deepfakes", "connecting to remote proxies", and "file hosting, media serving, or other web service offerings not related to interactive compute with Colab". Disallowed on free runtimes without compute units: "remote control such as SSH shells, remote desktops" and "bypassing the notebook UI to interact primarily via a web UI". — [Colab FAQ](https://research.google.com/colaboratory/faq.html)
- The deepfake ban was added in May 2022. — [Unite.AI](https://www.unite.ai/google-has-banned-the-training-of-deepfakes-in-colab); [the-decoder](https://the-decoder.com/google-bans-deepfake-training-in-colab/)

### Inferences
- Running both on one GPU: VRAM roughly adds up (face swap needs 6 GB+ and RVC uses a few GB), and both compete for compute. An 8 GB card is a tight minimum and 12 GB is comfortable. Expect face-swap FPS to drop when the voice model is also running. A mid-range RTX 3060/4060 laptop or desktop is the realistic floor for usable results (roughly 10 to 20 fps video and about 0.2 to 0.5 s voice latency, based on the figures above).
- Integrated graphics (Intel Iris/Arc iGPU via OpenVINO/DirectML, AMD iGPU via DirectML): expect single-digit to low-teens FPS for face swap at best, with no headroom left for RVC. Lighter, non-AI voice effects are more realistic on such machines. No benchmark exists to confirm this.
- Apple Silicon can run Deep-Live-Cam via CoreML. Running RVC alongside it on the same Mac is unbenchmarked.
- Cloud GPUs add network round-trip latency on top of model latency, and Colab bans both the purpose (deepfakes) and the method (remote desktop/web UI on the free tier). So free cloud is not a legitimate option.

### Gaps
- No trustworthy benchmark of face swap and RVC running at the same time on the same GPU.
- No verified iGPU FPS numbers.
- I did not check Kaggle's current terms of service for deepfake or real-time streaming restrictions.

## Q4. Audio/video sync and latency tips; Discord/Meet settings to disable processing

### Takeaway
Turn off the call app's own noise suppression, echo cancellation and automatic gain control so they don't fight the AI voice. Match sample rates to 48 kHz. Tune the RVC chunk size for the lowest latency without crackle. Because video and voice delays differ, add a matching delay in OBS (Render Delay filter or the audio sync offset) to resync them.

### Cited Findings
- Discord's Krisp noise suppression can treat voice-changer output as noise and attenuate it. Turn noise suppression off in Discord (Voice & Video → Advanced/Voice Processing → Noise Suppression: None) and do noise cleanup in one place only. (Vendor source.) — [VoxBooster Krisp conflict](https://voxbooster.com/blog/voice-changer-discord-krisp-conflict)
- Disable automatic gain control (it causes volume pumping) and match the mic and virtual cable to 48 kHz to avoid resampling artifacts. (Vendor source.) — [VoxBooster Discord quality fix](https://voxbooster.com/blog/voice-changer-discord-audio-quality-fix); [VoxBooster 2026 optimization](https://voxbooster.com/blog/discord-audio-quality-optimization-2026/)
- Echo cancellation advice conflicts. One guide says turn it off (it clashes with the changer's delay). Another says keep it on if you use speakers. A Discord user saw volume drop with it off. — [VoxBooster quality fix](https://voxbooster.com/blog/voice-changer-discord-audio-quality-fix); [VoxBooster voice filters](https://voxbooster.com/blog/voice-changer-voice-filters-for-discord/); [Discord community](https://support.discord.com/hc/fr/community/posts/10581181309847-Echo-Cancellation-behaves-oddly)
- Meet: ⋮ → Settings → Audio → turn off Noise cancellation. — [Google Meet Help](https://support.google.com/meet/answer/9919960)
- Lower RVC chunk means lower latency but higher GPU load. Latency = chunk length + inference time + crossfade. — [Huggingface w-okada guide](https://Huggingface.co/blog/Lenylvt/w-okada); [voxbooster real-time guide](https://voxbooster.com/blog/real-time-ai-voice-changer)

### Inferences
- Wear headphones. Then echo cancellation can stay off safely, and the voice changer won't re-process the other party's audio.
- Sync: measure both delays (for example, by clapping on camera). If the video lags behind the voice, delay the audio, for instance by routing the converted voice through OBS (Advanced Audio Properties → Sync Offset) and out to a virtual cable or monitor. If the voice lags, add a Render Delay filter to the video source in OBS. This uses standard OBS features, but I found no specific source for this face swap plus RVC combination.
- Close GPU-heavy apps. Use Discord's browser version or turn off its hardware acceleration if the GPU is saturated (untested suggestion).

### Gaps
- No official Discord help-center article on voice-changer settings was retrieved. Menu paths vary by version.
- Telegram and WhatsApp offer no documented toggle to disable their noise suppression.

## Q5. Legal/ToS considerations (brief)

### Takeaway
Using a face swap or voice changer on yourself for fun with people who know is generally fine. Impersonating real people without consent, sexual deepfakes, and fraud are banned by platform rules and illegal in many places. Deep-Live-Cam's own terms ask for consent and labeling.

### Cited Findings
- Discord prohibits impersonation of real individuals, groups or organizations (pseudonyms are allowed). Older guidelines said satire and parody are okay. It bans non-consensual intimate media, including AI deepfakes, and any synthetic sexual media involving minors. Enforcement includes account removal and reports to law enforcement. Guidelines dated Sept 29, 2025; explainers from March 2024. — [Discord Community Guidelines](https://discord.com/guidelines); [Identity & Authenticity explainer](https://discord.com/safety/identity-authenticity-policy-explainer); [NCII explainer](https://discord.com/safety/non-consensual-intimate-media-policy-explainer-march-2024)
- Deep-Live-Cam README: "Users are expected to use this software responsibly and legally". "If using a real person's face, obtain their consent and clearly label any output as a deepfake when sharing online". It has a built-in filter for nudity and graphic content, and says the insightface model is for non-commercial research. — [Deep-Live-Cam README](https://github.com/hacksider/Deep-Live-Cam)
- Colab bans creating deepfakes on all runtimes. — [Colab FAQ](https://research.google.com/colaboratory/faq.html)
- A security firm uses real-time face swap for social-engineering training, showing the fraud risk. — [VerSprite](https://versprite.com/security-resources/real-time-deepfake-face-swapping)

### Inferences
- Tell the other people on the call. Use your own face/voice or fictional or consenting identities. Never use it for identity verification, financial requests or romance/sextortion scenarios.
- Altering *your own* outgoing voice is not call recording, so consent laws for recording calls don't directly apply. Impersonation, fraud and likeness/right-of-publicity laws can apply. Several jurisdictions have passed deepfake-specific laws (for example, the US TAKE IT DOWN Act for intimate deepfakes, and EU AI Act transparency duties). These are not verified in this session; see Gaps.

### Gaps
- I did not retrieve primary sources for specific laws (US federal and state deepfake laws, EU AI Act Article 50 transparency, UK Online Safety Act) or WhatsApp, Telegram and Google Meet's own impersonation clauses. A legal researcher should verify these.
