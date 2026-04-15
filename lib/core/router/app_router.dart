import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/song_lyric.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/router/main_shell.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/history_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/home_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/lyric_detail_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/vocabulary/vocabulary_detail_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/vocabulary/vocabulary_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const HistoryPage(),
        ),
        GoRoute(
          path: '/vocabulary',
          builder: (context, state) => const VocabularyPage(),
        )
      ],
    ),
    GoRoute(
      path: '/lyric/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return LyricDetailPage(
          lyricId: id,
        );
      },
    ),
    GoRoute(
      path: '/lyric/detail',
      builder: (context, state) {
        final lyric = state.extra as SongLyric?;
        return LyricDetailPage(songLyric: lyric);
      },
    ),
    GoRoute(
      path: '/vocabulary/:language',
      builder: (context, state) {
        final lang = state.pathParameters['language']!;
        final language = ScriptLanguage.values.byName(lang);
        return VocabularyDetailPage(language: language);
      },
    )
  ],
);
