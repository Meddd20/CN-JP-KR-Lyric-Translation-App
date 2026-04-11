import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FilterByLanguageChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function() onTap;

  const FilterByLanguageChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected ? AppColors.primary : AppColors.surface,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected ? AppColors.textPrimary : AppColors.textMuted,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
