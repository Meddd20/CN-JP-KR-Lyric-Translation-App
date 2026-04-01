// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LyricNotifier)
final lyricProvider = LyricNotifierProvider._();

final class LyricNotifierProvider
    extends $NotifierProvider<LyricNotifier, AsyncValue<SongLyric?>> {
  LyricNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lyricProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lyricNotifierHash();

  @$internal
  @override
  LyricNotifier create() => LyricNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<SongLyric?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<SongLyric?>>(value),
    );
  }
}

String _$lyricNotifierHash() => r'a5b6f42d5ecc3def3e9a8319aa6487ab9916f25b';

abstract class _$LyricNotifier extends $Notifier<AsyncValue<SongLyric?>> {
  AsyncValue<SongLyric?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SongLyric?>, AsyncValue<SongLyric?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SongLyric?>, AsyncValue<SongLyric?>>,
              AsyncValue<SongLyric?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
