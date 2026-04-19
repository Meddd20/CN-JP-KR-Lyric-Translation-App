import 'package:Versalex/core/models/song_lyric.dart';
import 'package:Versalex/core/repositories/lyric_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lyric_notifier.g.dart';

@riverpod
class LyricNotifier extends _$LyricNotifier {
  @override
  AsyncValue<SongLyric?> build() => const AsyncValue.data(null);

  Future<void> transcribe(String youtubeURL) async {
    if (youtubeURL.trim().isEmpty) {
      state = AsyncValue.error("URL cannot be empty", StackTrace.current);
      return;
    }

    final isYoutube = youtubeURL.contains("youtube.com") || youtubeURL.contains("youtu.be");
    if (!isYoutube) {
      state = AsyncValue.error("Url must be a youtube link", StackTrace.current);
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(lyricRepositoryProvider).getLyric(youtubeURL));

    if (state.hasValue) {
      ref.invalidate(recentHistoryProvider);
    }
  }
}
