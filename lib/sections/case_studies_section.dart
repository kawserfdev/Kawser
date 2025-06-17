import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../models/case_study.dart'; // Ensure this model exists
import '../providers/providers.dart'; // Ensure this provider exists
import '../responsive_helper.dart';

class CaseStudiesSection extends ConsumerWidget {
  const CaseStudiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final caseStudiesAsyncValue = ref.watch(caseStudiesProvider);

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundColor,
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Case Studies"),
              caseStudiesAsyncValue.when(
                data: (caseStudies) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: isMobile ? 1.4 : 1.3,
                    ),
                    itemCount: caseStudies.length,
                    itemBuilder: (context, index) {
                      final caseStudy = caseStudies[index];
                      return CaseCard(
                        badge: CaseBadge(
                            text: caseStudy.badgeText,
                            color: caseStudy.badgeColor),
                        title: caseStudy.title,
                        description: caseStudy.description,
                        linkText: 'View Case Study', // Assuming this is static or part of the model
                        linkUrl: caseStudy.linkUrl,
                        // imageUrl is not used for case studies based on the original code
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Error loading case studies: $error')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
