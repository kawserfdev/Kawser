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
    'badge': CaseBadge(text: 'P2P platform', color: AppTheme.primaryColor),
    'title': 'Shpper',
    'description':
        'Shpper is a P2P platform that connects senders and shoppers with travelers as couriers, turning daily flights into a global delivery fleet. Beyond shipping, users can act as personal shoppers, offering destination-based products. We aim to create a borderless, eco-friendly, and affordable marketplace for global shipping and shopping.',
    'linkText': 'View More',
    'linkUrl':
        'https://play.google.com/store/apps/details?id=com.shpper.app&pcampaignid=web_share',
    'imageUrl': 'assets/images/shpper.png',
  },
  {
    'badge': CaseBadge(
      text: 'Hotel booking platform',
      color: AppTheme.primaryColor,
    ),
    'title': 'Venue Finder',
    'description':
        'Venue Finder is the ultimate solution for finding and booking venues tailored to your specific needs. Whether youre planning a corporate meeting, wedding, or special event, our app offers a variety of spaces from small rooms for a few attendees to large venues that can accommodate hundreds',
    'linkText': 'View More',
    'linkUrl':
        'https://play.google.com/store/apps/details?id=com.venuefinder.mobileapp&pcampaignid=web_share',
    'imageUrl': 'assets/images/venue_finder.jpg',
  },
  {
    'badge': CaseBadge(text: 'E-commerce', color: AppTheme.primaryColor),
    'title': 'GhorerBazar App',
    'description':
        'A complete e-commerce solution for GhorerBazar, featuring product browsing, cart management, order tracking, and partial payment processing.',
    'linkText': 'View More',
    'linkUrl': 'https://ghorerbazar.com/',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(
      text: 'Management Tool',
      color: AppTheme.primaryColor,
    ),
    'title': 'Order Management Tool',
    'description':
        'An internal tool for GhorerBazar operations team to manage customer orders, process payments, and track delivery status in real-time.',
    'linkText': 'View More',
    'linkUrl': 'https://ghorerbazar.com/',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(text: 'Fashion', color: AppTheme.primaryColor),
    'title': 'Glamour',
    'description':
        'A beauty and fashion e-commerce application with personalized recommendations, AR try-on features, and social sharing capabilities.',
    'linkText': 'View More',
    'linkUrl': 'https://github.com/kawserfdev/glamuare',
    'imageUrl': 'assets/images/github-logo.jpg',
  },
  {
    'badge': CaseBadge(text: 'Education', color: AppTheme.primaryColor),
    'title': 'School Management System',
    'description':
        'A comprehensive school management solution with student records, attendance tracking, grade management, and parent communication features.',
    'linkText': 'View More',
    'linkUrl': 'https://github.com/kawserfdev/School-Management-System.git',
    'imageUrl': 'assets/images/github-logo.jpg',
  },
  {
    'badge': CaseBadge(text: 'Flutter App', color: AppTheme.primaryColor),
    'title': 'eCourt',
    'description':
        'A Flutter-based mobile application for Bangladesh eCourt system, streamlining case registration, hearing schedules, and digital court services.',
    'linkText': 'View Website',
    'linkUrl': 'https://ecourt.gov.bd/',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(text: 'HRM App', color: AppTheme.primaryColor),
    'title': 'Smart HRM',
    'description':
        'A human resource management mobile application providing attendance tracking, payroll, leave management, and performance monitoring.',
    'linkText': 'View on Play Store',
    'linkUrl': 'https://play.google.com/store/apps/details?id=com.mysoftheaven.smarthrm&hl=en',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(text: 'Learning Platform', color: AppTheme.primaryColor),
    'title': 'Testify App',
    'description':
        'A mobile learning platform for medical students. Offers practice questions, mock tests, progress tracking, and exam preparation tools.',
    'linkText': 'View Case Study',
    'linkUrl': '#',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(text: 'Admin Web', color: AppTheme.primaryColor),
    'title': 'Testify Admin',
    'description':
        'A web-based admin panel for managing medical learning platform content. Includes question management, user tracking, analytics, and reporting.',
    'linkText': 'View Case Study',
    'linkUrl': '#',
    'imageUrl': 'assets/images/coming-soon.jpg',
  },
  {
    'badge': CaseBadge(text: 'Flutter Plugin', color: AppTheme.primaryColor),
    'title': 'Fingerprint Scanner Plugin',
    'description':
        'A comprehensive Flutter plugin for fingerprint scanning. Provides an easy-to-use API for biometric authentication and supports various fingerprint devices.',
    'linkText': 'View Repository',
    'linkUrl': '#',
    'imageUrl': 'assets/images/github-logo.jpg',
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
              const SizedBox(height: 24),

              SingleChildScrollView(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
