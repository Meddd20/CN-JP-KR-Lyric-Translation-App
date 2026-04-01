import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/repositories/lyric_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_notifier.g.dart';

@riverpod
class LyricNotifier extends _$LyricNotifier {
  @override
  AsyncValue<SongLyric?> build() => const AsyncValue.data(null);

  Future<void> transcribe(String youtubeURL) async {
    if (youtubeURL.trim().isEmpty) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(lyricRepositoryProvider).getLyric(youtubeURL));
  }
}
