import 'dart:convert';

import 'package:cnjpkr_song_lyric_trnslt/core/helpers/system_prompt.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_transcript_api/youtube_transcript_api.dart';

part 'gemini_services.g.dart';

class GeminiService {
  static const _baseURL = "https://api.groq.com/openai/v1/chat/completions";
  static const _cjkCode = ['ja', 'ko', 'zh-Hans', 'zh-Hant'];
  final api = YouTubeTranscriptApi();
  final jsonFormatter = JsonFormatter(pretty: true);

  Future<SongLyric> transcribeLyric(String youtubeURL) async {
    var transcriptJson = <Map<String, dynamic>>[];
    try {
      final videoId = YoutubePlayer.convertUrlToId(youtubeURL) ?? "";
      if (videoId.isEmpty) throw Exception("Invalid YouTube URL");

      final transcriptList = await api.list(videoId);
      final originalTranscript = transcriptList.firstWhere((t) => !t.isGenerated, orElse: () => transcriptList.first);

      final isCJK = _cjkCode.any((code) => originalTranscript.languageCode.startsWith(code));

      if (isCJK) {
        final transcript = await api.fetch(videoId, languages: [originalTranscript.languageCode]);
        transcriptJson = transcript
            .map((snippet) => {"text": snippet.text, "start": snippet.start, "duration": snippet.duration})
            .toList();
      }
    } finally {
      api.dispose();
    }

    final userInput = jsonEncode({
      "youtube_url": youtubeURL,
      "transcript": transcriptJson.take(10).toList(),
    });

    final response = await http.post(
      Uri.parse(_baseURL),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${dotenv.env["GROQ_API_KEY"]}",
      },
      body: jsonEncode({
        "model": "llama-3.3-70b-versatile",
        "temperature": 0.2,
        "max_tokens": 8192,
        "messages": [
          {"role": "user", "content": "$systemPrompt\n\nINPUT:\n$userInput"}
        ],
      }),
    );

    final data = jsonDecode(response.body);
    var rawText = data['choices'][0]['message']['content'] as String;
    rawText = rawText.replaceAll('```json', '').replaceAll('```', '').trim();

    try {
      final songJson = jsonDecode(rawText);
      return SongLyric.fromJson(songJson);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
GeminiService geminiService(Ref ref) {
  return GeminiService();
}
