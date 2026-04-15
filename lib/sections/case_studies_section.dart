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
        'badge': CaseBadge(text: 'Mobile App', color: AppTheme.blueBadgeColor),
        'title': 'Guptodhan',
        'description':
            'This project focuses on building a community-driven multi-vendor marketplace that goes beyond traditional e-commerce by integrating trust, accessibility, and social impact into a single platform. The application enables users to explore a wide range of quality-assured products from verified sellers across the country, while also providing a seamless system to buy and sell used items through free local listings. In addition, it introduces an on-demand service module where users can easily hire verified professionals such as plumbers, electricians, and technicians without the hassle of manual searching. A key differentiator of the platform is its humanitarian donation system, allowing users to either request assistance or contribute money and essential goods with full transparency. By combining commerce, services, and social responsibility, the app creates a holistic ecosystem that empowers users, supports local businesses, and fosters a trustworthy digital community.',
        
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.codeandpixel.guptodhan&pcampaignid=web_share',
      },
      {
        'badge': CaseBadge(text: 'Mobile App', color: AppTheme.primaryColor),
        'title': 'Bhumi',
        'description':
            'The Digital Land Management App is designed to modernize and digitize land-related services, reducing manual processes, corruption, and inefficiencies. The application provides a centralized platform for citizens, government officials, and stakeholders to access, manage, and process land information seamlessly.',
        'features': [
          'Real-time land record access',
          'Online mutation (ownership transfer)',
          'Automated tax calculation and payment',
          'Transparent and traceable processes',
        ],
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.minland.bhumi&pcampaignid=web_share',
      },
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
        'badge': CaseBadge(text: 'Flutter App', color: AppTheme.blueBadgeColor),
        'title': 'eCourt',
        'description':
            'A Flutter-based mobile application for Bangladesh eCourt system, streamlining case registration, hearing schedules, and digital court services.',
        'linkText': 'View Website',
        'linkUrl': 'https://ecourt.gov.bd/',
      },
      {
        'badge': CaseBadge(text: 'HRM App', color: AppTheme.tealBadgeColor),
        'title': 'Smart HRM',
        'description':
            'A human resource management mobile application providing attendance tracking, payroll, leave management, and performance monitoring.',
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.mysoftheaven.smarthrm&hl=en',
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
        'badge': CaseBadge(text: 'Admin Web', color: AppTheme.blueBadgeColor),
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
