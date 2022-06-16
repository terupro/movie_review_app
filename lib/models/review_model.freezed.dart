// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get impression => throw _privateConstructorUsedError;
  String? get imgURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String title,
      double rating,
      String impression,
      String? imgURL});
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res> implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  final Review _value;
  // ignore: unused_field
  final $Res Function(Review) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? impression = freezed,
    Object? imgURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      impression: impression == freezed
          ? _value.impression
          : impression // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: imgURL == freezed
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$_ReviewCopyWith(_$_Review value, $Res Function(_$_Review) then) =
      __$$_ReviewCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String title,
      double rating,
      String impression,
      String? imgURL});
}

/// @nodoc
class __$$_ReviewCopyWithImpl<$Res> extends _$ReviewCopyWithImpl<$Res>
    implements _$$_ReviewCopyWith<$Res> {
  __$$_ReviewCopyWithImpl(_$_Review _value, $Res Function(_$_Review) _then)
      : super(_value, (v) => _then(v as _$_Review));

  @override
  _$_Review get _value => super._value as _$_Review;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? rating = freezed,
    Object? impression = freezed,
    Object? imgURL = freezed,
  }) {
    return _then(_$_Review(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      impression: impression == freezed
          ? _value.impression
          : impression // ignore: cast_nullable_to_non_nullable
              as String,
      imgURL: imgURL == freezed
          ? _value.imgURL
          : imgURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Review extends _Review with DiagnosticableTreeMixin {
  _$_Review(
      {this.id,
      required this.title,
      this.rating = 0,
      required this.impression,
      this.imgURL})
      : super._();

  factory _$_Review.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  @JsonKey()
  final double rating;
  @override
  final String impression;
  @override
  final String? imgURL;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Review(id: $id, title: $title, rating: $rating, impression: $impression, imgURL: $imgURL)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Review'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('impression', impression))
      ..add(DiagnosticsProperty('imgURL', imgURL));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Review &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality()
                .equals(other.impression, impression) &&
            const DeepCollectionEquality().equals(other.imgURL, imgURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(impression),
      const DeepCollectionEquality().hash(imgURL));

  @JsonKey(ignore: true)
  @override
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      __$$_ReviewCopyWithImpl<_$_Review>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewToJson(this);
  }
}

abstract class _Review extends Review {
  factory _Review(
      {final String? id,
      required final String title,
      final double rating,
      required final String impression,
      final String? imgURL}) = _$_Review;
  _Review._() : super._();

  factory _Review.fromJson(Map<String, dynamic> json) = _$_Review.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  double get rating => throw _privateConstructorUsedError;
  @override
  String get impression => throw _privateConstructorUsedError;
  @override
  String? get imgURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCopyWith<_$_Review> get copyWith =>
      throw _privateConstructorUsedError;
}
