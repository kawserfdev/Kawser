import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/case_study.dart';
import '../models/recent_work.dart';
import '../models/skill.dart';
import '../models/testimonial.dart';
import '../services/firebase_service.dart';

part 'providers.g.dart';

// Service provider
final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

// Recent Works provider
@riverpod
Stream<List<RecentWork>> recentWorks(RecentWorksRef ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.getRecentWorks();
}

// Testimonials provider
@riverpod
Stream<List<Testimonial>> testimonials(TestimonialsRef ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.getTestimonials();
}

// Case Studies provider
@riverpod
Stream<List<CaseStudy>> caseStudies(CaseStudiesRef ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  return firebaseService.getCaseStudies();
}

// Skills provider
@riverpod
Stream<List<SkillCategory>> skills(SkillsRef ref) {
  final firebaseService = ref.watch(firebaseServiceProvider);
  //print("Skill: ${firebaseService.getSkills}");
  return firebaseService.getSkills();
}
