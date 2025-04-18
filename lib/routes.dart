import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'admin/admin_login.dart';
import 'admin/admin_panel.dart';

class AppRoutes {
  static const String home = '/';
  static const String admin = '/admin';
  static const String adminPanel = '/admin/panel';
  
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