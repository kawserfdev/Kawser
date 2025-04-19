// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case_study.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaseStudy _$CaseStudyFromJson(Map<String, dynamic> json) {
  return _CaseStudy.fromJson(json);
}

/// @nodoc
mixin _$CaseStudy {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get badgeText => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get badgeColor => throw _privateConstructorUsedError;
  String get linkText => throw _privateConstructorUsedError;
  String get linkUrl => throw _privateConstructorUsedError;

  /// Serializes this CaseStudy to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseStudyCopyWith<CaseStudy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseStudyCopyWith<$Res> {
  factory $CaseStudyCopyWith(CaseStudy value, $Res Function(CaseStudy) then) =
      _$CaseStudyCopyWithImpl<$Res, CaseStudy>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String badgeText,
      @ColorConverter() Color badgeColor,
      String linkText,
      String linkUrl});
}

/// @nodoc
class _$CaseStudyCopyWithImpl<$Res, $Val extends CaseStudy>
    implements $CaseStudyCopyWith<$Res> {
  _$CaseStudyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? badgeText = null,
    Object? badgeColor = null,
    Object? linkText = null,
    Object? linkUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as String,
      badgeColor: null == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Color,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseStudyImplCopyWith<$Res>
    implements $CaseStudyCopyWith<$Res> {
  factory _$$CaseStudyImplCopyWith(
          _$CaseStudyImpl value, $Res Function(_$CaseStudyImpl) then) =
      __$$CaseStudyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String badgeText,
      @ColorConverter() Color badgeColor,
      String linkText,
      String linkUrl});
}

/// @nodoc
class __$$CaseStudyImplCopyWithImpl<$Res>
    extends _$CaseStudyCopyWithImpl<$Res, _$CaseStudyImpl>
    implements _$$CaseStudyImplCopyWith<$Res> {
  __$$CaseStudyImplCopyWithImpl(
      _$CaseStudyImpl _value, $Res Function(_$CaseStudyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? badgeText = null,
    Object? badgeColor = null,
    Object? linkText = null,
    Object? linkUrl = null,
  }) {
    return _then(_$CaseStudyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      badgeText: null == badgeText
          ? _value.badgeText
          : badgeText // ignore: cast_nullable_to_non_nullable
              as String,
      badgeColor: null == badgeColor
          ? _value.badgeColor
          : badgeColor // ignore: cast_nullable_to_non_nullable
              as Color,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      linkUrl: null == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseStudyImpl implements _CaseStudy {
  _$CaseStudyImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.badgeText,
      @ColorConverter() required this.badgeColor,
      required this.linkText,
      required this.linkUrl});

  factory _$CaseStudyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseStudyImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String badgeText;
  @override
  @ColorConverter()
  final Color badgeColor;
  @override
  final String linkText;
  @override
  final String linkUrl;

  @override
  String toString() {
    return 'CaseStudy(id: $id, title: $title, description: $description, badgeText: $badgeText, badgeColor: $badgeColor, linkText: $linkText, linkUrl: $linkUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseStudyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.badgeText, badgeText) ||
                other.badgeText == badgeText) &&
            (identical(other.badgeColor, badgeColor) ||
                other.badgeColor == badgeColor) &&
            (identical(other.linkText, linkText) ||
                other.linkText == linkText) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      badgeText, badgeColor, linkText, linkUrl);

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseStudyImplCopyWith<_$CaseStudyImpl> get copyWith =>
      __$$CaseStudyImplCopyWithImpl<_$CaseStudyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseStudyImplToJson(
      this,
    );
  }
}

abstract class _CaseStudy implements CaseStudy {
  factory _CaseStudy(
      {required final String id,
      required final String title,
      required final String description,
      required final String badgeText,
      @ColorConverter() required final Color badgeColor,
      required final String linkText,
      required final String linkUrl}) = _$CaseStudyImpl;

  factory _CaseStudy.fromJson(Map<String, dynamic> json) =
      _$CaseStudyImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get badgeText;
  @override
  @ColorConverter()
  Color get badgeColor;
  @override
  String get linkText;
  @override
  String get linkUrl;

  /// Create a copy of CaseStudy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseStudyImplCopyWith<_$CaseStudyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
