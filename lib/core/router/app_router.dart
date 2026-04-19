import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/models/song_lyric.dart';
import 'package:Versalex/core/router/main_shell.dart';
import 'package:Versalex/features/lyric/ui/history_page.dart';
import 'package:Versalex/features/lyric/ui/home_page.dart';
import 'package:Versalex/features/lyric/ui/lyric_detail_page.dart';
import 'package:Versalex/features/vocabulary/vocabulary_detail_page.dart';
import 'package:Versalex/features/vocabulary/vocabulary_page.dart';
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
      path: '/lyric/detail',
      builder: (context, state) {
        final lyric = state.extra as SongLyric?;
        return LyricDetailPage(songLyric: lyric);
      },
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
      path: '/vocabulary/:language',
      builder: (context, state) {
        final lang = state.pathParameters['language']!;
        final language = ScriptLanguage.values.byName(lang);
        return VocabularyDetailPage(language: language);
      },
    )
  ],
);
