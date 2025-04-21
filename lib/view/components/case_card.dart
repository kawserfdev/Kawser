import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawser/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'primary_button.dart';

class CaseBadge {
  final String text;
  final Color color;

  CaseBadge({required this.text, required this.color});
}

class CaseCard extends StatelessWidget {
  final CaseBadge badge;
  final String title;
  final String description;
  final String? linkUrl;
  final String linkText;
  final String? imageUrl;
  final bool isRecentWork;

  const CaseCard({
    Key? key,
    required this.badge,
    required this.title,
    required this.description,
    this.linkUrl,
    required this.linkText,
    this.imageUrl,
    this.isRecentWork = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null && isRecentWork)
            // Image.network(
            //   imageUrl!,
            //   width: double.infinity,
            //   height: 200,
            //   fit: BoxFit.cover,
            // ),
            Image.asset(imageUrl!),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: badge.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    badge.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(color: AppTheme.textSecondaryColor),
                ),
                const SizedBox(height: 16),
                isRecentWork
                    ? PrimaryButton(
                      text: linkText,
                      onPressed: () {
                        if (linkUrl != null) {
                          launchUrl(Uri.parse(linkUrl!));
                        }
                      },
                    )
                    : InkWell(
                      onTap: () {
                        if (linkUrl != null) {
                          launchUrl(Uri.parse(linkUrl!));
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            linkText,
                            style: TextStyle(
                              color: badge.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            size: 14,
                            color: badge.color,
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
