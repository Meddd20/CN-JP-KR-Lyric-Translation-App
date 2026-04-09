import 'dart:convert';

import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gemini_services.g.dart';

class GeminiService {
  final String _apiKey;

  static const _baseURL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent";

  GeminiService({required String apiKey}) : _apiKey = apiKey;

  Future<SongLyric> transcribeLyric(String youtubeURL) async {
    final response = await http.post(
      Uri.parse("$_baseURL?key=$_apiKey"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'contents': [
          {
            "parts": [
              {
                "fileData": {"fileUri": youtubeURL},
              },
              {
                "text": """
                  You are an expert linguist and content engineer for a language learning music app.
                  Your task is to transcribe and analyze song lyrics from the provided YouTube video.

                  SUPPORTED LANGUAGES: Mandarin (zh), Japanese (ja), Korean (ko) ONLY.
                  If the song is not in these languages, respond: "Error: Unsupported language."

                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  CRITICAL — COMPLETENESS (HIGHEST PRIORITY)
                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  - Transcribe EVERY line from start to finish, no exceptions
                  - Do NOT stop early under any circumstance
                  - Do NOT skip, summarize, or use placeholders for repeated sections
                  - If chorus repeats 3 times → generate it 3 times with unique timestamps
                  - A typical song has 30-60 lines — verify you reached the end before finishing
                  - If you are approaching your output limit, prioritize completeness over detail in chunks

                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  CRITICAL — OUTPUT FORMAT
                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  - Output ONLY raw JSON — no markdown, no backticks, no explanation
                  - First character MUST be { and last character MUST be }
                  - All JSON keys must be exactly as specified — no variations
                  - All string values must be properly escaped

                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  FIELD RULES
                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  timestamps:
                  - start_time and end_time MUST be Double in seconds (e.g. 12.45)
                  - Estimate as accurately as possible from the audio
                  - Each line must have unique timestamps — never duplicate

                  translation:
                  - "en": translate to natural, meaningful English — not literal word-for-word
                  - "id": translate from your English result to natural Indonesian
                  - Never leave translation empty
                  - Never use romanization or original script as translation

                  chunks:
                  - Break surface_text into the smallest meaningful units
                    - Mandarin (zh): per character or per word (e.g. 烟花 as one chunk, not 烟+花)
                    - Japanese (ja): per word/morpheme (e.g. 吹いて as one chunk)
                    - Korean (ko): per word/morpheme (e.g. 사랑해 as one chunk)
                  - EVERY chunk needs: surface, reading, meaning_en, meaning_id, is_keyword
                    - meaning_en: meaning in English
                    - meaning_id: meaning in Indonesian
                  - is_keyword rules:
                    - is_keyword: TRUE for ALL content words — nouns, verbs, adjectives, adverbs, idioms, including basic function words
                    - is_keyword: False for all punctuation/space chunks

                  reading:
                  - Mandarin: Pinyin with tone marks (e.g. wǒ, nǐ, tā)
                  - Japanese: Hiragana, space-separated segments
                  - Korean: Revised Romanization
                  - English or other latin script words: reading = same as surface (no phonetic needed)
                  - Mixed language chunks: apply reading rules based on the script of that specific chunk,
                    not the primary language of the song
                  
                  mixed language:
                  - If a line contains words from another language (English, etc), include them as-is in surface_text
                  - For non-primary language words in chunks:
                    - surface: the word as-is (e.g. "cuz", "I love you")
                    - reading: same as surface (no phonetic needed)
                    - meaning: translate to id and en as normal
                    - is_keyword: true if it's a content word
                  - Do NOT translate or romanize non-primary language words in surface_text
                  - reading_text: for non-primary language segments, use the word as-is

                  global_glossary:
                  - Include ALL unique content words from the entire song — nouns, verbs, adjectives, adverbs, idioms
                  - Exclude basic function words
                  - No duplicates — each unique surface form appears once
                  - Both meaning_en and meaning_id required

                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  JSON SCHEMA
                  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                  {
                    "metadata": {
                      "title": "String",
                      "artist": "String",
                      "script_language": "zh | ja | ko",
                      "difficulty": "Beginner | Intermediate | Advanced",
                      "tags": ["String"]
                    },
                    "global_glossary": [
                      {
                        "surface": "String",
                        "reading": "String",
                        "meaning": { "id": "String", "en": "String" }
                      }
                    ],
                    "lyrics": [
                      {
                        "line_id": "l1",
                        "start_time": 0.0,
                        "end_time": 0.0,
                        "surface_text": "String",
                        "reading_text": "String",
                        "translation": { "id": "String", "en": "String" },
                        "chunks": [
                          {
                            "surface": "String",
                            "reading": "String",
                            "meaning": { "id": "String", "en": "String" },
                            "is_keyword": false
                          }
                        ]
                      }
                    ]
                  }
                """,
              },
            ],
          },
        ],
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed: ${response.statusCode} - ${response.body}");
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    final finishReason = data["candidates"][0]["finishReason"] as String;
    if (finishReason == "RECITATION") {
      throw Exception("Blocked by gemini due to copyright");
    }

    if (finishReason == "MAX_TOKENS") {
      throw Exception("Lyric were cut off because it was too long");
    }

    final text = data["candidates"][0]["content"]["parts"][0]["text"] as String;

    final songJson = jsonDecode(text) as Map<String, dynamic>;

    return SongLyric.fromJson(songJson);
  }
}

@riverpod
GeminiService geminiService(Ref ref) {
  const apiKey = String.fromEnvironment("GEMINI_API_KEY");
  return GeminiService(apiKey: apiKey);
}
