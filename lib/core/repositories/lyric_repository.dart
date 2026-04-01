import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/services/gemini_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_repository.g.dart';

class LyricRepository {
  final GeminiService _service;
  LyricRepository(this._service);

  Future<SongLyric> getLyric(String youtubeURL) {
    return _service.transcribeLyric(youtubeURL);
  }
}

@riverpod
LyricRepository lyricRepository(Ref ref) {
  return LyricRepository(ref.watch(geminiServiceProvider));
}
