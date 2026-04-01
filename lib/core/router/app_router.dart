import 'package:cnjpkr_song_lyric_trnslt/core/router/main_shell.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/history_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/home_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/lyric_detail_page.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/lyric/ui/vocabulary_page.dart';
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
    )
  ],
);
