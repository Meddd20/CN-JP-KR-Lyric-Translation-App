// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lyric {

 String get lineId; double get startTime; double get endTime; String get surfaceText; String get readingText; Meaning get translation; List<Chunk> get chunks;
/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricCopyWith<Lyric> get copyWith => _$LyricCopyWithImpl<Lyric>(this as Lyric, _$identity);

  /// Serializes this Lyric to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lyric&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.surfaceText, surfaceText) || other.surfaceText == surfaceText)&&(identical(other.readingText, readingText) || other.readingText == readingText)&&(identical(other.translation, translation) || other.translation == translation)&&const DeepCollectionEquality().equals(other.chunks, chunks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineId,startTime,endTime,surfaceText,readingText,translation,const DeepCollectionEquality().hash(chunks));

@override
String toString() {
  return 'Lyric(lineId: $lineId, startTime: $startTime, endTime: $endTime, surfaceText: $surfaceText, readingText: $readingText, translation: $translation, chunks: $chunks)';
}


}

/// @nodoc
abstract mixin class $LyricCopyWith<$Res>  {
  factory $LyricCopyWith(Lyric value, $Res Function(Lyric) _then) = _$LyricCopyWithImpl;
@useResult
$Res call({
 String lineId, double startTime, double endTime, String surfaceText, String readingText, Meaning translation, List<Chunk> chunks
});


$MeaningCopyWith<$Res> get translation;

}
/// @nodoc
class _$LyricCopyWithImpl<$Res>
    implements $LyricCopyWith<$Res> {
  _$LyricCopyWithImpl(this._self, this._then);

  final Lyric _self;
  final $Res Function(Lyric) _then;

/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lineId = null,Object? startTime = null,Object? endTime = null,Object? surfaceText = null,Object? readingText = null,Object? translation = null,Object? chunks = null,}) {
  return _then(_self.copyWith(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as double,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as double,surfaceText: null == surfaceText ? _self.surfaceText : surfaceText // ignore: cast_nullable_to_non_nullable
as String,readingText: null == readingText ? _self.readingText : readingText // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Meaning,chunks: null == chunks ? _self.chunks : chunks // ignore: cast_nullable_to_non_nullable
as List<Chunk>,
  ));
}
/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeaningCopyWith<$Res> get translation {
  
  return $MeaningCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}
}


/// Adds pattern-matching-related methods to [Lyric].
extension LyricPatterns on Lyric {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lyric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lyric() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lyric value)  $default,){
final _that = this;
switch (_that) {
case _Lyric():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lyric value)?  $default,){
final _that = this;
switch (_that) {
case _Lyric() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lineId,  double startTime,  double endTime,  String surfaceText,  String readingText,  Meaning translation,  List<Chunk> chunks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lyric() when $default != null:
return $default(_that.lineId,_that.startTime,_that.endTime,_that.surfaceText,_that.readingText,_that.translation,_that.chunks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lineId,  double startTime,  double endTime,  String surfaceText,  String readingText,  Meaning translation,  List<Chunk> chunks)  $default,) {final _that = this;
switch (_that) {
case _Lyric():
return $default(_that.lineId,_that.startTime,_that.endTime,_that.surfaceText,_that.readingText,_that.translation,_that.chunks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lineId,  double startTime,  double endTime,  String surfaceText,  String readingText,  Meaning translation,  List<Chunk> chunks)?  $default,) {final _that = this;
switch (_that) {
case _Lyric() when $default != null:
return $default(_that.lineId,_that.startTime,_that.endTime,_that.surfaceText,_that.readingText,_that.translation,_that.chunks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lyric implements Lyric {
  const _Lyric({required this.lineId, required this.startTime, required this.endTime, required this.surfaceText, required this.readingText, required this.translation, required final  List<Chunk> chunks}): _chunks = chunks;
  factory _Lyric.fromJson(Map<String, dynamic> json) => _$LyricFromJson(json);

@override final  String lineId;
@override final  double startTime;
@override final  double endTime;
@override final  String surfaceText;
@override final  String readingText;
@override final  Meaning translation;
 final  List<Chunk> _chunks;
@override List<Chunk> get chunks {
  if (_chunks is EqualUnmodifiableListView) return _chunks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chunks);
}


/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricCopyWith<_Lyric> get copyWith => __$LyricCopyWithImpl<_Lyric>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lyric&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.surfaceText, surfaceText) || other.surfaceText == surfaceText)&&(identical(other.readingText, readingText) || other.readingText == readingText)&&(identical(other.translation, translation) || other.translation == translation)&&const DeepCollectionEquality().equals(other._chunks, _chunks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lineId,startTime,endTime,surfaceText,readingText,translation,const DeepCollectionEquality().hash(_chunks));

@override
String toString() {
  return 'Lyric(lineId: $lineId, startTime: $startTime, endTime: $endTime, surfaceText: $surfaceText, readingText: $readingText, translation: $translation, chunks: $chunks)';
}


}

/// @nodoc
abstract mixin class _$LyricCopyWith<$Res> implements $LyricCopyWith<$Res> {
  factory _$LyricCopyWith(_Lyric value, $Res Function(_Lyric) _then) = __$LyricCopyWithImpl;
@override @useResult
$Res call({
 String lineId, double startTime, double endTime, String surfaceText, String readingText, Meaning translation, List<Chunk> chunks
});


@override $MeaningCopyWith<$Res> get translation;

}
/// @nodoc
class __$LyricCopyWithImpl<$Res>
    implements _$LyricCopyWith<$Res> {
  __$LyricCopyWithImpl(this._self, this._then);

  final _Lyric _self;
  final $Res Function(_Lyric) _then;

/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? startTime = null,Object? endTime = null,Object? surfaceText = null,Object? readingText = null,Object? translation = null,Object? chunks = null,}) {
  return _then(_Lyric(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as double,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as double,surfaceText: null == surfaceText ? _self.surfaceText : surfaceText // ignore: cast_nullable_to_non_nullable
as String,readingText: null == readingText ? _self.readingText : readingText // ignore: cast_nullable_to_non_nullable
as String,translation: null == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as Meaning,chunks: null == chunks ? _self._chunks : chunks // ignore: cast_nullable_to_non_nullable
as List<Chunk>,
  ));
}

/// Create a copy of Lyric
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeaningCopyWith<$Res> get translation {
  
  return $MeaningCopyWith<$Res>(_self.translation, (value) {
    return _then(_self.copyWith(translation: value));
  });
}
}

// dart format on
