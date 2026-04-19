// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LanguageProvider)
final languageProviderProvider = LanguageProviderProvider._();

final class LanguageProviderProvider
    extends $NotifierProvider<LanguageProvider, AppLanguage> {
  LanguageProviderProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'languageProviderProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$languageProviderHash();

  @$internal
  @override
  LanguageProvider create() => LanguageProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$languageProviderHash() => r'df8f29e7aa488610f438d361eb236ed479b416f8';

abstract class _$LanguageProvider extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AppLanguage, AppLanguage>, AppLanguage, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
