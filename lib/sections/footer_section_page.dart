import 'package:flutter/material.dart';
import 'package:kawser/view/components/social_icons.dart';
import '../app_theme.dart';
import '../routes.dart';

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
          const SocialIcons(centered: true),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "© ${DateTime.now().year} Kawser Ahmed. All rights reserved.",
                style: const TextStyle(color: AppTheme.textSecondaryColor),
              ),
              // Hidden admin link
              InkWell(
                onTap: () {
                  AppRoutes.navigateToAdmin(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 6.0),
                  child: Text(
                    "•",
                    style: TextStyle(color: AppTheme.textSecondaryColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            "Built with Flutter",
            style: TextStyle(color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }
}
