import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class VocabularyPreviewCard extends StatelessWidget {
  final String surface;
  final String reading;
  final String meaning;
  final Color languageColor;

  const VocabularyPreviewCard({
    super.key,
    required this.surface,
    required this.reading,
    required this.meaning,
    required this.languageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: SizedBox(
              width: 220 * 0.8,
              child: Opacity(
                opacity: 0.1,
                child: Text(
                  surface,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontSize: 100,
                    color: languageColor,
                    letterSpacing: -5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surface,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    reading,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: languageColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    meaning,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
