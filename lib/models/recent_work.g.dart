// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentWorkImpl _$$RecentWorkImplFromJson(Map<String, dynamic> json) =>
    _$RecentWorkImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      badgeText: json['badgeText'] as String,
      badgeColor:
          const ColorConverter().fromJson((json['badgeColor'] as num).toInt()),
      linkText: json['linkText'] as String,
      linkUrl: json['linkUrl'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$RecentWorkImplToJson(_$RecentWorkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'badgeText': instance.badgeText,
      'badgeColor': const ColorConverter().toJson(instance.badgeColor),
      'linkText': instance.linkText,
      'linkUrl': instance.linkUrl,
      'imageUrl': instance.imageUrl,
    };
