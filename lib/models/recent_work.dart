import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'recent_work.freezed.dart';
part 'recent_work.g.dart';

@freezed
class RecentWork with _$RecentWork {
  factory RecentWork({
    required String id,
    required String title,
    required String description,
    required String badgeText,
    @ColorConverter() required Color badgeColor,
    required String linkText,
    required String linkUrl,
    required String imageUrl,
  }) = _RecentWork;

  factory RecentWork.fromJson(Map<String, dynamic> json) => _$RecentWorkFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}