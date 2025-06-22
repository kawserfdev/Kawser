import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:kawser/providers/providers.dart'; // Import providers
import 'package:kawser/view/components/section_title.dart';
import 'package:kawser/view/components/testimonial_card.dart';
import '../app_theme.dart'; // Import AppTheme for colors
import '../responsive_helper.dart';
import '../models/testimonial.dart'; // Import Testimonial model

class TestimonialsSection extends ConsumerWidget { // Changed to ConsumerWidget
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Added WidgetRef ref
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final testimonialsAsync = ref.watch(testimonialsProvider); // Watch the provider

    return Container(
      width: double.infinity,
      color: const Color(0xFF191919), // Consider making this dynamic
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Testimonials"),
              testimonialsAsync.when(
                data: (testimonials) {
                  if (testimonials.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("No testimonials available at the moment.", style: AppTheme.bodyTextStyle),
                      ),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: isMobile ? 1.0 : 1.2, // Adjusted aspect ratio
                    ),
                    itemCount: testimonials.length,
                    itemBuilder: (context, index) {
                      final testimonial = testimonials[index];
                      return TestimonialCard(
                        testimonial: testimonial.testimonial,
                        name: testimonial.name,
                        position: testimonial.position,
                        imageUrl: testimonial.imageUrl, // Pass imageUrl to TestimonialCard
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                    ),
                  ),
                ),
                error: (err, stack) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Error loading testimonials: $err', style: const TextStyle(color: Colors.red)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
