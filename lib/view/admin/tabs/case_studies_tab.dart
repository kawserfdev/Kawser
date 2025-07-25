import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/providers/providers.dart';
import '../forms/case_study_form.dart';

class CaseStudiesTab extends ConsumerWidget {
  const CaseStudiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseStudiesStream = ref.watch(caseStudiesProvider);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: caseStudiesStream.when(
          data: (caseStudies) {
            if (caseStudies.isEmpty) {
              return const Center(
                child: Text('No case studies found. Add some using the + button.'),
              );
            }
            
            return ListView.builder(
              itemCount: caseStudies.length,
              itemBuilder: (context, index) {
                final caseStudy = caseStudies[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: AppTheme.cardBackgroundColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      caseStudy.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(caseStudy.description),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: caseStudy.badgeColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            caseStudy.badgeText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CaseStudyForm(
                                  caseStudy: caseStudy,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _confirmDelete(context, caseStudy.id);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error: ${error.toString()}'),
          ),
        ),
      ),
    );
  }
  
  void _confirmDelete(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Delete from Firestore
              final firebaseService = ProviderScope.containerOf(context).read(firebaseServiceProvider);
              firebaseService.deleteCaseStudy(id);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
