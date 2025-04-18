import 'package:flutter/foundation.dart';
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
  }) = _CaseStudy;

  factory CaseStudy.fromJson(Map<String, dynamic> json) => _$CaseStudyFromJson(json);
}