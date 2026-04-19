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
              onTap: () {},
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
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
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
}
