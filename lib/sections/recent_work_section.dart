import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../models/recent_work.dart';
import '../providers/providers.dart';
import '../responsive_helper.dart';

class RecentWorkSection extends ConsumerWidget {
  const RecentWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final recentWorksAsyncValue = ref.watch(recentWorksProvider);

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
              const SectionTitle(title: "Recent Work"),
              const SizedBox(height: 24),
              recentWorksAsyncValue.when(
                data: (recentWorks) {
                  return SingleChildScrollView(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 1 : 2,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: isMobile ? 0.8 : 0.8,
                      ),
                      itemCount: recentWorks.length,
                      itemBuilder: (context, index) {
                        final work = recentWorks[index];
                        return CaseCard(
                          badge: CaseBadge(
                              text: work.badgeText, color: work.badgeColor),
                          title: work.title,
                          description: work.description,
                          linkText: 'View More', // Assuming this is static or part of the model
                          linkUrl: work.linkUrl,
                          imageUrl: work.imageUrl,
                          isRecentWork: true,
                        );
                      },
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Error loading recent works: $error')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
