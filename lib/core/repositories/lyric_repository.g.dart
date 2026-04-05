// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lyricRepository)
final lyricRepositoryProvider = LyricRepositoryProvider._();

final class LyricRepositoryProvider extends $FunctionalProvider<LyricRepository,
    LyricRepository, LyricRepository> with $Provider<LyricRepository> {
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
  $ProviderElement<LyricRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

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

String _$lyricRepositoryHash() => r'b14180000fea8e37dae28bec2282d462ce38e1b2';
