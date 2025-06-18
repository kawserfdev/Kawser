import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:kawser/view/components/primary_button.dart';
import 'package:kawser/view/components/social_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class HeroSection extends ConsumerWidget {
  final VoidCallback scrollToContact;

  const HeroSection({Key? key, required this.scrollToContact})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);

    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: const AssetImage('assets/images/bg3.jpg'),
        //   fit: BoxFit.cover,
        //   colorFilter: ColorFilter.mode(
        //     Colors.black.withOpacity(0.6),
        //     BlendMode.darken,
        //   ),
        // ),
      ),
      padding: EdgeInsets.only(
        top: 100, // Space for the navigation bar
        bottom: 60,
      ),
      child: Center(
        child: Container(
          width: containerWidth,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      _buildProfileImage(),
                      const SizedBox(height: 40),
                      _buildContent(context),
                      const SizedBox(height: 30),
                      _buildActionButtons(context),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildContent(context),
                            const SizedBox(height: 30),
                            _buildActionButtons(context),
                          ],
                        ),
                      ),
                      const SizedBox(width: 60),
                      _buildProfileImage(),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Kawser Ahmed",
          style: AppTheme.headingStyle.copyWith(
            fontSize: ResponsiveHelper.getFontSize(context, 40),
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: ResponsiveHelper.getFontSize(context, 20),
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Mobile App Developer',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Flutter Specialist',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'An expert in Rest APIs',
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Firebase Expert',
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Currently leading the mobile technology stack at GhorerBazar with over 2 years of experience in Flutter-based application development. Specialized in creating beautiful, responsive, and user-friendly mobile applications.",
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 16),
            color: Colors.grey[300],
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 20),
        if (!isMobile) const SizedBox(height: 12),
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _buildStatItem(context, '10+', 'Projects'),
            Container(
              height: 40,
              width: 1,
              color: Colors.grey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            _buildStatItem(context, '2+', 'Years\nExperience'),
            Container(
              height: 40,
              width: 1,
              color: Colors.grey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            _buildStatItem(context, '5+', 'Satisfied\nClients'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context, String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 24),
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: ResponsiveHelper.getFontSize(context, 14),
            color: Colors.grey[400],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Wrap(
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      spacing: 16, //  isMobile ? 0.0 : 16,
      runSpacing: 16, // isMobile ? 12 : 16,
      children: [
        PrimaryButton(text: "Join My Journey", onPressed: scrollToContact),
        OutlinedButton(
          onPressed: () async {
            final Uri url = Uri.parse(
              'https://drive.google.com/file/d/1XYpscYiBraYa4W7u0JRozW0fTk3TgLYA/view?usp=sharing',
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            side: const BorderSide(color: AppTheme.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Download CV',
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.download, size: 16, color: AppTheme.primaryColor),
            ],
          ),
        ),
        // Remove the SizedBox completely
        // Remove the Spacer for mobile view and handle it differently
        if (!isMobile)
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const SocialIcons(),
          ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppTheme.primaryColor.withOpacity(0.3),
              width: 4,
            ),
          ),
        ),
        Container(
          width: 256,
          height: 256,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/profile.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[700],
                  child: Icon(Icons.person, size: 100, color: Colors.grey[400]),
                );
              },
            ),
          ),
        ),
        // Experience badge
        Positioned(
          bottom: 0,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.verified, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  'Mobile App Development Expert',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
