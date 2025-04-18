// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialImpl _$$TestimonialImplFromJson(Map<String, dynamic> json) =>
    _$TestimonialImpl(
      id: json['id'] as String,
      testimonial: json['testimonial'] as String,
      name: json['name'] as String,
      position: json['position'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$TestimonialImplToJson(_$TestimonialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testimonial': instance.testimonial,
      'name': instance.name,
      'position': instance.position,
      'imageUrl': instance.imageUrl,
    };
