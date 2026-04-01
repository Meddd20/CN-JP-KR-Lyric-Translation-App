import 'dart:ui';

import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/history')) return 1;
    if (location.startsWith('/vocabulary')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                selectedIndex: _currentIndex(context),
                indicatorColor: AppColors.primary.withValues(alpha: 0.2),
                onDestinationSelected: (index) {
                  switch (index) {
                    case 0:
                      context.go('/');
                      break;
                    case 1:
                      context.go('/history');
                      break;
                    case 2:
                      context.go('/vocabulary');
                      break;
                  }
                },
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(
                      Icons.home,
                      color: AppColors.primary,
                    ),
                    label: "Home",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.history_outlined),
                    selectedIcon: Icon(
                      Icons.history,
                      color: AppColors.primary,
                    ),
                    label: "History",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.bookmark_outline),
                    selectedIcon: Icon(
                      Icons.bookmark,
                      color: AppColors.primary,
                    ),
                    label: "Vocabulary",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class _BottomNav extends StatelessWidget {
//   final int currentIndex;
//   const _BottomNav({required this.currentIndex});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         border: Border(
//           top: BorderSide(
//             color: AppColors.surfaceHigh,
//             width: 1,
//           ),
//         ),
//       ),
//       child: ,
//     );
//   }
// }
