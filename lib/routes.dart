import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kawser/view/admin/adminLogin_page.dart';
import 'package:kawser/view/admin/admin_panel_page.dart';


class AppRoutes {
  static const String home = '/';
  static const String admin = '/admin';
  static const String adminPanel = '/admin/panel';
  static const String dataViewer = '/admin/data-viewer';

  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case admin:
        return MaterialPageRoute(builder: (_) => const AdminLogin());
      case adminPanel:
        // Check if user is authenticated
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          return MaterialPageRoute(builder: (_) => const AdminPanel());
        } else {
          return MaterialPageRoute(builder: (_) => const AdminLogin());
        }
        case dataViewer:
  return MaterialPageRoute(builder: (_) => const DataViewer());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
  
  static void navigateToAdmin(BuildContext context) {
    Navigator.pushNamed(context, admin);
  }
}