import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/models/skill.dart';

Future<List<SkillCategory>> fetchSkills() async {
  final snapshot = await FirebaseFirestore.instance.collection('skills').get();
  return snapshot.docs
      .map((doc) => SkillCategory.fromJson({
            'id': doc.id,
            ...doc.data(),
          }))
      .toList();
}




final getSkillsProvider = FutureProvider.autoDispose<List<SkillCategory>>((
  ref,
) async {
  return await fetchSkills();
});