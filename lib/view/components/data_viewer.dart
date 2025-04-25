// lib/admin/tools/data_viewer.dart

import 'dart:nativewrappers/_internal/vm/lib/developer.dart' as LoggingService;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class DataViewer extends ConsumerWidget {
  const DataViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseStudiesStream = ref.watch(caseStudiesProvider);
    final recentWorksStream = ref.watch(recentWorksProvider);
    final testimonialsStream = ref.watch(testimonialsProvider);
    final skillsStream = ref.watch(skillsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Data Viewer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDataSection(
              'Case Studies', 
              caseStudiesStream,
              (data) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final study = data[index];
                  return ListTile(
                    title: Text(study.title),
                    subtitle: Text(study.description),
                    trailing: CircleAvatar(
                      backgroundColor: study.badgeColor,
                      child: Text(
                        study.badgeText.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            _buildDataSection(
              'Recent Works', 
              recentWorksStream,
              (data) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final work = data[index];
                  return ListTile(
                    title: Text(work.title),
                    subtitle: Text(work.description),
                    // ignore: unnecessary_null_comparison
                    trailing: work.imageUrl != null && work.imageUrl.isNotEmpty
                        ? Image.network(
                            work.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => 
                                const Icon(Icons.broken_image),
                          )
                        : null,
                  );
                },
              ),
            ),
            const Divider(),
            _buildDataSection(
              'Testimonials', 
              testimonialsStream,
              (data) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final testimonial = data[index];
                  return ListTile(
                    title: Text(testimonial.name),
                    subtitle: Text(testimonial.position),
                    trailing: const Icon(Icons.format_quote),
                  );
                },
              ),
            ),
            const Divider(),
            _buildDataSection(
              'Skills', 
              skillsStream,
              (data) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final skill = data[index];
                  return ListTile(
                    title: Text(skill.title),
                    subtitle: Text(skill.skills.join(', ')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDataSection<T>(
    String title,
    AsyncValue<List<T>> stream,
    Widget Function(List<T> data) dataBuilder,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        stream.when(
          data: (data) {
            if (data.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No data available'),
              );
            }
            LoggingService.log('Displaying $title data: ${data.length} items');
            return dataBuilder(data);
          },
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stack) {
            //LoggingService.errr('Error in $title section', error, stack);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Error loading data:',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  Text(error.toString()),
                  const SizedBox(height: 8),
                  const Text('Stack trace:'),
                  const SizedBox(height: 4),
                  Text(
                    stack.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}