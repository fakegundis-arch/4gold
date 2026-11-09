# Real-Time Conversational AI Voice Agents & AI Voice Calling Platforms (as of Nov 9, 2026)

Notes on method: about 16 searches and fetches. Primary sources used where possible: Artificial Analysis pages, OpenAI and ElevenLabs announcements, and Google docs. Many per-minute prices and latencies come from vendor or affiliate comparison blogs, which are flagged. The "2026" product names below (GPT-Live-1, GPT-Realtime-2/2.1, Gemini 3.8 Live, Grok Voice 3.0, Eleven v4, Eleven Realtime, and others) appear in the search results and on Artificial Analysis pages. I could not open every vendor's primary page.

## Q1. Which are the leaders: underlying speech models and agent/telephony platforms?

### Takeaway
On the speech-to-speech (S2S) model layer, the leading families in late 2026 are OpenAI (GPT-Realtime-2/2.1 for the API, GPT-Live-1/1.1 for full-duplex), Google (Gemini 3.8 Live, plus 3.1 Flash Live), xAI (Grok Voice 3.0), and ElevenLabs (Eleven Realtime, launched Oct 2026). Cartesia's managed agent stack tops Artificial Analysis's human-preference Speech Agent Arena. Benchmarks that score intelligence and benchmarks that score preference rank these models differently. GPT-Realtime-2 leads the reasoning/agentic index but sits mid-pack on preference Elo. On the platform layer, Vapi (flexible, developer-first), Retell (consistent low latency, call-center features), ElevenLabs Agents (voice quality), and Bland (all-in pricing) are the most-cited managed options. LiveKit and Pipecat are the open-source frameworks. Hume's EVI API is being retired on Nov 13, 2026.

