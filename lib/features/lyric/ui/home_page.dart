import 'package:Versalex/core/enums/app_languages.dart';
import 'package:Versalex/core/l10n/app_localizations.dart';
import 'package:Versalex/core/providers/language_provider.dart';
import 'package:Versalex/core/repositories/lyric_repository.dart';
import 'package:Versalex/core/theme/app_theme.dart';
import 'package:Versalex/features/lyric/logic/lyric_notifier.dart';
import 'package:Versalex/features/lyric/ui/widgets/generate_button.dart';
import 'package:Versalex/features/lyric/ui/widgets/track_card.dart';
import 'package:Versalex/features/lyric/ui/widgets/url_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _urlController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final lyricState = ref.watch(lyricProvider);
    final recentHistory = ref.watch(recentHistoryProvider);
    final language = ref.watch(languageProviderProvider);
    final l10n = AppLocalizations(language);

    ref.listen(lyricProvider, (previous, next) {
      next.whenOrNull(data: (lyric) {
        if (lyric != null) {
          _urlController.clear();
          context.push('/lyric/detail', extra: lyric);
        }
      }, error: (e, _) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w600),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                _showLanguagePicker();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.surfaceHigh, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.language, size: 16, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      language.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.transcribeYourSongs,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(l10n.chineseJapaneseKorean,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              UrlTextfield(
                urlController: _urlController,
                suffixIconOnpressed: () async {
                  if (_urlController.text.isEmpty) {
                    final clipboard = await Clipboard.getData(Clipboard.kTextPlain);
                    if (clipboard?.text != null) {
                      _urlController.text = clipboard!.text!;
                      ref.read(lyricProvider.notifier).transcribe(_urlController.text);
                    }
                  } else {
                    _urlController.clear();
                  }
                },
                isEmpty: _urlController.text.isEmpty,
              ),
              const SizedBox(height: 16),
              GenerateButton(
                isLoading: lyricState.isLoading,
                label: l10n.generate,
                onPressed: () {
                  ref.read(lyricProvider.notifier).transcribe(_urlController.text);
                },
              ),
              const SizedBox(height: 30),
              recentHistory.when(
                error: (e, _) => const SizedBox(),
                loading: () => const SizedBox(),
                data: (lyrics) {
                  if (lyrics.isEmpty) return const SizedBox();

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.recentSessions,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          TextButton(
                            onPressed: () {
                              context.push('/history');
                            },
                            child: Text(
                              l10n.viewAll,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lyrics.length,
                          itemBuilder: (context, index) {
                            return TrackCard(
                              language: lyrics[index].metadata.scriptLanguage,
                              title: lyrics[index].metadata.title,
                              artist: lyrics[index].metadata.artist,
                              difficulty: lyrics[index].metadata.difficulty,
                              onTap: () => context.push('/lyric/detail', extra: lyrics[index]),
                              youtubeURL: lyrics[index].youtubeURL,
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Consumer(builder: (context, ref, child) {
          final language = ref.watch(languageProviderProvider);
          final l10n = AppLocalizations(language);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.translationLanguage,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      l10n.chooseHowTranslationsAreShown,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textMuted,
                          ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0.1,
                color: AppColors.surfaceHigh,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildLanguageOption(
                      context: context,
                      ref: ref,
                      language: AppLanguage.id,
                      selected: language,
                      flag: '🇮🇩',
                      title: 'Indonesia',
                      subtitle: 'Terjemahan dalam Bahasa Indonesia',
                    ),
                    const SizedBox(height: 10),
                    _buildLanguageOption(
                      context: context,
                      ref: ref,
                      language: AppLanguage.en,
                      selected: language,
                      flag: 'EN',
                      title: 'English',
                      subtitle: 'Show translations in English',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          );
        });
      },
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required WidgetRef ref,
    required AppLanguage language,
    required AppLanguage selected,
    required String flag,
    required String title,
    required String subtitle,
  }) {
    final isSelected = language == selected;
    return GestureDetector(
      onTap: () {
        ref.read(languageProviderProvider.notifier).setLanguage(language);
        context.pop();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 1.5)
              : Border.all(color: AppColors.surfaceHigh, width: 1),
        ),
        child: Row(
          children: [
            // flag atau badge
            flag.length > 2
                ? Text(flag, style: const TextStyle(fontSize: 24))
                : Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceHigh,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        flag,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.textMuted,
                  width: 1.5,
                ),
              ),
              child: isSelected ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
            ),
          ],
        ),
      ),
    );
  }
}
