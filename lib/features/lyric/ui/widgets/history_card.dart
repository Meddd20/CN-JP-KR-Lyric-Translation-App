import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:Versalex/core/enums/difficulty.dart';
import 'package:Versalex/core/enums/script_language.dart';
import 'package:Versalex/core/helpers/date_converter.dart';
import 'package:Versalex/core/helpers/difficulty_color.dart';
import 'package:Versalex/core/helpers/get_youtube_id.dart';
import 'package:Versalex/core/helpers/language_flag.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String youtubeURL;
  final ScriptLanguage language;
  final String title;
  final String artist;
  final Difficulty difficulty;
  final DateTime dateTime;
  final void Function() onTap;

  const HistoryCard({
    super.key,
    required this.youtubeURL,
    required this.language,
    required this.title,
    required this.artist,
    required this.difficulty,
    required this.dateTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CachedNetworkImage(
                        imageUrl: getYoutubeThumbnail(youtubeURL),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        errorWidget: (context, url, error) => CachedNetworkImage(
                          imageUrl: getYoutubeThumbnailFallback(youtubeURL),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.surface,
                            child: const Icon(Icons.music_note, color: AppColors.textMuted),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: CachedNetworkImage(
                          imageUrl: getYoutubeThumbnail(youtubeURL),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          errorWidget: (context, url, error) => CachedNetworkImage(
                            imageUrl: getYoutubeThumbnailFallback(youtubeURL),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            errorWidget: (context, url, error) => Container(
                              color: AppColors.surface,
                              child: const Icon(Icons.music_note, color: AppColors.textMuted),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    title,
                                    style: Theme.of(context).textTheme.titleLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  languageFlag(language),
                                ),
                              ],
                            ),
                            Text(
                              artist,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
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
                                ),
                                Text(
                                  DateHelper.formatHistoryDate(dateTime),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600, shadows: [
                                    Shadow(
                                      color: Colors.black.withValues(alpha: 0.5),
                                      offset: const Offset(1, 1),
                                      blurRadius: 4,
                                    )
                                  ]),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
