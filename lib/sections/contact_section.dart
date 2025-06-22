import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawser/models/contact.dart'; // Import Contact model
import 'package:kawser/providers/providers.dart'; // Import providers
import 'package:kawser/view/components/primary_button.dart';
import 'package:kawser/view/components/section_title.dart';
import 'package:kawser/view/components/social_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class ContactSection extends ConsumerStatefulWidget { // Changed to ConsumerStatefulWidget
  const ContactSection({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactSection> createState() => _ContactSectionState(); // Changed to ConsumerState
}

class _ContactSectionState extends ConsumerState<ContactSection> { // Changed to ConsumerState
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // In a real app, you would send the form data to a backend service
      // For now, just show a success message
      // You might want to integrate this with Firebase Functions or a similar service
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent successfully! (Not implemented yet)'),
          backgroundColor: AppTheme.primaryColor,
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final containerWidth = ResponsiveHelper.getContainerWidth(context);
    final contactDataAsync = ref.watch(contactProvider); // Watch the contact provider
    
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
              const SectionTitle(title: "Get in Touch"),
              contactDataAsync.when(
                data: (contactData) {
                  return isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildContactInfo(contactData),
                            const SizedBox(height: 40),
                            _buildContactForm(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildContactInfo(contactData)),
                            const SizedBox(width: 60),
                            Expanded(child: _buildContactForm()),
                          ],
                        );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error loading contact info: $err', style: const TextStyle(color: Colors.red))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(Contact contactData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Feel free to reach out to me for any inquiries about mobile app development, Flutter projects, or collaboration opportunities. I'm always open to discussing new ideas and challenges.",
          style: AppTheme.bodyTextStyle,
        ),
        const SizedBox(height: 32),
        const Text(
          "Contact Information",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppTheme.textColor,
          ),
        ),
        const SizedBox(height: 16),
        if (contactData.email.isNotEmpty)
          _buildContactItem(
            icon: FontAwesomeIcons.envelope,
            text: contactData.email,
            onTap: () => launchUrl(Uri.parse('mailto:${contactData.email}')),
          ),
        if (contactData.email.isNotEmpty) const SizedBox(height: 12),
        if (contactData.phone.isNotEmpty)
          _buildContactItem(
            icon: FontAwesomeIcons.phone,
            text: contactData.phone,
            onTap: () => launchUrl(Uri.parse('tel:${contactData.phone}')),
          ),
        if (contactData.phone.isNotEmpty) const SizedBox(height: 12),
        if (contactData.address != null && contactData.address!.isNotEmpty)
          _buildContactItem(
            icon: FontAwesomeIcons.locationDot,
            text: contactData.address!,
          ),
        if (contactData.address != null && contactData.address!.isNotEmpty) const SizedBox(height: 12),
        const SizedBox(height: 20), // Adjusted spacing
        // Pass dynamic URLs to SocialIcons if they are part of Contact model
        SocialIcons(
          linkedinUrl: contactData.linkedInUrl,
          githubUrl: contactData.githubUrl,
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: FaIcon(
              icon,
              color: AppTheme.primaryColor,
              size: 18,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: onTap != null ? AppTheme.textColor : AppTheme.textSecondaryColor,
                fontSize: 15, // Slightly adjusted font size for consistency
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(color: AppTheme.textColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: AppTheme.textColor),
            decoration: _inputDecoration("Your Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Email",
            style: TextStyle(color: AppTheme.textColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: AppTheme.textColor),
            decoration: _inputDecoration("Your Email"),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "Message",
            style: TextStyle(color: AppTheme.textColor, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _messageController,
            style: const TextStyle(color: AppTheme.textColor),
            decoration: _inputDecoration("Your Message"),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "Send Message",
            onPressed: _submitForm,
            fullWidth: true,
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String placeholder) {
    return InputDecoration(
      hintText: placeholder,
      hintStyle: TextStyle(color: AppTheme.textSecondaryColor.withOpacity(0.7)),
      filled: true,
      fillColor: const Color(0xFF2A2A2A), // Slightly darker for better contrast with white text
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8), // Slightly more rounded corners
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder( // Ensure consistent border when not focused
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppTheme.textColor.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppTheme.primaryColor,
          width: 1.5, // Slightly thinner focused border
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Increased padding
    );
  }
}