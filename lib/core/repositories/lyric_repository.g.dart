// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lyricRepository)
final lyricRepositoryProvider = LyricRepositoryProvider._();

final class LyricRepositoryProvider extends $FunctionalProvider<LyricRepository, LyricRepository, LyricRepository>
    with $Provider<LyricRepository> {
  LyricRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'lyricRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$lyricRepositoryHash();

  @$internal
  @override
  $ProviderElement<LyricRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  LyricRepository create(Ref ref) {
    return lyricRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LyricRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LyricRepository>(value),
    );
  }
}

String _$lyricRepositoryHash() => r'1a33a907122f45d861f4e63d7cb86e68391b275d';

@ProviderFor(recentHistory)
final recentHistoryProvider = RecentHistoryProvider._();

final class RecentHistoryProvider
    extends $FunctionalProvider<AsyncValue<List<SongLyric>>, List<SongLyric>, FutureOr<List<SongLyric>>>
    with $FutureModifier<List<SongLyric>>, $FutureProvider<List<SongLyric>> {
  RecentHistoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentHistoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SongLyric>> create(Ref ref) {
    return recentHistory(ref);
  }
}

String _$recentHistoryHash() => r'dac5ebb6e5b8c028553cd67bc2bd682984dd82fc';

@ProviderFor(getHistory)
final getHistoryProvider = GetHistoryFamily._();

final class GetHistoryProvider
    extends $FunctionalProvider<AsyncValue<List<SongLyric>>, List<SongLyric>, FutureOr<List<SongLyric>>>
    with $FutureModifier<List<SongLyric>>, $FutureProvider<List<SongLyric>> {
  GetHistoryProvider._({required GetHistoryFamily super.from, required ScriptLanguage? super.argument})
      : super(
          retry: null,
          name: r'getHistoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getHistoryHash();

  @override
  String toString() {
    return r'getHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SongLyric>> create(Ref ref) {
    final argument = this.argument as ScriptLanguage?;
    return getHistory(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getHistoryHash() => r'e24d3b1f5b0a573e9650bf2b0e358ea0f4b02284';

final class GetHistoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SongLyric>>, ScriptLanguage?> {
  GetHistoryFamily._()
      : super(
          retry: null,
          name: r'getHistoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetHistoryProvider call(
    ScriptLanguage? language,
  ) =>
      GetHistoryProvider._(argument: language, from: this);

  @override
  String toString() => r'getHistoryProvider';
}

@ProviderFor(songsByTitleArtist)
final songsByTitleArtistProvider = SongsByTitleArtistFamily._();

final class SongsByTitleArtistProvider
    extends $FunctionalProvider<AsyncValue<List<SongLyric>>, List<SongLyric>, FutureOr<List<SongLyric>>>
    with $FutureModifier<List<SongLyric>>, $FutureProvider<List<SongLyric>> {
  SongsByTitleArtistProvider._({required SongsByTitleArtistFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'songsByTitleArtistProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$songsByTitleArtistHash();

  @override
  String toString() {
    return r'songsByTitleArtistProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SongLyric>> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SongLyric>> create(Ref ref) {
    final argument = this.argument as String;
    return songsByTitleArtist(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongsByTitleArtistProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songsByTitleArtistHash() => r'cb533d82962d448b8087c73803d2c716c545e055';

final class SongsByTitleArtistFamily extends $Family with $FunctionalFamilyOverride<FutureOr<List<SongLyric>>, String> {
  SongsByTitleArtistFamily._()
      : super(
          retry: null,
          name: r'songsByTitleArtistProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SongsByTitleArtistProvider call(
    String searchQuery,
  ) =>
      SongsByTitleArtistProvider._(argument: searchQuery, from: this);

  @override
  String toString() => r'songsByTitleArtistProvider';
}

@ProviderFor(songById)
final songByIdProvider = SongByIdFamily._();

final class SongByIdProvider extends $FunctionalProvider<AsyncValue<SongLyric?>, SongLyric?, FutureOr<SongLyric?>>
    with $FutureModifier<SongLyric?>, $FutureProvider<SongLyric?> {
  SongByIdProvider._({required SongByIdFamily super.from, required int super.argument})
      : super(
          retry: null,
          name: r'songByIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$songByIdHash();

  @override
  String toString() {
    return r'songByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SongLyric?> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<SongLyric?> create(Ref ref) {
    final argument = this.argument as int;
    return songById(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SongByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$songByIdHash() => r'efbb490d8d0534a9f4fda47fef04509c67781473';

final class SongByIdFamily extends $Family with $FunctionalFamilyOverride<FutureOr<SongLyric?>, int> {
  SongByIdFamily._()
      : super(
          retry: null,
          name: r'songByIdProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SongByIdProvider call(
    int id,
  ) =>
      SongByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'songByIdProvider';
}
