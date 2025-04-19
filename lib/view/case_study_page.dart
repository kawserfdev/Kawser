import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../models/case_study.dart';
import '../providers/providers.dart';
import '../responsive_helper.dart';

class CaseStudiesSection extends ConsumerWidget {
  const CaseStudiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final caseStudiesStream = ref.watch(caseStudiesProvider);
    
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
              caseStudiesStream.when(
                data: (caseStudies) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: isMobile ? 1.2 : 1.3,
                    ),
                    itemCount: caseStudies.length,
                    itemBuilder: (context, index) {
                      final caseStudy = caseStudies[index];
                      return CaseCard(
                        badge: CaseBadge(
                          text: caseStudy.badgeText,
                          color: caseStudy.badgeColor,
                        ),
                        title: caseStudy.title,
                        description: caseStudy.description,
                        linkText: caseStudy.linkText,
                        linkUrl: caseStudy.linkUrl,
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text('Error loading case studies: ${error.toString()}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}