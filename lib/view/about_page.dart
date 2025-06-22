import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kawser/models/skill.dart';
import 'package:kawser/providers/providers.dart'; // Updated import
import 'package:kawser/view/components/section_title.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';
import '../models/about.dart'; // Import the About model

class AboutSection extends ConsumerWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final skillsStream = ref.watch(skillsProvider); // Updated provider
    final aboutDataAsync = ref.watch(aboutProvider); // Watch the new aboutProvider

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
              aboutDataAsync.when(
                data: (aboutData) => SectionTitle(title: aboutData.title.isNotEmpty ? aboutData.title : "About Me"),
                loading: () => const SectionTitle(title: "About Me"),
                error: (err, stack) => const SectionTitle(title: "About Me (Error)"),
              ),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        aboutDataAsync.when(
                          data: (aboutData) => _buildAboutText(aboutData),
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, stack) => Text('Error loading about data: $err'),
                        ),
                        const SizedBox(height: 40),
                        _buildCompetencies(context, skillsStream),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: aboutDataAsync.when(
                            data: (aboutData) => _buildAboutText(aboutData),
                            loading: () => const Center(child: CircularProgressIndicator()),
                            error: (err, stack) => Text('Error loading about data: $err'),
                          ),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          child: _buildCompetencies(context, skillsStream),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutText(About aboutData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutData.description,
          style: AppTheme.bodyTextStyle,
        ),
        // Add more fields from aboutData if needed, e.g., aboutData.imageUrl
        if (aboutData.imageUrl != null && aboutData.imageUrl!.isNotEmpty) ...[
          const SizedBox(height: 24),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 300, // Adjust as needed
                maxWidth: ResponsiveHelper.getContainerWidth(GlobalKey().currentContext!) * 0.8, // Adjust as needed
              ),
              child: Image.network(
                aboutData.imageUrl!,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Could not load image', style: TextStyle(color: Colors.red));
                },
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCompetencies(
    BuildContext context,
    AsyncValue<List<SkillCategory>> skillsStream,
  ) {
    final isMobile = ResponsiveHelper.isMobile(context);
    // print("Skills Data${skillsStream.value}"); // Commented out or remove print

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
            if (skills.isEmpty) {
              return const Text("No skills listed yet.", style: AppTheme.bodyTextStyle);
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2,
                childAspectRatio: isMobile ? 4 : 3, // Adjusted aspect ratio
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: skills.length,
              itemBuilder: (context, index) {
                final skillCategory = skills[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skillCategory.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      skillCategory.skills.join(', '),
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
              valueColor: AlwaysStoppedAnimation<Color>(
                AppTheme.primaryColor,
              ),
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error loading skills: ${error.toString()}', style: const TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }
}
