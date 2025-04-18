// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) {
  return _SkillCategory.fromJson(json);
}

/// @nodoc
mixin _$SkillCategory {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;

  /// Serializes this SkillCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SkillCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SkillCategoryCopyWith<SkillCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillCategoryCopyWith<$Res> {
  factory $SkillCategoryCopyWith(
          SkillCategory value, $Res Function(SkillCategory) then) =
      _$SkillCategoryCopyWithImpl<$Res, SkillCategory>;
  @useResult
  $Res call({String id, String title, List<String> skills});
}

/// @nodoc
class _$SkillCategoryCopyWithImpl<$Res, $Val extends SkillCategory>
    implements $SkillCategoryCopyWith<$Res> {
  _$SkillCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SkillCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? skills = null,
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
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SkillCategoryImplCopyWith<$Res>
    implements $SkillCategoryCopyWith<$Res> {
  factory _$$SkillCategoryImplCopyWith(
          _$SkillCategoryImpl value, $Res Function(_$SkillCategoryImpl) then) =
      __$$SkillCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, List<String> skills});
}

/// @nodoc
class __$$SkillCategoryImplCopyWithImpl<$Res>
    extends _$SkillCategoryCopyWithImpl<$Res, _$SkillCategoryImpl>
    implements _$$SkillCategoryImplCopyWith<$Res> {
  __$$SkillCategoryImplCopyWithImpl(
      _$SkillCategoryImpl _value, $Res Function(_$SkillCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SkillCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? skills = null,
  }) {
    return _then(_$SkillCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SkillCategoryImpl implements _SkillCategory {
  _$SkillCategoryImpl(
      {required this.id,
      required this.title,
      required final List<String> skills})
      : _skills = skills;

  factory _$SkillCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SkillCategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  String toString() {
    return 'SkillCategory(id: $id, title: $title, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkillCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._skills, _skills));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_skills));

  /// Create a copy of SkillCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkillCategoryImplCopyWith<_$SkillCategoryImpl> get copyWith =>
      __$$SkillCategoryImplCopyWithImpl<_$SkillCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SkillCategoryImplToJson(
      this,
    );
  }
}

abstract class _SkillCategory implements SkillCategory {
  factory _SkillCategory(
      {required final String id,
      required final String title,
      required final List<String> skills}) = _$SkillCategoryImpl;

  factory _SkillCategory.fromJson(Map<String, dynamic> json) =
      _$SkillCategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  List<String> get skills;

  /// Create a copy of SkillCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkillCategoryImplCopyWith<_$SkillCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
