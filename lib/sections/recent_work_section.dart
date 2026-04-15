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
        'badge': CaseBadge(
          text: 'Community-Driven Marketplace',
          color: AppTheme.blueBadgeColor,
        ),
        'title': 'Guptodhon',
        'description':
            'Guptodhon is a community-driven multi-vendor marketplace built on trust, quality, and social responsibility. Multi-vendor shopping: Browse thousands of new products from verified sellers nationwide. From fashion and electronics to essentials, we ensure quality and authenticity with every click. Buy and sell used products: Turn your favorite items into cash. Post free ads for phones, bikes, furniture, or laptops and connect directly with buyers in your area. On-Demand Expert Services: Need a plumber, electrician or AC technician? Skip the search and hire verified local experts through our seamless service booking system.Donate for Humanity: Make a real impact. Our unique donation portal allows you to request help or donate money and essential items with 100% transparency.',
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.codeandpixel.guptodhan&pcampaignid=web_share',
        'imageUrl': 'assets/images/guptodhan.png',
      }, //assets/images/guptodhan.png
      {
        'badge': CaseBadge(
          text: ' Land Services at One Address',
          color: AppTheme.primaryColor,
        ),
        'title': 'Bhumi',
        'description':
            '1. Detailed information about land, registration, determination of land development tax – everything can now be done online in a completely digital and automated manner. 2. The system automatically determines the tax by considering all the land class, location, use, ceiling, late fee and provides online payment facility. 3. Step-by-step online procedures, real-time notifications and digital management make land services easier and reduce the suffering of the people.',
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.minland.bhumi&pcampaignid=web_share',
        'imageUrl': 'assets/images/bhumi.png',
      },
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
        'badge': CaseBadge(
          text: 'School Management App',
          color: AppTheme.primaryColor,
        ),
        'title': 'Learning Campus',
        'description':
            'A complete school management app with student records, attendance, results, fees, staff management, and real-time communication.',
        'linkText': 'View More',
        'linkUrl': '',
        'imageUrl': 'assets/images/learning-campus.png',
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
        'imageUrl': 'assets/images/omtppm.png',
      },
      {
        'badge': CaseBadge(text: 'Fashion', color: AppTheme.primaryColor),
        'title': 'Glamour',
        'description':
            'A beauty and fashion e-commerce application with personalized recommendations, AR try-on features, and social sharing capabilities.',
        'linkText': 'View More',
        'linkUrl': 'https://github.com/kawserfdev/glamuare',
        'imageUrl': 'assets/images/glamuare.png',
      },
      // {
      //   'badge': CaseBadge(text: 'E-Commerce Platform', color: AppTheme.primaryColor),
      //   'title': 'Aladin',
      //   'description':
      //       'Aladin is a UAE-based shopping platform that focuses on curated deals and offers across a wide range of product categories, from electronics and fashion to home goods and wellness. The brand targets price-conscious consumers who want premium products at competitive prices. As part of their growth strategy, Aladin aimed to establish a mobile-first, scalable eCommerce website that delivers a fast, intuitive shopping experience for users across the UAE and beyond.',
      //   'linkText': 'View More',
      //   'linkUrl': 'https://www.royex.ae/case-studies/dealzin/',
      //   'imageUrl': 'assets/images/aladin.png',
      // },
      {
        'badge': CaseBadge(text: 'Flutter App', color: AppTheme.primaryColor),
        'title': 'E-Court',
        'description':
            'A Flutter-based mobile application designed for the Bangladesh eCourt system, aimed at enhancing efficiency and accessibility in judicial processes. The platform streamlines key functionalities such as case registration, hearing scheduling, and access to digital court services. It enables organizations to seamlessly file lawsuits and appeals, while also providing real-time updates on the status of ongoing cases and appeals.',
        'linkText': 'View Website',
        'linkUrl': 'https://ecourt.gov.bd/',
        'imageUrl': 'assets/images/e-court.png',
      },
      {
        'badge': CaseBadge(text: 'HRM App', color: AppTheme.primaryColor),
        'title': 'Sheba ERP',
        'description':
            'A human resource management mobile application providing attendance tracking, payroll, leave management, and performance monitoring.',
        'linkText': 'View on Play Store',
        'linkUrl':
            'https://play.google.com/store/apps/details?id=com.mysoftheaven.shebaerp',
        'imageUrl': 'assets/images/hrm.png',
      },
      {
        'badge': CaseBadge(
          text: 'Learning Platform',
          color: AppTheme.primaryColor,
        ),
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
        'imageUrl': 'assets/images/testify-admin.png',
      },
      {
        'badge': CaseBadge(
          text: 'Flutter Plugin',
          color: AppTheme.primaryColor,
        ),
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
