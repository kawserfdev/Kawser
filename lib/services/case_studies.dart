// In firebase_service.dart
import 'dart:nativewrappers/_internal/vm/lib/developer.dart' as LoggingService;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kawser/models/case_study.dart';


Stream<List<CaseStudy>> getCaseStudies() {
  LoggingService.log('Fetching case studies from Firestore...');
  
  return _caseStudiesCollection
      .orderBy('createdAt', descending: true)
      .snapshots()
      .handleError((error) {
        LoggingService.error('Error fetching case studies', error);
        throw error; // Rethrow so the UI can handle it
      })
      .map((snapshot) {
        try {
          final studies = snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            LoggingService.log('Processing case study: ${doc.id}');
            
            // Handle the timestamp conversion
            if (data['createdAt'] != null && data['createdAt'] is Timestamp) {
              data['createdAt'] = (data['createdAt'] as Timestamp).toDate().toIso8601String();
            }
            
            if (data['updatedAt'] != null && data['updatedAt'] is Timestamp) {
              data['updatedAt'] = (data['updatedAt'] as Timestamp).toDate().toIso8601String();
            }
            
            // Make sure badgeColor is properly handled
            if (data['badgeColor'] is Map) {
              // If color is stored as an RGB map
              final Map colorMap = data['badgeColor'] as Map;
              data['badgeColor'] = Color.fromRGBO(
                colorMap['r'] ?? 0, 
                colorMap['g'] ?? 0, 
                colorMap['b'] ?? 0, 
                colorMap['a'] ?? 1.0
              ).value;
            }
            
            return CaseStudy.fromJson({
              'id': doc.id,
              ...data,
            });
          }).toList();
          
          LoggingService.log('Fetched ${studies.length} case studies');
          return studies;
        } catch (e, stackTrace) {
          LoggingService.error('Error processing case studies', e, stackTrace);
          rethrow; // Rethrow so the UI can handle it
        }
      });
}