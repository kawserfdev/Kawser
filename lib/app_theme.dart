import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color cardBackgroundColor = Color(0xFF1E1E1E);
  static const Color secondaryBackgroundColor = Color(0xFF1A1A1A);
  static const Color darkBackgroundColor = Color(0xFF0F0F0F);
  static const Color textColor = Color(0xFFF5F5F5);
  static const Color textSecondaryColor = Color(0xFFBDBDBD);
  
  // Badge Colors
  static const Color orangeBadgeColor = Color(0xFFFF9800);
  static const Color blueBadgeColor = Color(0xFF2196F3);
  static const Color tealBadgeColor = Color(0xFF009688);
  
  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  
  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: textColor,
  );
  
  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: textSecondaryColor,
  );
  
  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  
  // Button Style
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
    ),
  );
}