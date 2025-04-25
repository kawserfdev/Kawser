import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kawser/sections/footer_section_page.dart';
import 'package:kawser/services/navigation_bar.dart' as nav;
import 'package:kawser/view/about_page.dart';
import 'app_theme.dart';
import 'routes.dart';
import 'sections/hero_section.dart';
import 'sections/experience_section.dart';
import 'sections/case_studies_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/recent_work_section.dart';
import 'sections/contact_section.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // In main.dart

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: AppTheme.backgroundColor,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // wait while animating
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const PortfolioHome()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background Color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/signature.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionKeys {
  static final Map<String, GlobalKey> keys = {
    'about': GlobalKey(),
    'case-studies': GlobalKey(),
    'testimonials': GlobalKey(),
    'recent-work': GlobalKey(),
    'contact': GlobalKey(),
  };

  // Optionally, provide a method to fetch a key by section name
  static GlobalKey? getKey(String section) => keys[section];
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

  // void scrollToSection(String section) {
  //     final key = SectionKeys.getKey(section); // Use the centralized keys
  //     if (key?.currentContext != null) {
  //       Scrollable.ensureVisible(
  //         key!.currentContext!,
  //         duration: const Duration(milliseconds: 800),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   }
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
          nav.NavigationBar(onSectionSelected: scrollToSection),
        ],
      ),
    );
  }
}
