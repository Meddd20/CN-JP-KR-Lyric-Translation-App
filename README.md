![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%3E%3D3.1.3-0175C2?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)

# Versalex

Learning Mandarin, Japanese, or Korean from flashcards is tedious. Songs are not.
Versalex turns any YouTube music video into a structured language lesson. Paste a URL,
get a full lyric breakdown with readings, translations, and vocabulary you can save and review later.

Built as a personal project by someone who actually uses it to study CJK music.

---

## Demo

> _Demo GIF coming soon. Flow: paste YouTube URL → lyric breakdown appears → long-press line → save vocabulary word._
>
> _In the meantime, see the Screenshots section below._

---

## Screenshots

> _Screenshots coming soon. UI is functional, visual polish in progress._

---

## Features

### Lyric Analysis Pipeline
Paste a YouTube URL and the app extracts the video's subtitle track, sends it to an LLM,
and returns every line annotated with:
- **Surface text** (original script)
- **Reading** (pinyin for Mandarin, furigana for Japanese, romanization for Korean)
- **Translation** in both English and Indonesian
- **Chunks**, meaningful phrase units each with their own bilingual gloss

### Phrase-Level Deep Dives
**Long-press any lyric line** to open a phrase analyzer sheet. Individual words surface
as tappable vocabulary cards. Save the ones you want to remember with one tap.

### Per-Language Vocabulary Collection
Every saved word lands in a language-specific glossary. The vocabulary page supports:
- Sort by date saved or alphabetical
- Search, including **pinyin without tone marks** (so `ni` matches `nǐ` and `nī`)
- Swipe-to-delete

### Song Glossary
Each song also carries a **deduplicated global word list** built automatically from its chunks,
useful for previewing a song's vocabulary load before you listen.

### History
All generated songs are stored locally. Revisit any of them offline, re-watch the video
with the embedded player, or delete entries (which cascades to saved vocabulary).

### Bilingual UI
The entire interface is available in **English and Indonesian**, implemented via a custom
`AppLocalizations` class. Language preference is persisted across sessions.

---

## Tech Stack & Architecture

| Layer | Choice | Why |
|---|---|---|
| UI | Flutter | Cross-platform, fast iteration, rich widget ecosystem |
| State | Riverpod | Compile-time safety, testable providers, no `BuildContext` threading |
| Database | Isar | Embedded NoSQL, zero-config, fast queries, works great with Dart |
| AI | Groq (llama-3.3-70b-versatile) | Fast inference, generous context window for transcript+prompt |
| Navigation | GoRouter | Declarative routes, deep link support, passes `extra` for complex objects |
| Models | Freezed + json_serializable | Immutable, union-typed, boilerplate-free serialization |

### Folder Structure

```
lib/
├── core/
│   ├── databases/          # Isar setup and entity models
│   ├── enums/              # ScriptLanguage, VocabSortBy, etc.
│   ├── helpers/            # Utilities (YouTube ID, tone normalization, system prompt)
│   ├── l10n/               # AppLocalizations (EN + ID)
│   ├── models/             # Freezed domain models (SongLyric, Chunk, SavedKeyword...)
│   ├── providers/          # Shared providers (language preference, SharedPreferences)
│   ├── repositories/       # LyricRepository, SavedKeywordRepository
│   ├── router/             # GoRouter config and MainShell
│   ├── services/           # GroqService (AI + transcript pipeline)
│   ├── theme/              # AppTheme
│   └── widgets/            # Shared UI components
└── features/
    ├── lyric/
    │   ├── logic/          # LyricNotifier (Riverpod state)
    │   └── ui/             # HomePage, HistoryPage, LyricDetailPage, widgets
    └── vocabulary/
        ├── ui/             # VocabularyPage, VocabularyDetailPage
        └── widgets/        # LanguageHeader, VocabularyCard, PreviewSection
```

The **repository pattern** (`LyricRepository`, `SavedKeywordRepository`) sits between
Riverpod providers and Isar, keeping business logic out of widgets and making the data
layer independently testable.

The AI pipeline in `GeminiService` pre-fetches the YouTube transcript, constructs a
structured prompt, and parses the LLM response into typed `SongLyric` / `Chunk` models
via `json_serializable`. The class name is a leftover from an earlier Gemini prototype;
the active backend targets the Groq API.

---

## Getting Started

### Prerequisites
- Flutter SDK `>=3.1.3`
- A [Groq API key](https://console.groq.com) (free tier available)

### Setup

```bash
git clone https://github.com/your-username/versalex.git
cd versalex
flutter pub get
```

Create a `.env` file in the project root:

```
GROQ_API_KEY=your_key_here
```

Then run:

```bash
flutter run
```

> **Note:** The app currently runs on **mock lyric data** by default (see Known Limitations).
> To enable live AI processing, uncomment the live call block in `GeminiService` and ensure your API key
> has sufficient TPM quota.

---

## Known Limitations & Roadmap

### Current Limitations

- **AI is mocked.** The full pipeline (transcript extraction, LLM prompt, structured response
  parsing) is implemented end-to-end, but live calls hit Groq's free-tier rate limit because the prompt
  is large. The mock returns realistic fixture data so every other feature works normally.
  A paid key or a batched/chunked prompt strategy would fix this.

- **Subtitle availability is YouTube's problem.** Not every video has CJK subtitles, and
  auto-generated captions vary in quality. The app surfaces an error when no usable transcript
  is found.

- **LRClib was explored and dropped.** The lyrics database has solid English and Latin-script
  coverage but inconsistent CJK data, not reliable enough for the core use case.

### Roadmap

- **Reliable lyric sourcing.** YouTube subtitles are inconsistent. The next step is integrating
  a dedicated lyrics API or database so the AI receives accurate source text instead of
  guessing, which reduces hallucination and improves chunk quality significantly.

- **Lyric sync.** Detect the video's current playback position and highlight the active
  lyric line in real time, karaoke-style.

- **Backend and shared library.** Right now everything is local. A lightweight backend would
  let users search lyrics that have already been generated by others, avoiding redundant
  AI calls for the same song.

- **Beyond CJK.** CJK was the starting point because it's what I personally listen to and
  struggle to understand. The architecture already supports additional languages, so expanding
  is mostly a prompt and UI concern.

---

## What This Project Taught Me

Building Versalex forced me to think about **the full data lifecycle in a mobile app**:
an external API call that produces unstructured text, a parsing layer that shapes it into
typed domain models, a local database that persists and relates those models, and a UI
that stays reactive to all of it without leaking state across features.

Working with Riverpod's provider graph at scale, especially managing cascading deletes,
cross-feature providers, and async state, gave me a much clearer mental model of
unidirectional data flow than any tutorial had.

The rate-limit wall I hit with Groq was frustrating but useful. It pushed me to design
the mock layer carefully enough that the rest of the app is fully demonstrable, which is
a more honest portfolio outcome than quietly hiding an integration that doesn't work.
