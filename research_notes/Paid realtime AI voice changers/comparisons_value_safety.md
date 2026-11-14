# Paid real-time AI voice changers: comparisons, value, cloud vs local, privacy and legal (as of 14 Nov 2026)

Source reliability key, used throughout:
- **[VENDOR]**: written by a company that sells a competing voice changer. Dubbing AI's own "best of" lists, the Fish Audio blog, VoxBooster and Voice.ai's own hub all fall here. They are biased.
- **[AFFIL]**: a review or listicle site that has affiliate links or an unclear business model.
- **[PRIMARY]**: a vendor's own pricing or policy page, a regulator, a law-firm summary of a law, or a Trustpilot page snapshot.
- **[PRESS]**: independent tech or business press.

---

## Q1. Independent head-to-heads, blind tests and Reddit consensus: which paid real-time changer sounds most human, and how do paid apps compare with free local RVC (w-okada)?

### Takeaway
I found no independent blind listening test and no lab-style latency test that puts the paid real-time changers side by side. What exists is a loose consensus, mostly relayed second-hand from Reddit through blogs:
- **For realism:** free local RVC (w-okada and its forks) with a good voice model, on an NVIDIA GPU, is the usual recommendation.
- **For ease of use:** Voicemod and Voice.ai, but Voicemod's AI voices are often called robotic or novelty-like. Voice.ai's community models are described as more natural, but heavier on the GPU.
- **Highest-quality "conversion" overall:** ElevenLabs, but it is not real-time.
- **Supertone/Antinode Shift and Dubbing AI:** they have almost no independent quality assessment.

