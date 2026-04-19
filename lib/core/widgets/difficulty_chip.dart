import 'package:Versalex/core/enums/difficulty.dart';
import 'package:Versalex/core/helpers/difficulty_color.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DifficultyChip extends StatelessWidget {
  final Difficulty difficulty;

  const DifficultyChip({
    super.key,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: difficultyColor(difficulty),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        difficulty.name.toUpperCase(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textPrimary,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
