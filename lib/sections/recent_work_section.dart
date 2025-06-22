import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:kawser/providers/providers.dart'; // Import providers
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';
import '../models/recent_work.dart'; // Import RecentWork model

class RecentWorkSection extends ConsumerWidget { // Changed to ConsumerWidget
  const RecentWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Added WidgetRef ref
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final recentWorksAsync = ref.watch(recentWorksProvider); // Watch the provider

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundColor, // Consider making this dynamic if needed
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Recent Work"),
              const SizedBox(height: 24),
              recentWorksAsync.when(
                data: (recentWorks) {
                  if (recentWorks.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("No recent work available at the moment.", style: AppTheme.bodyTextStyle),
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
                      childAspectRatio: isMobile ? 0.8 : 0.85, // Adjusted aspect ratio
                    ),
                    itemCount: recentWorks.length,
                    itemBuilder: (context, index) {
                      final work = recentWorks[index];
                      return CaseCard(
                        badge: CaseBadge(
                          text: work.badgeText,
                          // Assuming badgeColorHex is a string like '#RRGGBB' or 'RRGGBB'
                          color: Color(int.parse(work.badgeColorHex.replaceFirst('#', '0xff'))),
                        ),
                        title: work.title,
                        description: work.description,
                        linkText: work.linkText ?? 'View More',
                        linkUrl: work.linkUrl,
                        imageUrl: work.imageUrl,
                        isRecentWork: true,
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
                    child: Text('Error loading recent work: $err', style: const TextStyle(color: Colors.red)),
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
