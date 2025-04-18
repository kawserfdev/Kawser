import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'tabs/case_studies_tab.dart';
import 'tabs/recent_works_tab.dart';
import 'tabs/skills_tab.dart';
import 'tabs/testimonials_tab.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Admin'),
        backgroundColor: AppTheme.secondaryBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Recent Works'),
            Tab(text: 'Case Studies'),
            Tab(text: 'Testimonials'),
            Tab(text: 'Skills'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          RecentWorksTab(),
          CaseStudiesTab(),
          TestimonialsTab(),
          SkillsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(_tabController.index);
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
  
  void _showAddItemDialog(int tabIndex) {
    switch (tabIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RecentWorkForm()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CaseStudyForm()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TestimonialForm()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SkillForm()),
        );
        break;
    }
  }
}   