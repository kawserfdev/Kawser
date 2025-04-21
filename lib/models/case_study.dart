import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'case_study.freezed.dart';
part 'case_study.g.dart';

@freezed
class CaseStudy with _$CaseStudy {
  factory CaseStudy({
    required String id,
    required String title,
    required String description,
    required String badgeText,
    @ColorConverter() required Color badgeColor,
    required String linkText,
    required String linkUrl,
     DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CaseStudy;

 factory CaseStudy.fromJson(Map<String, dynamic> json) => _$CaseStudyFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}  