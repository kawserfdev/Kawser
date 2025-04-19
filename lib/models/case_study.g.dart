// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseStudyImpl _$$CaseStudyImplFromJson(Map<String, dynamic> json) =>
    _$CaseStudyImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      badgeText: json['badgeText'] as String,
      badgeColor:
          const ColorConverter().fromJson((json['badgeColor'] as num).toInt()),
      linkText: json['linkText'] as String,
      linkUrl: json['linkUrl'] as String,
    );

Map<String, dynamic> _$$CaseStudyImplToJson(_$CaseStudyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'badgeText': instance.badgeText,
      'badgeColor': const ColorConverter().toJson(instance.badgeColor),
      'linkText': instance.linkText,
      'linkUrl': instance.linkUrl,
    };
