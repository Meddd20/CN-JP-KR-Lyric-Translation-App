// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_glossary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GlobalGlossary {

 String get surface; String get reading; Meaning get meaning;
/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GlobalGlossaryCopyWith<GlobalGlossary> get copyWith => _$GlobalGlossaryCopyWithImpl<GlobalGlossary>(this as GlobalGlossary, _$identity);

  /// Serializes this GlobalGlossary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GlobalGlossary&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surface,reading,meaning);

@override
String toString() {
  return 'GlobalGlossary(surface: $surface, reading: $reading, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class $GlobalGlossaryCopyWith<$Res>  {
  factory $GlobalGlossaryCopyWith(GlobalGlossary value, $Res Function(GlobalGlossary) _then) = _$GlobalGlossaryCopyWithImpl;
@useResult
$Res call({
 String surface, String reading, Meaning meaning
});


$MeaningCopyWith<$Res> get meaning;

}
/// @nodoc
class _$GlobalGlossaryCopyWithImpl<$Res>
    implements $GlobalGlossaryCopyWith<$Res> {
  _$GlobalGlossaryCopyWithImpl(this._self, this._then);

  final GlobalGlossary _self;
  final $Res Function(GlobalGlossary) _then;

/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surface = null,Object? reading = null,Object? meaning = null,}) {
  return _then(_self.copyWith(
surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as String,reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as Meaning,
  ));
}
/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeaningCopyWith<$Res> get meaning {
  
  return $MeaningCopyWith<$Res>(_self.meaning, (value) {
    return _then(_self.copyWith(meaning: value));
  });
}
}


/// Adds pattern-matching-related methods to [GlobalGlossary].
extension GlobalGlossaryPatterns on GlobalGlossary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GlobalGlossary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GlobalGlossary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GlobalGlossary value)  $default,){
final _that = this;
switch (_that) {
case _GlobalGlossary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GlobalGlossary value)?  $default,){
final _that = this;
switch (_that) {
case _GlobalGlossary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String surface,  String reading,  Meaning meaning)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GlobalGlossary() when $default != null:
return $default(_that.surface,_that.reading,_that.meaning);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String surface,  String reading,  Meaning meaning)  $default,) {final _that = this;
switch (_that) {
case _GlobalGlossary():
return $default(_that.surface,_that.reading,_that.meaning);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String surface,  String reading,  Meaning meaning)?  $default,) {final _that = this;
switch (_that) {
case _GlobalGlossary() when $default != null:
return $default(_that.surface,_that.reading,_that.meaning);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GlobalGlossary implements GlobalGlossary {
  const _GlobalGlossary({required this.surface, required this.reading, required this.meaning});
  factory _GlobalGlossary.fromJson(Map<String, dynamic> json) => _$GlobalGlossaryFromJson(json);

@override final  String surface;
@override final  String reading;
@override final  Meaning meaning;

/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GlobalGlossaryCopyWith<_GlobalGlossary> get copyWith => __$GlobalGlossaryCopyWithImpl<_GlobalGlossary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GlobalGlossaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GlobalGlossary&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.reading, reading) || other.reading == reading)&&(identical(other.meaning, meaning) || other.meaning == meaning));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,surface,reading,meaning);

@override
String toString() {
  return 'GlobalGlossary(surface: $surface, reading: $reading, meaning: $meaning)';
}


}

/// @nodoc
abstract mixin class _$GlobalGlossaryCopyWith<$Res> implements $GlobalGlossaryCopyWith<$Res> {
  factory _$GlobalGlossaryCopyWith(_GlobalGlossary value, $Res Function(_GlobalGlossary) _then) = __$GlobalGlossaryCopyWithImpl;
@override @useResult
$Res call({
 String surface, String reading, Meaning meaning
});


@override $MeaningCopyWith<$Res> get meaning;

}
/// @nodoc
class __$GlobalGlossaryCopyWithImpl<$Res>
    implements _$GlobalGlossaryCopyWith<$Res> {
  __$GlobalGlossaryCopyWithImpl(this._self, this._then);

  final _GlobalGlossary _self;
  final $Res Function(_GlobalGlossary) _then;

/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surface = null,Object? reading = null,Object? meaning = null,}) {
  return _then(_GlobalGlossary(
surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as String,reading: null == reading ? _self.reading : reading // ignore: cast_nullable_to_non_nullable
as String,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as Meaning,
  ));
}

/// Create a copy of GlobalGlossary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeaningCopyWith<$Res> get meaning {
  
  return $MeaningCopyWith<$Res>(_self.meaning, (value) {
    return _then(_self.copyWith(meaning: value));
  });
}
}

// dart format on
