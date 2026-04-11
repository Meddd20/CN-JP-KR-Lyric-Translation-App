import 'package:cached_network_image/cached_network_image.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/difficulty.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/difficulty_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/get_youtube_id.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_flag.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TrackCard extends StatelessWidget {
  final ScriptLanguage language;
  final String title;
  final String artist;
  final Difficulty difficulty;
  final void Function() onTap;
  final String youtubeURL;

  const TrackCard({
    super.key,
    required this.language,
    required this.title,
    required this.artist,
    required this.difficulty,
    required this.onTap,
    required this.youtubeURL,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: getYoutubeThumbnail(youtubeURL),
                width: 160,
                height: double.infinity,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => CachedNetworkImage(
                  imageUrl: getYoutubeThumbnailFallback(youtubeURL),
                  width: 160,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.surface,
                    child: const Icon(Icons.music_note, color: AppColors.textMuted),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            languageFlag(language),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            language.name.toUpperCase(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Expanded(
                    child: Center(
                      child: Text(
                        title[0],
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    artist,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration:
                        BoxDecoration(color: difficultyColor(difficulty), borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      difficulty.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
