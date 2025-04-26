import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/view/components/section_title.dart';
import 'package:kawser/view/components/testimonial_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../providers/providers.dart';
import '../responsive_helper.dart';

class TestimonialsSection extends ConsumerWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final testimonialsStream = ref.watch(testimonialsProvider);

    return Container(
      width: double.infinity,
      color: const Color(0xFF191919),
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Testimonials"),

              testimonialsStream.when(
                data: (testimonials) {
                  if (testimonials.isEmpty) {
                    SizedBox(
                      child: Image.asset('assets/images/coming-soon.jpg'),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: isMobile ? 1.2 : 1.2,
                    ),
                    itemCount: testimonials.length,
                    itemBuilder: (context, index) {
                      final testimonial = testimonials[index];
                      return TestimonialCard(
                        testimonial: testimonial.testimonial,
                        name: testimonial.name,
                        position: testimonial.position,
                        onTap: () async {
                          final Uri url = Uri.parse(testimonial.imageUrl!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                      );
                    },
                  );
                },
                loading:
                    () => const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.primaryColor,
                        ),
                      ),
                    ),
                error:
                    (error, stackTrace) => Center(
                      child: Text(
                        'Error loading testimonials: ${error.toString()}',
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
