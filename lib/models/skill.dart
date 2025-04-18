import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

@freezed
class SkillCategory with _$SkillCategory {
  factory SkillCategory({
    required String id,
    required String title,
    required List<String> skills,
  }) = _SkillCategory;

  factory SkillCategory.fromJson(Map<String, dynamic> json) => _$SkillCategoryFromJson(json);
}