### Cited Findings
- **No single winner, per a Reddit-summary article.** It says "there is no single Reddit-approved winner". Users split by goal: real-time chat favours Voicemod and Voice.ai, while realism-chasers build RVC setups on NVIDIA hardware. The article cites no specific threads, says "User reports are not independent product tests", and did no hands-on testing. Published 12 Oct 2026, updated 18 Oct 2026. [AFFIL; discloses commissions] — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
- **Free/DIY tool details from the same article:**
  - w-okada VCClient: free, MIT licence.
  - RVC WebUI: can train a voice from about 10 minutes of audio, but "can stumble on extremes such as whispers".
  - Voice.ai: live mode expects a discrete GPU.
  - Voicemod: AI voices need an AVX2 CPU; requires Windows 10 1607+/11 or macOS 13+.
  - ElevenLabs: file-based, but "maps pitch, timing and speech noises closely".
  - Real-time conversion "trades some fidelity for latency".
  - Source: [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
- **Aggregated Reddit sentiment (second-hand).** It says Voicemod is the mainstream gaming favourite, but technical subreddits criticise its AI voices as "latency-heavy" compared with RVC, and as sounding robotic. Voice.ai's high-ranked community models "provide startling realism" but are "significantly more GPU-intensive". w-okada/RVC is the most-recommended option for realism and cost, but needs setup and a capable NVIDIA GPU. These are blog summaries, not primary Reddit threads. — [parse.gl topic summary](https://parse.gl/topics/real-time-ai-voice-changer); [oreateai "Why Reddit recommends…"](https://discover.oreateai.com/discover/why-reddit-consistently-recommends-these-7-ai-voice-changers-for-gaming-and-creation)
- **fast.io "10 tools tested" (updated 20 May 2026).** It ran the same 60-second sample through each tool and compared clarity, emotional range and artifacts, but gives no listener panel or blind protocol. Its verdicts:
  - Voicemod "leans toward novelty and gaming, not realistic transformation"; measured latency 12–20 ms.
  - Voice.ai "more natural than preset-based changers"; claims sub-50 ms, but no measured figure.
  - Dubbing AI ~30 ms, with no realism verdict.
  - ElevenLabs was called the highest-quality consumer conversion, but it is not real-time and adds seconds per clip.
  - Altered Studio "can sound slightly robotic on longer clips".
  - The MOS "above 4.5" for ElevenLabs and Respeecher comes from Toolworthy, not its own test.
  - Publisher Fastio sells unrelated AI software; no affiliate disclosure.
  - Source: [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
- **Latency claims conflict heavily.**
  - Dubbing AI is quoted at ~30 ms in one list and 300 ms in another.
  - Voicemod ~12 ms (Toolworthy, RTX 3060 PC); HitPaw VoicePea 80–120 ms.
  - VoxBooster [VENDOR] says neural voice conversion runs at 250–550 ms on consumer hardware.
  - The search found no independent loopback-measured comparison.
  - Source: [Toolworthy](https://www.toolworthy.ai/blog/best-ai-voice-changer); [VoxBooster](https://voxbooster.com/blog/best-ai-voice-changer-2026/); [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
- **Measured w-okada latency (AI Hub docs, community-maintained).** An RTX 3070 on the prebuilt w-okada reaches 170–213 ms chunk latency; a manually set-up environment reaches 42 ms. Other guides suggest chunk 112 for NVIDIA and 448 for CPU. One guide says chunk 256–512 keeps latency under 200 ms on RTX 30-series. — [AI Hub docs, Deiteris fork](https://docs.aihub.gg/realtime-voice-changer/local/deiteris-w-okada-fork/); [Hugging Face w-okada guide](https://huggingface.co/blog/Lenylvt/w-okada)
- **Fish Audio's own comparison (22 Jun 2026) [VENDOR]:**
  - It describes Fish Audio's Voice Changer as file-based ("<30s processing"), not real-time.
  - Dubbing AI: "<30ms", and "the entire transformation happens locally", with "0% GPU".
  - Voicemod, iMyFone MagicMic and HitPaw: latency "not officially disclosed".
  - No test methodology for any figure.
  - Source: [Fish Audio blog](https://fish.audio/blog/best-real-time-ai-voice-changers/)
- **Supertone Shift (now Antinode Shift):**
  - Maker claims latency "as low as 47 ms"; one review warns it is "quite CPU-heavy" for low-end machines. — [search summary of Softpedia/qcall reviews](https://www.softpedia.com/get/Multimedia/Audio/Audio-Editors-Recorders/Supertone-Shift.shtml); [qcall.ai review](https://qcall.ai/supertone-ai-review)
  - The current product page only says "best-in-class latency, as close as possible to real-time", with no figure. — [Antinode Shift page](https://antinodeaudio.com/en/shift)
- **Voicemod user sentiment on realism.** One Trustpilot reviewer: "Very unrealistic sounds, they are laggy and sound horrible" (Sep 2023). A lifetime buyer complains the app is now "full of AI everywhere" (Aug 2026). — [Trustpilot Voicemod](https://www.trustpilot.com/review/voicemod.net)
- **A single anecdote in a blog.** One "Reddit" user said other changers "don't seem very clear when I'm speaking compared to Dubbing AI". It appears on Dubbing AI's own site [VENDOR]. — [dubbingai.io list](https://dubbingai.io/articles/en/list/best-real-time-voice-changers-gaming)

### Inferences
- **Rough realism ranking for live use**, reading across the sources and weighting non-vendor ones:
  1. Local RVC (w-okada/forks) with a well-trained model.
  2. Voice.ai community models (likely RVC-class models).
  3. Supertone/Antinode Shift (too little independent evidence to place it confidently).
  4. Dubbing AI.
  5. Voicemod AI voices (most often called robotic or novelty).
  - This is a consensus impression, not a measured result.
- **ElevenLabs and Fish Audio are not real-time desktop changers.** They should be ranked separately, as offline or record-then-convert quality benchmarks.
- **Sub-30 ms claims for neural conversion are hard to square with measured RVC figures.** The RVC numbers are 42–213 ms, and VoxBooster's 250–550 ms is also a vendor claim. Very low figures may be measuring buffer latency or simple DSP effects rather than full mic-to-output neural conversion.
- **Paid vs free RVC:** paid apps mainly buy convenience (installers, voice libraries, support, CPU-only operation). Users who will tune w-okada on an NVIDIA GPU get equal or better realism for $0.

### Gaps
- No blind/ABX listening test or MOS study of real-time consumer changers was found.
- No YouTube comparison with stated methodology was located; searches surfaced only blog lists.
- No primary Reddit threads were fetched. All "Reddit consensus" is second-hand via blogs.
- No independent quality assessment was found for Antinode/Supertone Shift or Dubbing AI's realism.

---

## Q2. Effective cost per hour of real-time use (credit-based and subscription tools)

### Takeaway
- **ElevenLabs** is the only tool with a clear published per-minute credit rate for voice changing: 1,000 credits per minute. That works out to roughly **$9.90–$12 per hour** on subscription plans, or about **$7.20 per hour** via the API. But it is not real-time.
- **The real-time desktop apps:** Voicemod, Dubbing AI and Antinode Shift are flat subscriptions or perpetual licences. Their effective hourly cost is well under $1 at normal usage.
- **Voice.ai** publishes credits and "Audio Tools" minutes, but does not say clearly whether its real-time desktop changer draws on them.
- **w-okada RVC:** $0 in software cost.

### Cited Findings
- **ElevenLabs plans (official pricing page, fetched Nov 2026).** Voice Changer (and Voice Isolator) cost **1,000 credits per minute**. The page does not say voice changer is real-time. [PRIMARY] — [ElevenLabs pricing](https://elevenlabs.io/pricing)

  | Plan | Price | Credits per month |
  |---|---|---|
  | Free | $0 | 10,000 |
  | Starter | $6 ($1 first month) | 30,000 |
  | Creator | $22 ($11 first month) | 121,000 |
  | Pro | $99 | 600,000 |
  | Scale | $299 | 1,800,000 |
  | Business | $990 | 6,000,000 |

- **ElevenLabs API voice changer rate.** Several secondary pricing guides quote $0.12/min; the official page fetched did not list it. — [Cekura](https://www.cekura.ai/blogs/elevenlabs-pricing); [FelloAI](https://felloai.com/elevenlabs-pricing/)
- **ElevenLabs is record-then-convert, with caps.** The web Voice Changer takes an uploaded file or a live mic recording, with a 5-minute cap and a 50 MB file limit. A speech-to-speech *streaming* API endpoint exists. An open-source community project (elevenlabs-live-vc) chains it to VB-Cable for pseudo-live use. — [ElevenLabs docs](https://elevenlabs.io/docs/product-guides/playground/voice-changer); [API ref, STS stream](https://elevenlabs.io/docs/api-reference/speech-to-speech/stream.md); [elevenlabs-live-vc](https://gh.hhj520.top/cavoq/elevenlabs-live-vc)
- **Voice.ai platform pricing (official page).** The Audio Tools minute allowances are listed per plan below. Per-conversion caps run from 5 min (Free) to 180 min (Scale). The page does **not** say whether the real-time desktop changer consumes credits, and does not state cost per minute for it. [PRIMARY] — [Voice.ai pricing](https://voice.ai/pricing)

  | Plan | Price | Credits per month | Audio Tools minutes |
  |---|---|---|---|
  | Free | $0 | 5k | 3 uses |
  | Starter | $5 | 15k | 500 |
  | Launch | $24 ($12 first month) | 200k | 3,000 |
  | Core | $99 | 1M | 15,000 |
  | Scale | $330 | 4M | 50,000 |
  | Business | $880 | 22M | 150,000 |

- **Voice.ai credit conversions don't cover real-time changing.** A review notes that the published conversions are for TTS, voice agents and audio tools, "not for real-time voice changing". It also notes that 5,000 credits equals 5 minutes of TTS or agents. — [CloudTalk Voice.ai pricing](https://www.cloudtalk.io/blog/voice-ai-pricing/)
- **Voice.ai consumer billing in user reports.** A "FREE 3-day trial, followed by a $7.99 charge" (29 Oct 2026). A lifetime purchase that came with "8,300 credits" (31 May 2026). "I bought a voice for 4.6k coins, and I can't even use it without a subscription" (17 Oct 2026). — [Trustpilot Voice.ai](https://www.trustpilot.com/review/voice.ai)
- **Voicemod Pro: no fixed public price; checkout prices vary by region and timing.** Products are sold in-app through Xsolla or Paddle on desktop and RevenueCat on mobile. — [voicepicker](https://voicepicker.ai/tools/voicemod/pricing); [ToolChase](https://toolchase.com/tool/voicemod/)
  - fast.io: Pro $12/month monthly, $4.50/month billed annually, $39.99 lifetime. — [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
  - Other aggregators: $4.99–$14.99/month, $29.88–$99.99/year, lifetime $39.99–$99.99. — [Toolfi](https://www.toolfi.ai/pricing/voicemod-ab35982c); [ToolChase](https://toolchase.com/tool/voicemod/)
  - The free tier has rotating voices, one AI voice per day per Real AI Test, and a soundboard limit of 75 uses per a June 2026 reviewer. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html); [Trustpilot Voicemod](https://www.trustpilot.com/review/voicemod.net)
- **Antinode Shift (formerly Supertone Shift), official page.** [PRIMARY] — [Antinode Shift](https://antinodeaudio.com/en/shift)
  - Free tier with monthly credits and 3,000 credits on download.
  - Starter $3.99/month, with a promo of "all 40 voices" for $1.99/month.
  - Pro $14.99/month.
  - Perpetual $149.99 per voice.
  - Pricing effective 17 Apr 2025.
  - It does **not** state how many credits a minute of real-time use consumes.
  - Older or third-party figures conflict: $4.99/month for 200 credits; $49 licence plus $149 voice packs; $39.99 per voice. — [Softpedia summary](https://www.softpedia.com/get/Multimedia/Audio/Audio-Editors-Recorders/Supertone-Shift.shtml)
- **Dubbing AI.**
  - Pro is about $9.99/month or $59.99/year (Toolworthy, fast.io). — [Toolworthy](https://www.toolworthy.ai/blog/best-ai-voice-changer); [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
  - The free tier gives 10 rotating voices a day plus 5 "mystery" voices; paid unlocks 500+. [VENDOR] — [Fish Audio blog](https://fish.audio/blog/best-real-time-ai-voice-changers/)
  - A Trustpilot reviewer cites a $5 charge for Pro (Sep 2026), which conflicts with the $9.99 figure. — [Trustpilot Dubbing AI](https://www.trustpilot.com/review/dubbingai.io)
- **w-okada VCClient:** free, MIT licence. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)

### Inferences
Calculated from the cited prices. The 20 h/month and 60 h/month usage levels are my assumptions.

| Tool / plan | Basis | Effective cost per hour |
|---|---|---|
| ElevenLabs Starter $6 | 30 min/month | **$12.00/h** (only 0.5 h/month included) |
| ElevenLabs Creator $22 | 121 min | **$10.91/h** (~2 h/month) |
| ElevenLabs Pro $99 | 600 min | **$9.90/h** (10 h/month) |
| ElevenLabs Scale $299 | 1,800 min | **$9.97/h** (30 h/month) |
| ElevenLabs Business $990 | 6,000 min | **$9.90/h** (100 h/month) |
| ElevenLabs API | $0.12/min (secondary sources) | **$7.20/h** |
| Voice.ai Starter $5 | 500 Audio Tools min, *if* they apply to voice changing | $0.60/h |
| Voice.ai Launch $24 | 3,000 min | $0.48/h |
| Voice.ai Core $99 | 15,000 min | $0.40/h |
| Voicemod Pro $12/month (monthly) | flat | $0.60/h at 20 h/month; $0.20/h at 60 h/month |
| Voicemod Pro $4.50/month (annual) | flat | $0.23/h at 20 h/month |
| Voicemod lifetime $39.99 | one-off | payback vs annual in ~9 months |
| Dubbing AI Pro $9.99/month | flat | $0.50/h at 20 h/month |
| Dubbing AI $59.99/year (~$5/month) | flat | $0.25/h at 20 h/month |
| Antinode Shift Pro $14.99/month | flat, but credit burn unknown | ≈$0.75/h at 20 h/month, if not credit-limited |
| Antinode Shift Starter $3.99 | flat | ≈$0.20/h at 20 h/month |
| w-okada RVC | $0 software; electricity only | ~$0 marginal |

- **ElevenLabs costs about 15–50× more per hour than the flat-rate desktop changers.** The included minutes on its cheap plans also last minutes, not hours. That makes it unsuitable for always-on live use even ignoring latency.
- **The Voice.ai consumer desktop changer appears to use a separate subscription** (the $7.99 trial charge) and a "coins" economy distinct from the platform price page. Its true hourly cost cannot be pinned down from published material.

### Gaps
- No official credits-per-minute rate was found for real-time use on Antinode Shift, Voice.ai's desktop changer, or Dubbing AI.
- No official Voicemod price page exists; prices vary by region.
- ElevenLabs' $0.12/min API rate is from secondary sources only.

---

## Q3. Cloud vs local processing: which paid tools offload the GPU, and what is the trade-off for an 8 GB RTX 5060 laptop also running Deep-Live-Cam?

### Takeaway
None of the mainstream *real-time* desktop changers is clearly documented as cloud-processed. They split into two groups:
- **Local GPU:** Voice.ai live mode and w-okada RVC.
- **Local CPU / "no GPU required":** Voicemod AI voices (AVX2 CPU), Antinode Shift ("No GPU Required", described as CPU-heavy) and Dubbing AI (vendor claims local, "0% GPU", 2–3% CPU).

The genuinely cloud tools (ElevenLabs, Fish Audio) are file or record-based, not live. For a GPU-constrained setup, the practical way to "offload" is a CPU-based changer, not a cloud one.

### Cited Findings
- **Voicemod:**
  - AI voices need an AVX2-capable CPU. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
  - fast.io lists Voicemod as local. — [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
  - A Voicemod representative, in an interview, says running processing locally reduces exposure of voice data. — [80.lv interview](https://80.lv/articles/real-time-voice-transformation-and-the-future-of-online-player-identity/)
  - Trustpilot users report high RAM use and slowdowns (Jan 2026), and one says it "destroyed my audio drivers" (Mar 2026). — [Trustpilot Voicemod](https://www.trustpilot.com/review/voicemod.net)
- **Voice.ai:**
  - Live mode expects a discrete GPU. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
  - A review says real-time conversion "demands a dedicated NVIDIA GPU". Users report needing a "$300-plus card". — [CloudTalk Voice.ai review](https://www.cloudtalk.io/blog/voice-ai-review/)
  - Sources conflict on cloud use. One says the free tier uses cloud processing and the paid tier local; another describes latency as "variable because it partly uses cloud processing". — [CloudTalk](https://www.cloudtalk.io/blog/voice-ai-review/); [Toolworthy](https://www.toolworthy.ai/blog/best-ai-voice-changer)
  - No native macOS real-time app is reported. — [CloudTalk](https://www.cloudtalk.io/blog/voice-ai-review/)
- **Dubbing AI:** vendor-stated local processing with "0% GPU" and 2–3% CPU. "The entire transformation happens locally on your device" ([VENDOR] Fish Audio, relaying Dubbing AI claims, with no methodology). — [Fish Audio blog](https://fish.audio/blog/best-real-time-ai-voice-changers/)
  - Its privacy policy lists "data storage, hosting and server providers" but does not say whether live audio is sent to servers. — [Dubbing AI privacy policy](https://dubbingai.io/privacy-policy)
  - Toolworthy mentions "priority processing" as a Pro feature. — [Toolworthy](https://www.toolworthy.ai/blog/best-ai-voice-changer)
- **Antinode Shift:** "No GPU Required", "on any device". Runs on Windows 10+ 64-bit and macOS 10.14+; local vs cloud is not stated. — [Antinode Shift](https://antinodeaudio.com/en/shift)
  - Reviews say it "runs on your processor alone" and is "quite CPU-heavy". — [Softpedia summary](https://www.softpedia.com/get/Multimedia/Audio/Audio-Editors-Recorders/Supertone-Shift.shtml)
- **w-okada RVC:** guides cite a minimum of ~4 GB VRAM, with others mentioning 6–8 GB. None measure total VRAM in use. — [Tech Tactician](https://techtactician.com/okada-ai-live-voice-changer-how-to/); [propelrc guide](https://www.propelrc.com/how-to-use-w-okada-ai-voice-changer/)
- **VonoVox (free, local):** "audio can stutter if the GPU is busy". This illustrates the GPU-contention risk. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
- **Cloud and web tools:** ElevenLabs, Murf and Kits.AI are browser-based and file-based. — [Real AI Test](https://www.realaitest.com/article/best-ai-voice-changer-reddit.html)
  - Fish Audio's voice changer is file-based and browser-based. — [Fish Audio blog](https://fish.audio/blog/best-real-time-ai-voice-changers/)
  - ElevenLabs adds "seconds per clip". — [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)
- **Latency perception thresholds** used by fast.io: under 30 ms imperceptible; 30–100 ms usable for gaming; over 100 ms noticeable lag. — [fast.io](https://fast.io/resources/best-ai-voice-changers-2026/)

### Inferences
- **On an 8 GB RTX 5060 laptop running Deep-Live-Cam:**
  - Running w-okada RVC or Voice.ai live mode alongside it means two CUDA/ONNX workloads competing for VRAM and GPU time. That risks stutter in either the audio or the face-swap stream.
  - A CPU-based changer (Antinode Shift, Voicemod AI voices, Dubbing AI if its claims hold) leaves the GPU to Deep-Live-Cam. But Shift is described as CPU-heavy, and laptop CPUs can thermally throttle when the GPU is also loaded.
- **Cloud real-time voice conversion with low latency is not offered as a consumer desktop product by any vendor found.** A DIY ElevenLabs streaming-API pipeline would add network round-trip on top of model time. It would also cost ~$7–12 per hour (see Q2), and it is not suited to lip-synced live video.
- **Dubbing AI's near-zero CPU/GPU claim is unusual for local neural conversion.** It deserves independent verification, for example by watching network traffic while it is in use. If audio is in fact processed server-side, that matters for both latency and privacy.

### Gaps
- No measurement was found of Deep-Live-Cam plus RVC VRAM co-residency on an 8 GB card.
- No independent network-traffic analysis was found for Dubbing AI or Voice.ai, to settle whether live audio leaves the machine.
- Voicemod's official privacy page could not be retrieved (404), so local-only processing for the main app is not confirmed from a primary source.

---

## Q4. Privacy, security, controversies and billing complaints

### Takeaway
- **Voice.ai** has the worst record:
  - A documented 2023 GPL-violation dispute, in which the developer who raised it was banned from Voice.ai's Discord.
  - Lingering suspicion over its opt-in "distributed computing" GPU/CPU sharing; the company denies any crypto-mining link.
  - Trustpilot 1.3/5 (88% one-star), with auto-renew, trial-to-charge and cancellation complaints.
- **Voicemod:** its policy reportedly allows voice samples to be used for "training our technologies" with no clear opt-out. Trustpilot is 1.6/5, driven by refund and paywall complaints. There is **no evidence of a Voicemod data breach** or of the official installer bundling adware; the adware risk comes from third-party repackaged installers.
- **Dubbing AI:** Singapore-based, with a vague policy on voice audio. Trustpilot is 2.3/5 on few reviews, with charge-after-cancel and malware allegations.
- **Supertone/Antinode Shift:** carries a continuity risk after HYBE liquidated Supertone in July 2026.

### Cited Findings
- **Voice.ai GPL dispute (Feb 2023).** A developer (Ronsor) found GPL-licensed code in Voice.ai's app with no source offered. Voice.ai's terms barred redistribution and reverse engineering. He was banned from its Discord. Voice.ai quietly updated its licence; Gigazine reported it still violated GPLv3. Voice.ai said "Licenses can be complex." [PRESS] — [The Register, 8 Feb 2023](https://www.theregister.com/2023/02/08/voiceai_open_source); [Gigazine](https://wbgsv0a.gigazine.net/gsc_news/en/20230208-voice-ai-gpl-violations); [Neowin](https://www.neowin.net/news/jailbreak-hacker-uncovers-stolen-open-source-code-in-voiceai/)
- **Voice.ai "distributed computing".**
  - It uses spare device CPU/GPU for model training on an opt-in basis. The FAQ says it has nothing to do with crypto or mining. The mining accusation rests on user anecdotes, with no audit found. — [Comparitech "Is Voice.ai safe"](https://comparitech.com/blog/vpn-privacy/is-voice-ai-safe)
  - A review says free credits require running background distributed computing. — [CloudTalk](https://www.cloudtalk.io/blog/voice-ai-review/)
- **Voice.ai on Trustpilot (snapshot Nov 2026).** TrustScore **1.3/5**, 227 reviews (55 in the last 12 months), 88% one-star and 9% five-star. The company replies to 96% of negative reviews. [PRIMARY snapshot] — [Trustpilot Voice.ai](https://www.trustpilot.com/review/voice.ai) Complaints include:
  - "FREE 3-day trial, followed by a $7.99 charge" (29 Oct 2026).
  - "auto-renewed without any reminder or warning" (14 Jul 2026).
  - "no option to cancel your payment on the website" (16 Jul 2026).
  - "xsolla refused to refund me" (31 May 2026).
  - The Mac app "adds voice.ai as a login item… every time u launch" (25 Jul 2026).
  - "they collect your data with no consent" (24 Apr 2026, an unverified user claim).
- **Voicemod and voice data.**
  - An independent review says Voicemod's policy processes voice samples for "improvement of our services (training our technologies)". It says the policy "does not offer a clear opt-out" for that use. — [BlockSentient review](https://blocksentient.com/review/voicemod)
  - Voicemod states it "does not listen to real-time voice changer conversations" or to recordings provided for AI voice creation. — [BlockSentient review](https://blocksentient.com/review/voicemod)
  - Voicemod Key (hardware) processing "runs locally on the phone with no server transmission". — [BlockSentient review](https://blocksentient.com/review/voicemod)
  - A third-party guide says Voicemod does not sell user data. — [EaseUS](https://multimedia.easeus.com/voice-changer-tips/is-voicemod-safe.html)
  - The primary privacy policy page could not be fetched (404).
- **Voicemod breach and adware.**
  - Searches found **no reported Voicemod data breach**.
  - Official installers are DigiCert-signed (2025 builds). — [Gridinsoft scan](https://gridinsoft.com/online-virus-scanner/id/3d50ce7693b23cd3d1f05682d0fec9958ab1329a2d01e6d6c79bdb2e6505984c)
  - An ANY.RUN sandbox run (Dec 2025) of a uTorrent installer that launched a Voicemod installer component was tagged adware. This points to third-party bundling. — [ANY.RUN report](https://any.run/report/afd7452c34570e409fc0c2bc8a22fb7429a3cc8f48e85fe6a154656ec020330d/126229bc-1e98-489f-a0e4-124b790d96c6)
  - A guide warns repackaged copies may carry adware. — [VoxBooster download guide](https://voxbooster.com/blog/download-voicemod) [VENDOR]
- **Voicemod on Trustpilot (snapshot Nov 2026).** TrustScore **1.6/5** on 459 reviews (40 in the last 12 months). The distribution is 54% five-star and 25% one-star; the low score reflects Trustpilot's weighting of recent reviews. [PRIMARY snapshot] — [Trustpilot Voicemod](https://www.trustpilot.com/review/voicemod.net) Complaints include:
  - Refund requests unanswered for weeks (Mar 2026).
  - Confusing in-app monthly vs upfront pricing (Oct 2026).
  - "99% of it is behind a paywall" (Jan 2026).
  - Audio driver breakage (Mar 2026).
- **Datalevo analysis of Voicemod reviews.** Of the 20 most recent reviews (Jan–Aug 2026), 14 were one-star and none five-star. Cancellation is at account.voicemod.net on desktop, or through phone store settings on mobile. The licence stays active until expiry. — [Datalevo](https://datalevo.com/?p=5194)
- **Dubbing AI privacy policy** (last updated 9 Dec 2025; entity HALO INTERACTIVE PTE. LTD., Singapore). [PRIMARY] — [Dubbing AI privacy policy](https://dubbingai.io/privacy-policy)
  - It mentions audio only generically ("Audio or visual data… you share with us").
  - It does not address live voice processing or AI training.
  - Personal data is deleted within 90 days of account deletion.
  - Named third parties are Google Analytics, Stripe and Discord.
- **Dubbing AI on Trustpilot.** TrustScore **2.3/5**, only 23 reviews, 74% one-star. The company replied to 18% of negative reviews. [PRIMARY snapshot] — [Trustpilot Dubbing AI](https://www.trustpilot.com/review/dubbingai.io) Complaints include:
  - Charged $5 with Pro not activating (Sep 2026).
  - "charges you even though you cancel your membership" (Jul 2026).
  - The 500-voice library never unlocked (Jun 2025).
  - The app changes the registry, and malware was observed in a VM (Mar 2026 and Mar 2025; unverified user claims).
  - The app auto-starts (Oct 2025).
- **Supertone/Shift corporate risk.**
  - Supertone shareholders voted to dissolve the company on 15 Jul 2026, and HYBE announced the liquidation on 27 Jul 2026. HYBE had invested ~KRW 49bn (~$35M). Supertone's revenue was ~KRW 2.3bn and its net loss ~KRW 13bn the prior year. Shift, Clear and Air were reported as being sold to an external buyer. [PRESS] — [Music Business Worldwide](https://musicbusinessworldwide.com/hybe-winds-down-ai-voice-company-supertone-after-investing-nearly-35m); [Edaily](https://en.edaily.co.kr/news/eda202607275504/)
  - The Shift product page now redirects to Antinode Audio Co., Ltd. (Daejeon, Korea), "Formerly Supertone Shift", currently v2.1. The page has no privacy statement. [PRIMARY] — [Antinode Shift](https://antinodeaudio.com/en/shift)

### Inferences
- **Safety and trust ranking for paid real-time apps, weighing documented incidents above anecdotes:**
  1. Voicemod: no breach found, signed installers; but there are training-use and refund concerns.
  2. Antinode Shift: no incidents found, but an ownership transition and no visible privacy policy on the product page.
  3. Dubbing AI: thin and vague policy, small and very negative review base, malware allegations.
  4. Voice.ai: GPL conduct, background resource-sharing, worst billing complaints.
  - Free local w-okada RVC keeps audio fully on-device, but it is community software downloaded from GitHub or Hugging Face. Users should obtain it from the official repo.
- **Common billing pattern across vendors:** third-party merchant-of-record checkout (Xsolla, Paddle) makes refunds harder. Trial-to-paid conversions and auto-renew are the main friction. Buying the shortest term first, or a lifetime licence from the official site, limits exposure.
- **Trustpilot samples are small and self-selected,** especially Dubbing AI's 23 reviews. They indicate complaint themes, not prevalence.

### Gaps
- Primary privacy policies for Voicemod and Voice.ai returned 404 at the URLs tried, so the exact retention and training language was not quoted from primary text.
- No BBB records were retrieved for any vendor.
- No independent malware analysis of Dubbing AI was found.
- No information was found on Antinode Audio's data practices or whether Supertone accounts and licences transfer intact. One search summary claimed "existing licences are said to remain valid", but this was not confirmed on a primary page.

---

## Q5. Platform rules and law: brief

### Takeaway
Using a voice changer for anonymity or entertainment is broadly legal. The legal exposure comes from three uses:
- **Impersonation** of real people on platforms (Discord bans deceptive impersonation).
- **Phone calls with AI voices** (US FCC, 2024).
- **Commercial use of someone's voice likeness** (Tennessee ELVIS Act).

In the EU, from 2 Aug 2026 the AI Act requires deployers to disclose deepfake audio.

### Cited Findings
- **FCC Declaratory Ruling, 8 Feb 2024 (FCC 24-17, CG Docket 23-362).** [PRIMARY/legal summaries] — [FCC](https://WWW.FCC.GOV/document/fcc-makes-ai-generated-voices-robocalls-illegal); [Cooley](https://www.cooley.com/news/insight/2024/2024-02-15-fcc-ai-generated-robocalls-illegal-under-the-tcpa); [Orrick](https://www.orrick.com/insights/2024/02/Did%20the%20FCC%20Really%20Ban%20AI%20Generated%20Voice%20Calls%20No%20But%20Restrictions%20Apply)
  - AI-generated and cloned voices count as "artificial" voice under the TCPA, so calls using them need prior express consent.
  - The ruling was unanimous and immediately effective, prompted by the Biden-voice robocalls in New Hampshire.
  - It clarifies existing law rather than banning the technology, and TCPA exemptions (such as non-commercial calls) still apply.
- **Tennessee ELVIS Act.** [legal summaries] — [Holland & Knight](https://hklaw.com/en/insights/publications/2024/04/first-of-its-kind-ai-law-addresses-deep-fakes-and-voice-clones); [Bloomberg Law](https://news.bloomberglaw.com/artificial-intelligence/taylor-swifts-home-state-bans-musical-ai-fakes-in-elvis-law)
  - Signed 21 Mar 2024, effective 1 Jul 2024.
  - It adds "voice", including simulated voices, to Tennessee's right-of-publicity law.
  - It targets unauthorised use, and services that enable impersonation.
  - Remedies apply to Tennessee residents; fair-use exemptions are narrowed.
- **EU AI Act Article 50.** [secondary legal commentary; verify on EUR-Lex] — [Technology.org, 13 Oct 2026](https://www.technology.org/2026/10/13/eu-ai-act-deadlines-after-the-digital-omnibus-what-applies-from-december-2026-to-august-2028/); [TechTimes, 10 Jul 2026](https://www.techtimes.com/articles/320101/20260710/eu-ai-act-enforcement-here-chatbot-rules-live-high-risk-ai-delay-now-binding-law.htm); [Hello Growth](https://hellogrowth.ai/en/blog/eu-ai-act-2026-omnibus-labelling-ai-content)
  - Deployers that generate or manipulate audio constituting a deepfake must disclose that it is AI-generated. This applies from **2 Aug 2026**.
  - The Digital Omnibus, Regulation (EU) 2026/1744 (published 24 Jul 2026, in force 27 Jul 2026), delayed the high-risk obligations to Dec 2027 / Aug 2028 but **not** the deepfake disclosure duty.
  - Only the Art. 50(2) machine-readable marking duty has a grace period: to 2 Dec 2026, for systems already on the market.
  - A lighter regime applies to evidently artistic, satirical or fictional works.
- **Discord Community Guidelines** (effective 29 Sep 2025). Users may not "misrepresent their identity… in a deceptive or harmful way", including impersonating an individual, group or organisation. Parody and satire must be clearly labelled. Penalties go up to permanent removal. [PRIMARY] — [Discord Guidelines](https://discord.com/guidelines); [Identity & Authenticity explainer](https://discord.com/safety/identity-authenticity-policy-explainer)

### Inferences
- **Using a voice changer for a persona or for anonymity in Discord or games is permitted.** Using a cloned voice of a real person to deceive — scam calls, impersonation, fraud — violates platform rules. In the US it can also violate the TCPA (for calls), state right-of-publicity and voice laws (ELVIS), and general fraud law.
- **The EU AI Act's "deployer" definition excludes purely personal, non-professional use** (Art. 3(4)), from background knowledge not verified in this research. If that holds, casual personal use is likely outside Art. 50. Streamers or businesses publishing deepfake audio would need to disclose it.

### Gaps
- WhatsApp's Terms of Service on impersonation were not researched or fetched.
- Vendor voice-cloning consent mechanisms (for example ElevenLabs' voice-verification step, and Voice.ai's or Voicemod's consent terms for custom voices) were not researched.
- Other US state laws (California, New York digital-replica laws), the federal NO FAKES Act status and the TAKE IT DOWN Act were not covered.
