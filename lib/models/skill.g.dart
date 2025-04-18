// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillCategoryImpl _$$SkillCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SkillCategoryImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SkillCategoryImplToJson(_$SkillCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'skills': instance.skills,
    };
