import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LanguageHeader extends StatelessWidget {
  final String language;
  final Color languageColor;
  final void Function() navigateVocabDetail;
  final String viewAllLabel;

  const LanguageHeader({
    super.key,
    required this.language,
    required this.languageColor,
    required this.navigateVocabDetail,
    this.viewAllLabel = 'View All',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 4,
          decoration: BoxDecoration(
            color: languageColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          language,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(),
        TextButton(
          onPressed: navigateVocabDetail,
          child: Row(
            children: [
              Text(
                viewAllLabel,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textMuted,
              )
            ],
          ),
        )
      ],
    );
  }
}
