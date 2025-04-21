import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/case_study.dart';
import '../models/recent_work.dart';
import '../models/skill.dart';
import '../models/testimonial.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collections
  CollectionReference get _recentWorksCollection => _firestore.collection('recent_works');
  CollectionReference get _testimonialsCollection => _firestore.collection('testimonials');
  CollectionReference get _caseStudiesCollection => _firestore.collection('case_studies');
  CollectionReference get _skillsCollection => _firestore.collection('skills');
  
  // Recent Works
  Stream<List<RecentWork>> getRecentWorks() {
    return _recentWorksCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return RecentWork.fromJson({
              'id': doc.id,
              ...data,
            });
          }).toList();
        });
  }
  
  // Testimonials
  Stream<List<Testimonial>> getTestimonials() {
    return _testimonialsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Testimonial.fromJson({
              'id': doc.id,
              ...data,
            });
          }).toList();
        });
  }
  
  // Case Studies
  Stream<List<CaseStudy>> getCaseStudies() {
    return _caseStudiesCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return CaseStudy.fromJson({
              'id': doc.id,
              ...data,
            });
          }).toList();
        });
  }
  
  // Skills
  Stream<List<SkillCategory>> getSkills() {
    return _skillsCollection
        .orderBy('order')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return SkillCategory.fromJson({
              'id': doc.id,
              ...data,
            });
          }).toList();
        });
  }






  // Create Operations
  Future<void> addRecentWork(RecentWork recentWork) async {
    Map<String, dynamic> data = recentWork.toJson();
    data.remove('id'); // Remove id from data, as Firestore will generate its own
    data['createdAt'] = FieldValue.serverTimestamp();
    
    await _recentWorksCollection.doc(recentWork.id).set(data);
  }
  
  Future<void> addCaseStudy(CaseStudy caseStudy) async {
    Map<String, dynamic> data = caseStudy.toJson();
    data.remove('id');
    data['createdAt'] = FieldValue.serverTimestamp();
    
    await _caseStudiesCollection.doc(caseStudy.id).set(data);
  }
  
  Future<void> addTestimonial(Testimonial testimonial) async {
    Map<String, dynamic> data = testimonial.toJson();
    data.remove('id');
    data['createdAt'] = FieldValue.serverTimestamp();
    
    await _testimonialsCollection.doc(testimonial.id).set(data);
  }
  
  Future<void> addSkill(SkillCategory skill) async {
    Map<String, dynamic> data = skill.toJson();
    data.remove('id');
    data['createdAt'] = FieldValue.serverTimestamp();
    
    await _skillsCollection.doc(skill.id).set(data);
  }
  
  // Update Operations
  Future<void> updateRecentWork(RecentWork recentWork) async {
    Map<String, dynamic> data = recentWork.toJson();
    data.remove('id');
    data['updatedAt'] = FieldValue.serverTimestamp();
    
    await _recentWorksCollection.doc(recentWork.id).update(data);
  }
  
  Future<void> updateCaseStudy(CaseStudy caseStudy) async {
    Map<String, dynamic> data = caseStudy.toJson();
    data.remove('id');
    data['updatedAt'] = FieldValue.serverTimestamp();
    
    await _caseStudiesCollection.doc(caseStudy.id).update(data);
  }
  
  Future<void> updateTestimonial(Testimonial testimonial) async {
    Map<String, dynamic> data = testimonial.toJson();
    data.remove('id');
    data['updatedAt'] = FieldValue.serverTimestamp();
    
    await _testimonialsCollection.doc(testimonial.id).update(data);
  }
  
  Future<void> updateSkill(SkillCategory skill) async {
    Map<String, dynamic> data = skill.toJson();
    data.remove('id');
    data['updatedAt'] = FieldValue.serverTimestamp();
    
    await _skillsCollection.doc(skill.id).update(data);
  }
  
  // Delete Operations
  Future<void> deleteRecentWork(String id) async {
    await _recentWorksCollection.doc(id).delete();
  }
  
  Future<void> deleteCaseStudy(String id) async {
    await _caseStudiesCollection.doc(id).delete();
  }
  
  Future<void> deleteTestimonial(String id) async {
    await _testimonialsCollection.doc(id).delete();
  }
  
  Future<void> deleteSkill(String id) async {
    await _skillsCollection.doc(id).delete();
  }
}