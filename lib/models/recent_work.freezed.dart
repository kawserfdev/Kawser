// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_work.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentWork _$RecentWorkFromJson(Map<String, dynamic> json) {
  return _RecentWork.fromJson(json);
}

/// @nodoc
mixin _$RecentWork {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get badgeText => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get badgeColor => throw _privateConstructorUsedError;
  String get linkText => throw _privateConstructorUsedError;
  String get linkUrl => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this RecentWork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentWork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentWorkCopyWith<RecentWork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentWorkCopyWith<$Res> {
  factory $RecentWorkCopyWith(
          RecentWork value, $Res Function(RecentWork) then) =
      _$RecentWorkCopyWithImpl<$Res, RecentWork>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String badgeText,
      @ColorConverter() Color badgeColor,
      String linkText,
      String linkUrl,
      String imageUrl});
}

/// @nodoc
class _$RecentWorkCopyWithImpl<$Res, $Val extends RecentWork>
    implements $RecentWorkCopyWith<$Res> {
  _$RecentWorkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentWork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? badgeText = null,
    Object? badgeColor = freezed,
    Object? linkText = null,
    Object? linkUrl = null,
    Object? imageUrl = null,
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
      badgeColor: freezed == badgeColor
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentWorkImplCopyWith<$Res>
    implements $RecentWorkCopyWith<$Res> {
  factory _$$RecentWorkImplCopyWith(
          _$RecentWorkImpl value, $Res Function(_$RecentWorkImpl) then) =
      __$$RecentWorkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String badgeText,
      @ColorConverter() Color badgeColor,
      String linkText,
      String linkUrl,
      String imageUrl});
}

/// @nodoc
class __$$RecentWorkImplCopyWithImpl<$Res>
    extends _$RecentWorkCopyWithImpl<$Res, _$RecentWorkImpl>
    implements _$$RecentWorkImplCopyWith<$Res> {
  __$$RecentWorkImplCopyWithImpl(
      _$RecentWorkImpl _value, $Res Function(_$RecentWorkImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentWork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? badgeText = null,
    Object? badgeColor = freezed,
    Object? linkText = null,
    Object? linkUrl = null,
    Object? imageUrl = null,
  }) {
    return _then(_$RecentWorkImpl(
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
      badgeColor: freezed == badgeColor
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
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentWorkImpl with DiagnosticableTreeMixin implements _RecentWork {
  _$RecentWorkImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.badgeText,
      @ColorConverter() required this.badgeColor,
      required this.linkText,
      required this.linkUrl,
      required this.imageUrl});

  factory _$RecentWorkImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentWorkImplFromJson(json);

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
  final String imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecentWork(id: $id, title: $title, description: $description, badgeText: $badgeText, badgeColor: $badgeColor, linkText: $linkText, linkUrl: $linkUrl, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecentWork'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('badgeText', badgeText))
      ..add(DiagnosticsProperty('badgeColor', badgeColor))
      ..add(DiagnosticsProperty('linkText', linkText))
      ..add(DiagnosticsProperty('linkUrl', linkUrl))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentWorkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.badgeText, badgeText) ||
                other.badgeText == badgeText) &&
            const DeepCollectionEquality()
                .equals(other.badgeColor, badgeColor) &&
            (identical(other.linkText, linkText) ||
                other.linkText == linkText) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      badgeText,
      const DeepCollectionEquality().hash(badgeColor),
      linkText,
      linkUrl,
      imageUrl);

  /// Create a copy of RecentWork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentWorkImplCopyWith<_$RecentWorkImpl> get copyWith =>
      __$$RecentWorkImplCopyWithImpl<_$RecentWorkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentWorkImplToJson(
      this,
    );
  }
}

abstract class _RecentWork implements RecentWork {
  factory _RecentWork(
      {required final String id,
      required final String title,
      required final String description,
      required final String badgeText,
      @ColorConverter() required final Color badgeColor,
      required final String linkText,
      required final String linkUrl,
      required final String imageUrl}) = _$RecentWorkImpl;

  factory _RecentWork.fromJson(Map<String, dynamic> json) =
      _$RecentWorkImpl.fromJson;

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
  @override
  String get imageUrl;

  /// Create a copy of RecentWork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentWorkImplCopyWith<_$RecentWorkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
