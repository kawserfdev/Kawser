  import 'package:flutter/material.dart';
import 'package:kawser/view/components/social_icons.dart';
import '../app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.secondaryBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          const SocialIcons(
            centered: true,
          ),
          const SizedBox(height: 24),
          Text(
            "© ${DateTime.now().year} Kawser Ahmed. All rights reserved.",
            style: const TextStyle(
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}