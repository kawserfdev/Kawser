import 'package:flutter/material.dart';
import 'package:kawser/view/components/case_card.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class CaseStudiesSection extends StatelessWidget {
  const CaseStudiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);

    final caseStudies = [
  {
    'badge': CaseBadge(
      text: 'Flutter App',
      color: AppTheme.orangeBadgeColor,
    ),
    'title': 'Shpper',
    'description':
        'A comprehensive shopping application built with Flutter, featuring user authentication, product browsing, cart management, and payment processing.',
    'linkText': 'View on Play Store',
    'linkUrl':
        'https://play.google.com/store/apps/details?id=com.shpper.app',
  },
  {
    'badge': CaseBadge(text: 'Mobile App', color: AppTheme.blueBadgeColor),
    'title': 'Venue Finder',
    'description':
        'A location-based service app that helps users find and book venues for events. Includes search filters, booking management, and payment integration.',
    'linkText': 'View on Play Store',
    'linkUrl':
        'https://play.google.com/store/apps/details?id=com.venuefinder.mobileapp',
  },
  {
    'badge': CaseBadge(text: 'Fitness App', color: AppTheme.tealBadgeColor),
    'title': 'Fitness',
    'description':
        'A fitness tracking application with workout plans, progress monitoring, and personalized recommendations using Flutter.',
    'linkText': 'View Case Study',
    'linkUrl': 'https://github.com/kawserfdev/Fitness-master.git',
  },
  // {
  //   'badge': CaseBadge(
  //     text: 'E-commerce',
  //     color: AppTheme.orangeBadgeColor,
  //   ),
  //   'title': 'Aladin',
  //   'description':
  //       'An e-commerce platform built with Flutter featuring product catalog, user profiles, order management, and payment processing.',
  //   'linkText': 'View Case Study',
  //   'linkUrl': 'https://github.com/kawserfdev/aladin.git',
  // },
  {
    'badge': CaseBadge(
      text: 'Flutter App',
      color: AppTheme.blueBadgeColor,
    ),
    'title': 'eCourt',
    'description':
        'A Flutter-based mobile application for Bangladesh eCourt system, streamlining case registration, hearing schedules, and digital court services.',
    'linkText': 'View Website',
    'linkUrl': 'https://ecourt.gov.bd/',
  },
  {
    'badge': CaseBadge(
      text: 'HRM App',
      color: AppTheme.tealBadgeColor,
    ),
    'title': 'Smart HRM',
    'description':
        'A human resource management mobile application providing attendance tracking, payroll, leave management, and performance monitoring.',
    'linkText': 'View on Play Store',
    'linkUrl': 'https://play.google.com/store/apps/details?id=com.mysoftheaven.smarthrm&hl=en',
  },
  {
    'badge': CaseBadge(
      text: 'Learning Platform',
      color: AppTheme.orangeBadgeColor,
    ),
    'title': 'Testify App',
    'description':
        'A mobile learning platform for medical students. Offers practice questions, mock tests, progress tracking, and exam preparation tools.',
    'linkText': 'View Case Study',
    'linkUrl': '#',
  },
  {
    'badge': CaseBadge(
      text: 'Admin Web',
      color: AppTheme.blueBadgeColor,
    ),
    'title': 'Testify Admin',
    'description':
        'A web-based admin panel for managing medical learning platform content. Includes question management, user tracking, analytics, and reporting.',
    'linkText': 'View Case Study',
    'linkUrl': '#',
  },
  {
    'badge': CaseBadge(
      text: 'Flutter Plugin',
      color: AppTheme.tealBadgeColor,
    ),
    'title': 'Fingerprint Scanner Plugin',
    'description':
        'A comprehensive Flutter plugin for fingerprint scanning. Provides an easy-to-use API for biometric authentication and supports various fingerprint devices.',
    'linkText': 'View Repository',
    'linkUrl': '#',
  },
];
;

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
              GridView.builder(
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
                    badge: caseStudy['badge'] as CaseBadge,
                    title: caseStudy['title'] as String,
                    description: caseStudy['description'] as String,
                    linkText: caseStudy['linkText'] as String,
                    linkUrl: caseStudy['linkUrl'] as String,
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
