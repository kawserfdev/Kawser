import 'package:flutter/material.dart';
import 'package:kawser/models/case_study.dart';
import 'package:kawser/models/recent_work.dart';
import 'package:kawser/models/skill.dart';
import 'package:kawser/models/testimonial.dart';
import 'package:kawser/services/firebase_service.dart';

class SeedDataGenerator {
  final FirebaseService _firebaseService;
  
  SeedDataGenerator(this._firebaseService);
  
  Future<void> seedRecentWorks() async {  
    final recentWorks = [
      RecentWork(
        id: '1',
        title: 'GhorerBazar App',
        description: 'A complete e-commerce solution for GhorerBazar, featuring product browsing, cart management, order tracking, and partial payment processing.',
        badgeText: 'E-commerce',
        badgeColor: const Color(0xFF4CAF50),
        linkText: 'View More',
        linkUrl: '#',
        imageUrl: 'https://via.placeholder.com/600x400/333/666?text=GhorerBazar+App',
      ),
      RecentWork(
        id: '2',
        title: 'Order Management Tool',
        description: 'An internal tool for GhorerBazar operations team to manage customer orders, process payments, and track delivery status in real-time.',
        badgeText: 'Management Tool',
        badgeColor: const Color(0xFF4CAF50),
        linkText: 'View More',
        linkUrl: '#',
        imageUrl: 'https://via.placeholder.com/600x400/333/666?text=Order+Management+Tool',
      ),
      RecentWork(
        id: '3',
        title: 'Glamour',
        description: 'A beauty and fashion e-commerce application with personalized recommendations, AR try-on features, and social sharing capabilities.',
        badgeText: 'Fashion',
        badgeColor: const Color(0xFF4CAF50),
        linkText: 'View More',
        linkUrl: 'https://github.com/kawserfdev/glamuare',
        imageUrl: 'https://via.placeholder.com/600x400/333/666?text=Glamour+App',
      ),
      RecentWork(
        id: '4',
        title: 'School Management System',
        description: 'A comprehensive school management solution with student records, attendance tracking, grade management, and parent communication features.',
        badgeText: 'Education',
        badgeColor: const Color(0xFF4CAF50),
        linkText: 'View More',
        linkUrl: 'https://github.com/kawserfdev/School-Management-System.git',
        imageUrl: 'https://via.placeholder.com/600x400/333/666?text=School+Management+System',
      ),
    ];
    
    for (final work in recentWorks) {
      await _firebaseService.addRecentWork(work);
    }
  }
  
  Future<void> seedCaseStudies() async {
    final caseStudies = [
      CaseStudy(
        id: '1',
        title: 'Shpper',
        description: 'A comprehensive shopping application built with Flutter, featuring user authentication, product browsing, cart management, and payment processing.',
        badgeText: 'Flutter App',
        badgeColor: const Color(0xFFFF9800),
        linkText: 'View Case Study',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.shpper.app',
      ),
      CaseStudy(
        id: '2',
        title: 'Venue Finder',
        description: 'A location-based service app that helps users find and book venues for events. Includes search filters, booking management, and payment integration.',
        badgeText: 'Mobile App',
        badgeColor: const Color(0xFF2196F3),
        linkText: 'View Case Study',
        linkUrl: 'https://play.google.com/store/apps/details?id=com.venuefinder.mobileapp',
      ),
      CaseStudy(
        id: '3',
        title: 'Fitness',
        description: 'A fitness tracking application with workout plans, progress monitoring, and personalized recommendations using Flutter.',
        badgeText: 'Fitness App',
        badgeColor: const Color(0xFF009688),
        linkText: 'View Case Study',
        linkUrl: 'https://github.com/kawserfdev/Fitness-master.git',
      ),
      CaseStudy(
        id: '4',
        title: 'Aladin',
        description: 'An e-commerce platform built with Flutter featuring product catalog, user profiles, order management, and payment processing.',
        badgeText: 'E-commerce',
        badgeColor: const Color(0xFFFF9800),
        linkText: 'View Case Study',
        linkUrl: 'https://github.com/kawserfdev/aladin.git',
      ),
    ];
    
    for (final caseStudy in caseStudies) {
      await _firebaseService.addCaseStudy(caseStudy);
    }
  }
  
  Future<void> seedTestimonials() async {
    final testimonials = [
      Testimonial(
        id: '1',
        name: 'Mohammad Akash',
        position: 'CEO, GhorerBazar',
        testimonial: 'Kawser has been instrumental in developing our mobile app from scratch. His expertise in Flutter and attention to detail resulted in a high-quality application that our customers love. His ability to solve complex problems efficiently makes him a valuable asset to any development team.',
      ),
      Testimonial(
        id: '2',
        name: 'Sarah Khan',
        position: 'Product Manager, Shpper',
        testimonial: 'Working with Kawser on the Shpper app was a great experience. He quickly grasped our requirements and implemented features that exceeded our expectations. His knowledge of Flutter and various integration points made our app development process smooth.',
      ),
      Testimonial(
        id: '3',
        name: 'Mahmud Hasan',
        position: 'CTO, RBF Tech Zone',
        testimonial: 'As an intern at our company, Kawser showed exceptional potential and quickly adapted to our development processes. His dedication to learning and problem-solving skills led to his promotion to a junior developer role in record time.',
      ),
      Testimonial(
        id: '4',
        name: 'Raisa Ahmed',
        position: 'Product Owner, GhorerBazar',
        testimonial: 'Kawser\'s implementation of our partial payment system was flawless. He understood the complex business requirements and translated them into an intuitive user interface that simplified the payment process for our customers.',
      ),
    ];
    
    for (final testimonial in testimonials) {
      await _firebaseService.addTestimonial(testimonial);
    }
  }
  
  Future<void> seedSkills() async {
    final skills = [
      SkillCategory(
        id: '1',
        title: 'Languages & Frameworks',
        skills: ['Dart', 'Flutter', 'HTML', 'CSS', 'C', 'Python'],
      ),
      SkillCategory(
        id: '2',
        title: 'State Management',
        skills: ['Provider', 'Riverpod', 'GetX'],
      ),
      SkillCategory(
        id: '3',
        title: 'Backend Integration',
        skills: ['Firebase (Auth, Firestore, Messaging)', 'REST API'],
      ),
      SkillCategory(
        id: '4',
        title: 'Development Tools',
        skills: ['VS Code', 'Android Studio', 'Git', 'GitHub'],
      ),
    ];
    
    for (final skill in skills) {
      await _firebaseService.addSkill(skill);
    }
  }
  
  // Call this method to seed all data
  Future<void> seedAllData() async {
    await seedRecentWorks();
    await seedCaseStudies();
    await seedTestimonials();
    await seedSkills();
  }
}