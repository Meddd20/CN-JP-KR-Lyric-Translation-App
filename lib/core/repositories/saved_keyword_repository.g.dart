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

@ProviderFor(keywordByLanguage)
final keywordByLanguageProvider = KeywordByLanguageFamily._();

final class KeywordByLanguageProvider extends $FunctionalProvider<
        AsyncValue<List<SavedKeyword>>,
        List<SavedKeyword>,
        FutureOr<List<SavedKeyword>>>
    with
        $FutureModifier<List<SavedKeyword>>,
        $FutureProvider<List<SavedKeyword>> {
  KeywordByLanguageProvider._(
      {required KeywordByLanguageFamily super.from,
      required (
        ScriptLanguage,
        VocabSortBy,
      )
          super.argument})
      : super(
          retry: null,
          name: r'keywordByLanguageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$keywordByLanguageHash();

  @override
  String toString() {
    return r'keywordByLanguageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<SavedKeyword>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<SavedKeyword>> create(Ref ref) {
    final argument = this.argument as (
      ScriptLanguage,
      VocabSortBy,
    );
    return keywordByLanguage(
      ref,
      argument.$1,
      argument.$2,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is KeywordByLanguageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$keywordByLanguageHash() => r'cce9cc3a2c235acd7cb92a73104143aa33131076';

final class KeywordByLanguageFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<SavedKeyword>>,
            (
              ScriptLanguage,
              VocabSortBy,
            )> {
  KeywordByLanguageFamily._()
      : super(
          retry: null,
          name: r'keywordByLanguageProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  KeywordByLanguageProvider call(
    ScriptLanguage language,
    VocabSortBy sortBy,
  ) =>
      KeywordByLanguageProvider._(argument: (
        language,
        sortBy,
      ), from: this);

  @override
  String toString() => r'keywordByLanguageProvider';
}

@ProviderFor(searchKeyword)
final searchKeywordProvider = SearchKeywordFamily._();

final class SearchKeywordProvider extends $FunctionalProvider<
        AsyncValue<List<SavedKeyword>>,
        List<SavedKeyword>,
        FutureOr<List<SavedKeyword>>>
    with
        $FutureModifier<List<SavedKeyword>>,
        $FutureProvider<List<SavedKeyword>> {
  SearchKeywordProvider._(
      {required SearchKeywordFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'searchKeywordProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$searchKeywordHash();

  @override
  String toString() {
    return r'searchKeywordProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SavedKeyword>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<SavedKeyword>> create(Ref ref) {
    final argument = this.argument as String;
    return searchKeyword(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchKeywordProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchKeywordHash() => r'0c1ade7dbd37eee17e49b6ad33c02e18689c11e2';

final class SearchKeywordFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SavedKeyword>>, String> {
  SearchKeywordFamily._()
      : super(
          retry: null,
          name: r'searchKeywordProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SearchKeywordProvider call(
    String query,
  ) =>
      SearchKeywordProvider._(argument: query, from: this);

  @override
  String toString() => r'searchKeywordProvider';
}
