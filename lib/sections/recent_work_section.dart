import 'package:flutter/material.dart';
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class RecentWorkSection extends StatelessWidget {
  const RecentWorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    
    final recentWorks = [
      {
        'badge': CaseBadge(text: 'E-commerce', color: AppTheme.primaryColor),
        'title': 'GhorerBazar App',
        'description': 'A complete e-commerce solution for GhorerBazar, featuring product browsing, cart management, order tracking, and partial payment processing.',
        'linkText': 'View More',
        'linkUrl': '#',
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/profile-website-25647.appspot.com/o/projects%2FHero.png?alt=media&token=c6681c30-c498-4e67-87af-d23612b4dbe4',
      },
      {
        'badge': CaseBadge(text: 'Management Tool', color: AppTheme.primaryColor),
        'title': 'Order Management Tool',
        'description': 'An internal tool for GhorerBazar operations team to manage customer orders, process payments, and track delivery status in real-time.',
        'linkText': 'View More',
        'linkUrl': '#',
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/profile-website-25647.appspot.com/o/projects%2Fshpper.png?alt=media&token=4c25d0e6-c539-4bd5-ab8c-ca4c7e498032',
      },
      {
        'badge': CaseBadge(text: 'Fashion', color: AppTheme.primaryColor),
        'title': 'Glamour',
        'description': 'A beauty and fashion e-commerce application with personalized recommendations, AR try-on features, and social sharing capabilities.',
        'linkText': 'View More',
        'linkUrl': 'https://github.com/kawserfdev/glamuare',
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/profile-website-25647.appspot.com/o/projects%2Fshpper.png?alt=media&token=4c25d0e6-c539-4bd5-ab8c-ca4c7e498032',
      },
      {
        'badge': CaseBadge(text: 'Education', color: AppTheme.primaryColor),
        'title': 'School Management System',
        'description': 'A comprehensive school management solution with student records, attendance tracking, grade management, and parent communication features.',
        'linkText': 'View More',
        'linkUrl': 'https://github.com/kawserfdev/School-Management-System.git',
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/profile-website-25647.appspot.com/o/projects%2Fshpper.png?alt=media&token=4c25d0e6-c539-4bd5-ab8c-ca4c7e498032',
      },
    ];
    
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
              GridView.builder(
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
                    badge: work['badge'] as CaseBadge,
                    title: work['title'] as String,
                    description: work['description'] as String,
                    linkText: work['linkText'] as String,
                    linkUrl: work['linkUrl'] as String,
                    imageUrl: work['imageUrl'] as String,
                    isRecentWork: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}