### Cited Findings
**Speech-to-speech model layer**
- Artificial Analysis Speech to Speech Index (published June 23, 2026). It is an equal-weighted composite of Big Bench Audio (reasoning), a Full Duplex Bench subset (conversational dynamics), and τ-Voice (agentic). Scores: GPT-Realtime-2 (High) 77.2%, Grok Voice Think Fast 1.0 75.7%, GPT-Realtime-1.5 72.0%, Gemini 3.1 Flash Live Preview (High) 69.5%, Deepslate Opal 62.1%, Gemini 3.1 Flash Live (Minimal) 56.6% — [Artificial Analysis](https://artificialanalysis.ai/articles/announcing-the-artificial-analysis-speech-to-speech-index)
- In the same index, GPT-Realtime-2 (Minimal) led Conversational Dynamics at 96.1%. Grok Voice Think Fast 1.0 led τ-Voice agentic at 52.1% (GPT-Realtime-2 High scored 39.8%; all models scored under 53%) and Big Bench Audio at 97.1% — [Artificial Analysis](https://artificialanalysis.ai/articles/announcing-the-artificial-analysis-speech-to-speech-index)
- A separate AA leaderboard page reportedly shows StepAudio 3 Realtime with 99.7% on Big Bench Audio and 98.9% on conversational dynamics, with Qwen Audio 3.0 Realtime Plus close behind. This comes from a search summary and was not verified on the page — [Artificial Analysis S2S](https://artificialanalysis.ai/speech-to-speech)
- AA Speech Agent Arena: human-preference Elo, anchored so that GPT-Realtime-1.5 = 1000. The page is undated; it references "as of July 2026" and includes Oct 2026 models, so it is the current snapshot. Results (Elo / task success rate):
  - Cartesia Managed Agents 1111 / 91.7%
  - Gemini 3.1 Flash Live Minimal 1089 / 74.6%
  - Gemini 3.8 Live 1074 / 93.2%
  - Gemini 3.1 Flash Live High 1062 / 71.8%
  - Grok Voice 3.0 1059 / 94.8%
  - GPT-Live-1 (Sol, low) 1037 / 90.9%
  - GPT-Live-1 (Astra, medium) 1027 / 87.4%
  - Phonic 1 (High) 1012 / 92.3%
  - GPT-Realtime-1.5 1000 / 85.1%
  - Grok Voice 2.0 991
  - Eleven Realtime v1 Max 990 / 87.1%
  - ElevenLabs Agents cascaded (Gemini 2.5 Flash LLM) 985 / 90.5%
  - Eleven Realtime v1 Mini 981 / 60.3%
  - GPT Realtime (Aug '25) 967
  - Gemini 3.8 Live Extended Thinking 966
  - Amazon Nova 2.0 Sonic 964 / 57.1%
  - GPT-Realtime-2.1 Minimal 933 / High 931
  - GPT-Realtime-2 High 920
  - Deepgram Voice Agent cascaded (GPT-4o mini) 901 / 73.7%
  - Inworld Realtime cascaded 884
  - Qwen3.5 Omni Plus Realtime 843
  - GPT-Realtime-2.1 Mini 840
  - Qwen Audio 3.0 Realtime Plus 798
  - Source: [AA Speech Agent Arena](https://artificialanalysis.ai/speech-to-speech/arena)
- OpenAI GPT-Realtime-2 shipped May 7, 2026. Audio costs $32/M input tokens and $64/M output tokens ($0.40/M cached), which works out to roughly $1.15 per hour of input and $4.61 per hour of output, or about $0.10/min combined — [Handy AI](https://handyai.substack.com/p/model-drop-gpt-realtime-2). GPT-Realtime-2.1 and 2.1-mini ($10/$20 per M audio tokens) are reported only by third-party blogs and are unverified on OpenAI's site — [Cekura](https://www.cekura.ai/blogs/openai-realtime-api-pricing); [Layer3Labs](https://www.layer3labs.io/guides/openai-realtime-api-pricing)
- OpenAI GPT-Live-1 and GPT-Live-1 mini are full-duplex models that "listen while they speak." They launched in ChatGPT on July 8, 2026, and replaced Advanced Voice Mode — [OpenAI](https://openai.com/index/introducing-gpt-live/); [TechCrunch](https://techcrunch.com/2026/07/08/openai-releases-new-voice-models-for-more-natural-live-conversations/). GPT-Live-1 reached the API on Sept 10, 2026, reportedly at ~$0.05/min — [OpenAI Devs on X](https://x.com/OpenAIDevs/status/2098099269551149398); [Quartz](https://qz.com/openai-gpt-live-voice-models-listen-speak-070926)
- Google: the Gemini API models page lists Gemini 3.8 Live as the default Live API model for low-latency voice agents, with an "Extended Thinking" variant, and labels 3.1 Flash Live as legacy — [Google AI models](https://ai.google.dev/gemini-api/docs/models); [Google Cloud 3.8 Live guide](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/guides/gemini-3-8-live). Gemini 3.1 Flash Live launched Mar 26, 2026 — [Google blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-1-flash-live/). A GA date of Sept 15, 2026 for 3.8 Live comes from an aggregator and is unverified — [ai-tldr](https://ai-tldr.dev/models/gemini-3-8-live/)
- xAI Grok Voice 3.0 launched Oct 14, 2026 at $0.08/min ($4.80/hr), the same price as Grok Voice 2.0 — [Technobezz](https://www.technobezz.com/news/xai-launches-grok-voice-per-minute). The original Grok Voice Agent API (Dec 2025) cost $0.05/min — [xAI](https://x.ai/news/grok-voice-agent-api)
- ElevenLabs released Eleven Realtime on Oct 20, 2026. It is a pair of S2S models (v1 Mini, v1 Max) that "starts talking in half a second." One third-party measurement put average first audio at 0.57 s for Max and 0.62 s for Mini. It is available in ElevenAgents and through an OpenAI-compatible Realtime API, without WebRTC at launch — [ElevenLabs](https://elevenlabs.io/realtime); [ElevenLabs on X](https://x.com/ElevenLabs/status/2112550782063247521); [cellcog](https://cellcog.ai/blog/eleven-realtime/)
- Hume: the EVI API is being retired on Nov 13, 2026, and Hume is reportedly sunsetting its TTS and EVI APIs. An earlier review (August 2026) measured EVI first audio at 350–500 ms — [search summary of futureagi / toolchase / aipedia](https://futureagi.com/blog/best-text-to-speech-providers-2026/); [toolchase](https://toolchase.com/blog/hume-ai-review/). Verify on hume.ai before relying on this.
- Kyutai Moshi and NVIDIA PersonaPlex are open-weight full-duplex options with no hosted API — [getstream](https://getstream.io/blog/speech-apis/). I found no 2026 data on Kyutai Unmute.

**Agent and telephony platform layer**
- Vapi: $0.05/min hosting fee, with STT, LLM, and TTS passed through at cost or bring-your-own keys. Engineering target is p50 below 500 ms and p95 below 800 ms — [morphllm](https://www.morphllm.com/best-ai-voice-agent-platforms); [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- Retell: $0.07–$0.31/min. Includes 20 concurrent calls, with extra concurrency at $8 per call per month. Claims ~600 ms from end of speech to response — [morphllm](https://www.morphllm.com/best-ai-voice-agent-platforms); [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- Bland: $0.14/min all-in with no platform fee, or $0.12/min plus $299/month. Claims 400 ms (homepage, no test method given) — [superdupr](https://superdupr.com/blog/voice-ai-pricing); [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- Synthflow: no public per-minute rate. Enterprise is annual-contract only; third parties cite ~$0.13–$0.20/min on managed tiers (low reliability) — [itechguides](https://www.itechguides.com/7-synthflow-alternatives-to-consider-in-2026-pricing-fit-and-migration/)
- ElevenLabs Agents (ElevenAgents): about $0.08 per extra minute plus LLM. Plans range from Free ($0, 10k credits/month) to Business ($990/month) — [devtoollab](https://devtoollab.com/blog/best-ai-voice-agent-platforms)
- Deepgram Voice Agent: starts at ~$0.075/min (other sources give $0.05–$0.163, or $0.059 pay-as-you-go with your own LLM). Aura-2 TTS costs $30 per 1M characters — [search summary of TTS comparison blogs](https://futureagi.com/blog/best-text-to-speech-providers-2026/)
- Cartesia Line: from $0.06/min, plus a telephony add-on of ~$0.014/min — [same summary](https://gradium.ai/content/best-text-to-speech-apis-2026)
- Twilio ConversationRelay internal test: 491 ms p50 and 713 ms p95 — [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- LiveKit and Pipecat are self-hosted open-source frameworks. In Cekura's agent-layer test they had mean responses of 2.59 s (LiveKit) and 1.97 s (Pipecat) — [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- PolyAI and Air AI: no 2026 data found.

### Inferences
- "Best" depends on the axis. Cartesia, Gemini 3.x Live, and Grok Voice 3.0 lead on human preference plus task success. GPT-Realtime-2 and Grok lead on reasoning and agentic benchmarks. OpenAI's newer reasoning-heavy Realtime-2/2.1 models score lower on preference Elo (~920–933) than GPT-Live-1 (~1027–1037) or even GPT-Realtime-1.5, which suggests that added "thinking" hurts conversational feel.
- Grok Voice 3.0 combines high preference Elo (1059) with the highest task success among top models (94.8%). That makes it one of the strongest value-for-quality S2S options, at $0.08/min.
- Teams planning a new Hume EVI integration should look elsewhere, given the reported retirement.

### Gaps
- PolyAI, Air AI, Sesame API, and Kyutai Unmute: no 2026 data found.
- GPT-Realtime-2.1 pricing and release date are unconfirmed on OpenAI's site.
- The full AA S2S index ranking (beyond the six models named in the text) is only in charts that could not be extracted.

## Q2. Consumer apps: which sounds most human?

### Takeaway
There is no rigorous head-to-head test. Qualitative reviews consistently name Sesame (Maya/Miles) as the most human-sounding. On the arena, Google's Gemini Live models, Grok Voice 3.0, and OpenAI GPT-Live-1 (which now powers ChatGPT Voice) are the strongest measured models behind consumer apps. Claude voice is described as more neutral.

### Cited Findings
- ChatGPT Voice now runs on GPT-Live-1. Free users get GPT-Live-1 mini, and Go, Plus, and Pro users get GPT-Live-1. At launch it did not support video or screen sharing — [OpenAI](https://openai.com/index/introducing-gpt-live/)
- GPT-Live-1.1 rolled out in ChatGPT on Oct 15, 2026. Plus, Pro, and Business users get 1.1; Free and Go users get "GPT-Live-1.1 Quip." It added new voices for six languages; reports disagree on whether there are 9 or 13 new voices — [mixed-news](https://mixed-news.com/en/chatgpt-voice-gpt-live-1-1-new-voices-german-japanese-hindi/); [datanorth](https://datanorth.ai/news/gpt-live-1-1-new-voices)
- Sesame: PCWorld called it "the best I've tested" and the most human-like conversational experience, and said it uses Google's Gemma 4 LLM with custom speech models — [PCWorld](https://www.pcworld.com/article/3151873/sesame-ai-voice-app-is-the-best-ive-tested-thats-what-worries-me.html)
- Sesame's Oct 6, 2026 update brought an updated Conversational Speech Model to four voices (Maya, Miles, Simone, Charlie) and opened the app to everyone on iOS and Android — [artrealmai](https://artrealmai.com/article/sesame-october-update-new-voice-model-ios-android). The App Store listing shows a 4.9/5 rating from ~2K ratings — [App Store](https://apps.apple.com/us/app/sesame-personal-agents/id6756329076)
- Sesame criticism: human-style fillers ("Hmm, let me think") slow down quick factual questions, and roleplay and language support are weak — [WeavAI](https://weavai.app/blog/en/2026/06/14/sesame-ai-review-2026-are-maya-and-miles-human-like/)
- A Reddit user, quoted by Yahoo, called Sesame "about as close to indistinguishable from a human" as they had experienced; the writer found ChatGPT's voice mode stilted by comparison. This predates GPT-Live — [Yahoo Tech](https://tech.yahoo.com/general/articles/compared-sesame-chatgpt-voice-mode-194337945.html)
- Claude voice is described as neutral in tone and better at following instructions, without ChatGPT-style camera vision. Grok's voice is described as casual and personality-forward. Gemini Live is described as good for free casual use. All three descriptions come from low-authority blogs — [beginnersinai](https://beginnersinai.org/ai-voice-modes-compared-2026/); [aisubscriptioncomparison](https://aisubscriptioncomparison.com/features/voice-mode/)
- Vapi runs a "Humanness Index" blind benchmark for TTS humanness — [Vapi Humanness Index](https://humannessindex.vapi.ai/) (contents not fetched)

### Inferences
- For "sounds most like a person" in casual chat, Sesame is the consensus pick. For capability plus naturalness, ChatGPT (GPT-Live-1.1) and Gemini Live are the safer mainstream choices. Grok Voice 3.0's arena showing suggests Grok's app is competitive.

### Gaps
- No independent blind test of the consumer apps themselves (as opposed to their APIs) was found.
- No direct Reddit or HN threads were fetched; sentiment here is secondhand.
- Claude voice's underlying model and its latency in 2026 were not found.

## Q3. Per-platform specs: latency, naturalness, interruptions, emotion, cloning, languages, SIP, pricing, free tiers

### Takeaway
Real end-to-end phone-call latency for managed platforms is about 0.7–1.8 s in independent tests. That is well above vendor claims of 400–600 ms, which usually cover only part of the pipeline. Time to first audio for S2S models ranges from 0.44 s (Deepslate Opal) to ~3 s (Gemini 3.1 Flash Live High). All-in costs cluster at about $0.05–$0.15/min.

### Cited Findings
**Independent latency tests (compiled by Telnyx, a competitor, updated Oct 2026)** — source: [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)

Methods:
- Openbenchmarks: caller-side time to first audio byte, measured from call recordings. ~432 turns per platform, run through Aug 1, 2026, with calls placed from Plivo.
- Cekura v1: 246 calls per provider, updated Sept 29, 2026.
- Tested Media: 500 production calls, Mar 2026.

| Platform | Openbenchmarks median / p95 | Cekura v1 mean | Tested Media median / p95 |
|---|---|---|---|
| Telnyx | 1,296 / 1,856 ms | 1.82 s | — |
| ElevenLabs | 1,424 / 1,768 ms | 1.27 s | — |
| Bland | 1,520 / 2,248 ms | — | 850 / 1,180 ms |
| Vapi | 1,558 / 2,008 ms | 3.08 s | 720 / 1,050 ms |
| Retell | 1,740 / 2,259 ms | 2.21 s | 680 / 920 ms |

- Cekura also measured GPT Realtime at a 1.58 s mean and Gemini Live at 3.05 s.
- Openbenchmarks effective per-minute cost: Telnyx $0.050 (or $0.0722 per minute actually spoken, because of a 60-second billing minimum), ElevenLabs $0.0794, Vapi $0.0836, Retell $0.1341, Bland $0.1408.
- A separate Oct 2026 benchmark found the same order: ElevenLabs p50 1,424 ms, Vapi 1,558 ms, Retell 1,740 ms — [benchlm](https://benchlm.ai/best/voice-ai-agents)
- Vapi in a hands-on review: 700–900 ms with fast providers and 1,200–1,500 ms with slower ones — [Retell blog, a competitor](https://www.retellai.com/blog/vapi-vs-elevenlabs)

**S2S model time to first audio (AA, June 2026)** — source: [AA](https://artificialanalysis.ai/articles/announcing-the-artificial-analysis-speech-to-speech-index)
- Deepslate Opal 0.44 s
- GPT-Realtime-1.5 0.82 s
- Grok Voice Think Fast 1.0 1.25 s
- GPT-Realtime-2 High 2.33 s
- Gemini 3.1 Flash Live High 2.98 s

Cost per hour of input audio: Gemini 3.1 Flash Live $1.50 (Minimal) / $1.75 (High), Grok $3.00, GPT-Realtime-2 High $4.14.

**Latency reliability problems**
- Gemini 3.1 Flash Live preview time to first audio regressed from about 1 s to 9–15 s starting Sept 5, 2026, while 2.5 native audio stayed at 1.9–2.4 s. This is from a developer forum and is anecdotal — [Google AI forum](https://discuss.ai.google.dev/t/gemini-3-1-flash-live-preview-9-15-s-time-to-first-audio-since-2026-09-05-09-00-utc-was-1-s-some-turns-never-answer-reproduced-from-two-projects-two-networks/180918)
- Other forum users report latency rising over long Live API sessions — [Google AI forum](https://discuss.ai.google.dev/t/gemini-live-api-native-audio-response-latency-gradually-increases-during-long-sessions/115508)
- Live API session limits are reportedly 15 minutes for audio-only and 2 minutes for audio plus video — [ai-tldr](https://ai-tldr.dev/models/gemini-3-8-live/)

**TTS component latency**
- Eleven v4 Turbo: ~100 ms median inference per ElevenLabs; ~150 ms time to first speech in third-party tests — [Unite.AI](https://www.unite.ai/elevenlabs-launches-eleven-v4-with-low-latency-turbo-variant/)
- ElevenLabs Flash: ~75 ms (vendor figure, TTS only) — [Telnyx](https://telnyx.com/resources/voice-ai-agents-compared-latency)
- Cartesia Sonic: vendor claims ~40 ms. Independent tests measured 248 ms median for Sonic 3.6 over WebSocket, and a Coval benchmark measured 440 ms (269 ms for Sonic 3.5)
- Coval (Sept 2026): Deepgram Aura-2 at 290 ms and ElevenLabs Flash v2.5 at 185 ms median perceived time to first audio
- Source for the Cartesia and Coval figures: [search summary of TTS blogs](https://texttolab.com/blog/best-tts-for-voice-agents)

**Interruption and turn-taking**
- GPT-Live-1 is full-duplex: it listens while it speaks, which allows natural barge-in and backchannels — [VentureBeat](https://venturebeat.com/technology/openai-launches-gpt-live-a-full-duplex-voice-upgrade-that-lets-chatgpt-talk-more-like-a-person)
- On AA's Full Duplex Bench subset, GPT-Realtime-2 Minimal leads at 96.1% — [AA](https://artificialanalysis.ai/articles/announcing-the-artificial-analysis-speech-to-speech-index)

**Free tiers**
- ElevenLabs: Free plan with 10k credits/month — [devtoollab](https://devtoollab.com/blog/best-ai-voice-agent-platforms)
- ChatGPT Voice is free with GPT-Live-1 mini / 1.1 Quip — [OpenAI](https://openai.com/index/introducing-gpt-live/)
- Sesame's app is open to everyone; whether it is free or paid was not confirmed — [artrealmai](https://artrealmai.com/article/sesame-october-update-new-voice-model-ios-android)

### Inferences
- In practice, budget about 1–1.8 s per turn on phone calls with managed platforms. Sub-second results need tuning: fast endpointing, a co-located STT/LLM/TTS stack, or a fast S2S model.
- Reasoning ("High"/"thinking") settings roughly triple time to first audio (GPT-Realtime-1.5 at 0.82 s vs. GPT-Realtime-2 High at 2.33 s). That tradeoff matters for phone use.

### Gaps
- Voice cloning, supported languages, and SIP specifics per platform were not gathered in detail. ElevenLabs, Vapi, Retell, and Bland generally support SIP/Twilio and cloning, but I have no 2026 citations for this.
- Emotional-expressiveness metrics: none beyond arena Elo.

## Q4. Independent benchmarks and TTS leaderboards; notable 2025–2026 releases

### Takeaway
On Artificial Analysis's TTS arena (Nov 2026), ElevenLabs' Eleven v4 and v4 Turbo (Sept 2026) hold #1 and #2, followed by Alibaba Qwen-Audio-3.1, Cartesia Sonic 3.6, Speechify Simba 3.5, and Google Gemini 3.8 Flash TTS. The top spot changed hands several times during 2026.

### Cited Findings
- AA TTS arena top 20, as fetched on Nov 9, 2026 (Elo, price per 1M characters) — source: [AA TTS leaderboard](https://artificialanalysis.ai/text-to-speech/leaderboard)

| Rank | Model | Elo | $ per 1M chars | Released |
|---|---|---|---|---|
| 1 | Eleven v4 | 1339 | $80 | Sept 2026 |
| 2 | Eleven v4 Turbo | 1335 | $40 | |
| 3 | Qwen-Audio-3.1-TTS-Plus | 1303 | $19.31 | |
| 4 | Cartesia Sonic 3.6 | 1297 | $49 | Aug 2026 |
| 5 | Speechify Simba 3.5 | 1286 | $6.58 | Nov 2026 |
| 6 | Gemini 3.8 Flash TTS | 1283 | $16.49 | |
| 7 | Fish Audio Drama 3 | 1275 | | |
| 8 | Smallest.ai Lightning V3.1 Pro | 1273 | | |
| 10 | Inworld Realtime TTS-2 | 1268 | $20.83 | |
| 16 | Mistral Voxtral 3 TTS | 1217 | | |
| 18 | ElevenLabs v3 Conversational | 1216 | | |

  Lower down the same leaderboard:
  - OpenAI GPT-Realtime-2 voice: #58 (1074, $191.56)
  - OpenAI TTS-1 HD: #45
  - Hume Octave 2: #68 (1060)
  - MiniMax Speech 2.8 HD: #28 (1175)
  - Sesame and Kyutai: not listed
- Earlier 2026 snapshots: Alibaba Fun-Realtime-TTS took #1 on June 3, 2026, with only 24 Elo points separating the top five — [AA article](https://artificialanalysis.ai/articles/fun-realtime-tts-new-text-to-speech-model-topping-artificial-analysis-leaderboard). Qwen Audio 3.0 TTS Plus also topped the rankings at one point — [The Decoder](https://the-decoder.com/alibabas-qwen-audio-3-0-tts-plus-tops-the-competition-in-the-text-to-speech-rankings/?cmpscreencustom=1)
- AA launched multilingual TTS arenas covering 9 languages — [AA on X](https://x.com/ArtificialAnlys/status/2102490340678856997)

**Release timeline**
- Dec 2025: Grok Voice Agent API, $0.05/min — [xAI](https://x.ai/news/grok-voice-agent-api)
- Mar 26, 2026: Gemini 3.1 Flash Live — [Google](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-1-flash-live/)
- May 7, 2026: GPT-Realtime-2 — [Handy AI](https://handyai.substack.com/p/model-drop-gpt-realtime-2)
- June 23, 2026: AA Speech to Speech Index — [AA](https://artificialanalysis.ai/articles/announcing-the-artificial-analysis-speech-to-speech-index)
- July 8, 2026: GPT-Live-1 in ChatGPT, replacing Advanced Voice Mode; API on Sept 10 — [OpenAI](https://openai.com/index/introducing-gpt-live/)
- Sept 2026: Gemini 3.8 Live becomes the default Live model; the Sept 15 GA date is unverified — [Google docs](https://ai.google.dev/gemini-api/docs/models)
- Sept 28, 2026: Eleven v4 and v4 Turbo — [Unite.AI](https://www.unite.ai/elevenlabs-launches-eleven-v4-with-low-latency-turbo-variant/)
- Oct 6, 2026: Sesame's new CSM and full iOS/Android availability — [artrealmai](https://artrealmai.com/article/sesame-october-update-new-voice-model-ios-android)
- Oct 14, 2026: Grok Voice 3.0, $0.08/min — [Technobezz](https://www.technobezz.com/news/xai-launches-grok-voice-per-minute)
- Oct 15, 2026: GPT-Live-1.1 in ChatGPT — [mixed-news](https://mixed-news.com/en/chatgpt-voice-gpt-live-1-1-new-voices-german-japanese-hindi/)
- Oct 20, 2026: ElevenLabs Eleven Realtime S2S (v1 Mini/Max), rollout completed in early Nov — [ElevenLabs](https://elevenlabs.io/realtime); [Releasebot](https://releasebot.io/updates/eleven-labs)
- Nov 13, 2026: Hume EVI API retirement (reported) — [toolchase](https://toolchase.com/blog/hume-ai-review/)

### Inferences
- If the priority is raw voice quality inside a cascaded agent, ElevenLabs v4 Turbo (top Elo, ~100–150 ms) and Cartesia Sonic 3.6 are the leading TTS choices in Nov 2026. Speechify Simba 3.5 and Qwen 3.1 offer near-top quality at a fraction of the price.
- Native S2S voices from OpenAI rank low on pure TTS naturalness (GPT-Realtime-2 at #58), even though OpenAI's conversational products score well on the S2S arena.

### Gaps
- No HN or Reddit threads were directly fetched.
- The Vapi Humanness Index results were not retrieved.
- Some release dates come from aggregators and are flagged above.
