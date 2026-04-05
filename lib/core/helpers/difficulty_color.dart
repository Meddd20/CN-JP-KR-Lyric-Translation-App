import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/animation.dart';

import '../enums/difficulty.dart';

Color difficultyColor(Difficulty difficulty) {
  switch (difficulty) {
    case Difficulty.beginner:
      return AppColors.difficultyBeginner;
    case Difficulty.intermediate:
      return AppColors.difficultyIntermediate;
    case Difficulty.advanced:
      return AppColors.difficultyAdvanced;
  }
}
