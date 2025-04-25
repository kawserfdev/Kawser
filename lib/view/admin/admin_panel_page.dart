import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/app_theme.dart';
import 'package:kawser/providers/providers.dart';
import 'package:kawser/view/admin/forms/case_study_form.dart';
import 'package:kawser/view/admin/forms/recent_work_form.dart';
import 'package:kawser/view/admin/forms/skill_form.dart';
import 'package:kawser/view/admin/forms/testimonial_form.dart';
import 'package:kawser/view/admin/seed_data.dart';
import 'tabs/case_studies_tab.dart';
import 'tabs/recent_works_tab.dart';
import 'tabs/skills_tab.dart';
import 'tabs/testimonials_tab.dart';


class AdminPanel extends ConsumerStatefulWidget {
  const AdminPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminPanelState();
}

class _AdminPanelState extends ConsumerState<AdminPanel> with SingleTickerProviderStateMixin {
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
            icon: const Icon(Icons.data_array),
            tooltip: 'Seed Data',
            onPressed: () {
              _showSeedDataDialog(context, ref);
            },
          ),
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
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





void _showSeedDataDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Seed Initial Data'),
          content: const Text(
            'This will add initial data to your portfolio. '
            'Only use this if your database is empty. '
            'Existing data with the same IDs will be overwritten.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final firebaseService = ref.read(firebaseServiceProvider);
                final seedGenerator = SeedDataGenerator(firebaseService);

                // Show loading indicator
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (context) => const AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Seeding data...'),
                          ],
                        ),
                      ),
                );

                // try {
                //   await seedGenerator.seedAllData();
                //   if () {
                //     Navigator.pop(context); // Dismiss loading dialog
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('Data seeded successfully!'),
                //       ),
                //     );
                //   }
                // } catch (e) {
                //   if (mounted) {
                //     Navigator.pop(context); // Dismiss loading dialog
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         content: Text('Error seeding data: ${e.toString()}'),
                //       ),
                //     );
                //   }
                // }
              },
              child: const Text('Seed Data'),
            ),
          ],
        ),
  );
}
