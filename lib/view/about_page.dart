  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_theme.dart';
import '../providers/providers.dart';
import '../responsive_helper.dart';
import '../widgets/section_title.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final skillsStream = ref.watch(skillsProvider);
    
    return Container(
      width: double.infinity,
      color: const Color(0xFF191919),
      padding: ResponsiveHelper.getPagePadding(context),
      child: Center(
        child: Container(
          width: containerWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "About Me"),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAboutText(),
                        const SizedBox(height: 40),
                        _buildCompetencies(context, skillsStream),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildAboutText()),
                        const SizedBox(width: 60),
                        Expanded(child: _buildCompetencies(context, skillsStream)),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Mobile App Developer with over 2 years of hands-on experience in Flutter-based application development, currently leading the mobile technology stack at GhorerBazar. Skilled in designing, developing, and maintaining customer-facing and internal tools, including complex modules like partial payment systems.",
          style: AppTheme.bodyTextStyle,
        ),
        SizedBox(height: 24),
        Text(
          "Adept at using state management solutions (Provider, Riverpod, GetX), Firebase services, and APIs for building scalable, high-performance apps. With a strong foundation in computer science and a passion for clean architecture and user experience, I bring both technical expertise and business-focused thinking to every project.",
          style: AppTheme.bodyTextStyle,
        ),
      ],
    );
  }

  Widget _buildCompetencies(BuildContext context, AsyncValue<List<SkillCategory>> skillsStream) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Core Competencies",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 16),
        skillsStream.when(
          data: (skills) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                childAspectRatio: isMobile ? 4 : 2.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                final skill = skills[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      skill.skills.join(', '),
                      style: const TextStyle(
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error loading skills: ${error.toString()}'),
          ),
        ),
      ],
    );
  }
}