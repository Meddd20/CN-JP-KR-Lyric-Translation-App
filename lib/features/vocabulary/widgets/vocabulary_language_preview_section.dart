import 'package:cnjpkr_song_lyric_trnslt/core/enums/script_language.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/helpers/language_color.dart';
import 'package:cnjpkr_song_lyric_trnslt/core/models/saved_keyword.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/vocabulary/widgets/language_header.dart';
import 'package:cnjpkr_song_lyric_trnslt/features/vocabulary/widgets/vocabulary_preview_card.dart';
import 'package:flutter/material.dart';

class VocabularyLanguagePreviewSection extends StatelessWidget {
  final ScriptLanguage language;
  final void Function() navigateToVocabDetail;
  final List<SavedKeyword> keywords;

  const VocabularyLanguagePreviewSection({
    super.key,
    required this.language,
    required this.navigateToVocabDetail,
    required this.keywords,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LanguageHeader(
          language: language.displayName,
          languageColor: languageColor(language),
          navigateVocabDetail: navigateToVocabDetail,
        ),
        SizedBox(height: 6),
        SizedBox(
          height: 260,
          child: ListView.builder(
            itemCount: keywords.take(5).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: VocabularyPreviewCard(
                  surface: keywords[index].surface,
                  reading: keywords[index].reading,
                  meaning: keywords[index].meaningEn,
                  languageColor: languageColor(language),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
