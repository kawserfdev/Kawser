import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kawser/sections/footer_section_page.dart';
import 'package:kawser/view/about_page.dart';
import 'app_theme.dart';
import 'firebase_options.dart';
import 'responsive_helper.dart';
import 'routes.dart';
import 'sections/navigation_bar.dart' as nav;
import 'sections/hero_section.dart';
import 'sections/experience_section.dart';
import 'sections/case_studies_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/recent_work_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: PortfolioApp()));
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kawser Ahmed - Mobile App Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primaryColor,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        scaffoldBackgroundColor: AppTheme.backgroundColor,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
      home: const PortfolioHome(),
    );
  }
}



class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();
  
  // Scroll section controllers for navigation
  final Map<String, GlobalKey> sectionKeys = {
    'about': GlobalKey(),
    'case-studies': GlobalKey(),
    'testimonials': GlobalKey(),
    'recent-work': GlobalKey(),
    'contact': GlobalKey(),
  };

  void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(scrollToContact: () => scrollToSection('contact')),
                AboutSection(key: sectionKeys['about']),
                const ExperienceSection(),
                CaseStudiesSection(key: sectionKeys['case-studies']),
                TestimonialsSection(key: sectionKeys['testimonials']),
                RecentWorkSection(key: sectionKeys['recent-work']),
                ContactSection(key: sectionKeys['contact']),
                const FooterSection(),
              ],
            ),
          ),
          nav.NavigationBar(
            onSectionSelected: scrollToSection,
          ),
        ],
      ),
    );
  }
}