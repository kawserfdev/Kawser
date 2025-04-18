import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../app_theme.dart';
import '../../providers/providers.dart';
import '../forms/recent_work_form.dart';

class RecentWorksTab extends ConsumerWidget {
  const RecentWorksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentWorksStream = ref.watch(recentWorksProvider);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: recentWorksStream.when(
          data: (recentWorks) {
            if (recentWorks.isEmpty) {
              return const Center(
                child: Text('No recent works found. Add some using the + button.'),
              );
            }
            
            return ListView.builder(
              itemCount: recentWorks.length,
              itemBuilder: (context, index) {
                final work = recentWorks[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: AppTheme.cardBackgroundColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      work.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(work.description),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: work.badgeColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            work.badgeText,
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
                                builder: (_) => RecentWorkForm(
                                  recentWork: work,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _confirmDelete(context, work.id);
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
              firebaseService.deleteRecentWork(id);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}