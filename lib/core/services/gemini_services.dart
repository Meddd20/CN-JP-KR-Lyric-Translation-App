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
                  - Break surface_text into smallest meaningful units (per word or per character for zh)
                  - Every chunk needs: surface, reading, meaning (in English), is_keyword
                  - is_keyword: true ONLY if surface exists in global_glossary

                  reading:
                  - Mandarin: Pinyin with tone marks (e.g. wǒ, nǐ, tā)
                  - Japanese: Hiragana, space-separated segments
                  - Korean: Revised Romanization

                  global_glossary:
                  - Include only high-value vocabulary — idioms, key phrases, important words
                  - No duplicates
                  - is_keyword in chunks must match entries here exactly

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
                            "meaning": "String",
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
