// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_keyword_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savedKeywordRepository)
final savedKeywordRepositoryProvider = SavedKeywordRepositoryProvider._();

final class SavedKeywordRepositoryProvider extends $FunctionalProvider<
    SavedKeywordRepository,
    SavedKeywordRepository,
    SavedKeywordRepository> with $Provider<SavedKeywordRepository> {
  SavedKeywordRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedKeywordRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedKeywordRepositoryHash();

  @$internal
  @override
  $ProviderElement<SavedKeywordRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavedKeywordRepository create(Ref ref) {
    return savedKeywordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavedKeywordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavedKeywordRepository>(value),
    );
  }
}

String _$savedKeywordRepositoryHash() =>
    r'6896649215d5e35d348166ebcfc2ae25d3941e9f';

@ProviderFor(savedKeywords)
final savedKeywordsProvider = SavedKeywordsFamily._();

final class SavedKeywordsProvider extends $FunctionalProvider<
        AsyncValue<Set<String>>, Set<String>, FutureOr<Set<String>>>
    with $FutureModifier<Set<String>>, $FutureProvider<Set<String>> {
  SavedKeywordsProvider._(
      {required SavedKeywordsFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'savedKeywordsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedKeywordsHash();

  @override
  String toString() {
    return r'savedKeywordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Set<String>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Set<String>> create(Ref ref) {
    final argument = this.argument as String;
    return savedKeywords(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SavedKeywordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$savedKeywordsHash() => r'b9082ca9b234478d33835b2552b31bd817c668c2';

final class SavedKeywordsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Set<String>>, String> {
  SavedKeywordsFamily._()
      : super(
          retry: null,
          name: r'savedKeywordsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SavedKeywordsProvider call(
    String surfaces,
  ) =>
      SavedKeywordsProvider._(argument: surfaces, from: this);

  @override
  String toString() => r'savedKeywordsProvider';
}
