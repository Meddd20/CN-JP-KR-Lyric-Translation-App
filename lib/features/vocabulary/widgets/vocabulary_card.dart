import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class VocabularyCard extends StatelessWidget {
  final ScriptLanguage language;
  final String surface;
  final String reading;
  final String meaning;
  final void Function() navigateToSong;
  final String songReference;

  const VocabularyCard({
    super.key,
    required this.language,
    required this.surface,
    required this.reading,
    required this.meaning,
    required this.navigateToSong,
    required this.songReference,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: Container(
        width: double.infinity,
        color: AppColors.surface,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Opacity(
                    opacity: 0.1,
                    child: Text(
                      surface,
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 100,
                        color: languageColor(language),
                        letterSpacing: -5,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        surface,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reading,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Text(
                          meaning,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textPrimary,
                              ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: navigateToSong,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColors.textMuted,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                songReference,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
