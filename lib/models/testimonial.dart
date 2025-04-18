import 'package:freezed_annotation/freezed_annotation.dart';

part 'testimonial.freezed.dart';
part 'testimonial.g.dart';

@freezed
class Testimonial with _$Testimonial {
  factory Testimonial({
    required String id,
    required String testimonial,
    required String name,
    required String position,
    String? imageUrl,
  }) = _Testimonial;

  factory Testimonial.fromJson(Map<String, dynamic> json) => _$TestimonialFromJson(json);
}