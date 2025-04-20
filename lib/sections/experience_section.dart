import 'package:flutter/material.dart';
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = ResponsiveHelper.getContainerWidth(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFF141414),
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Professional Experience"),
              const SizedBox(height: 20),
              _buildExperienceItem(
                context: context,
                title: "Mobile App Developer",
                company: "Ghorer Bazar, Rampura, Banasree, Dhaka",
                period: "December 2024 - Present",
                description:
                    "As the sole mobile app developer at GhorerBazar, I am responsible for the full-cycle development, enhancement, and maintenance of the company's two core applications:",
                responsibilities: [
                  "Developing and maintaining GhorerBazar Customer App – the main Flutter-based mobile application that powers the user-facing shopping experience.",
                  "Building and maintaining Order Management Tool – an internal application used by the operations team to manage orders, including partial payment handling.",
                  "Building and refining the Partial Payment Module to support flexible customer payment flows.",
                  "Ensuring consistent performance, stability, and security across all mobile platforms.",
                  "Working closely with the founding/development team to implement business logic and UI/UX improvements.",
                ],
                borderColor: AppTheme.primaryColor,
                badgeColor: const Color(0xFF2E7D32),
              ),
              const SizedBox(height: 40),
              _buildExperienceItem(
                context: context,
                title: "Junior Flutter Developer",
                company: "Shpper, Dubai Silicon Oasis & Uttar Badda, Dhaka",
                period: "February 2024 – November 2024",
                description:
                    "Integral to the development team working on creating, maintaining, and improving the Flutter app and admin website that supports Shpper services.",
                responsibilities: [
                  "Implemented Provider state management for efficient app performance",
                  "Integrated Firebase notifications for real-time user updates",
                  "Implemented Google location searching functionality",
                ],
                borderColor: const Color(0xFF2196F3),
                badgeColor: const Color(0xFF1565C0),
              ),
              const SizedBox(height: 40),
              _buildExperienceItem(
                context: context,
                title: "Intern and Junior Flutter Developer",
                company: "RBF Tech Zone Ltd., Dhaka",
                period: "January 2023 – December 2023",
                description:
                    "Started as an intern from January to July 2023, then promoted to Junior Flutter Developer from August to December 2023. Gained fundamental Flutter development skills and contributed to company projects.",
                responsibilities: [],
                borderColor: const Color(0xFFFF9800),
                badgeColor: const Color(0xFFEF6C00),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required BuildContext context,
    required String title,
    required String company,
    required String period,
    required String description,
    required List<String> responsibilities,
    required Color borderColor,
    required Color badgeColor,
  }) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: borderColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                ),
              ),
              if (!isMobile)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    period,
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
            ],
          ),
          if (isMobile) const SizedBox(height: 4),
          if (isMobile)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                period,
                style: const TextStyle(fontSize: 13, color: Colors.white),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            company,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: AppTheme.textSecondaryColor),
          ),
          if (responsibilities.isNotEmpty) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  responsibilities.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(
                              color: AppTheme.textSecondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: AppTheme.textSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
