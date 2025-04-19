import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/providers/providers.dart';
import '../forms/testimonial_form.dart';

class TestimonialsTab extends ConsumerWidget {
  const TestimonialsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testimonialsStream = ref.watch(testimonialsProvider);
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: testimonialsStream.when(
          data: (testimonials) {
            if (testimonials.isEmpty) {
              return const Center(
                child: Text('No testimonials found. Add some using the + button.'),
              );
            }
            
            return ListView.builder(
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  color: AppTheme.cardBackgroundColor,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      testimonial.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(testimonial.position),
                        const SizedBox(height: 8),
                        Text(
                          testimonial.testimonial,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
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
                                builder: (_) => TestimonialForm(
                                  testimonial: testimonial,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _confirmDelete(context, testimonial.id);
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
        content: const Text('Are you sure you want to delete this testimonial?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Delete from Firestore
              final firebaseService = ProviderScope.containerOf(context).read(firebaseServiceProvider);
              firebaseService.deleteTestimonial(id);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}