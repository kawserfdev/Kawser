import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kawser/view/components/primary_button.dart';
import 'package:kawser/view/components/section_title.dart';
import 'package:kawser/view/components/social_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Message sent successfully!'),
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
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildContactInfo(),
                        const SizedBox(height: 40),
                        _buildContactForm(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo()),
                        const SizedBox(width: 60),
                        Expanded(child: _buildContactForm()),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
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
        _buildContactItem(
          icon: FontAwesomeIcons.envelope, 
          text: "kawsersoftengineer@gmail.com",
          onTap: () => launchUrl(Uri.parse('mailto:kawsersoftengineer@gmail.com')),
        ),
        const SizedBox(height: 12),
        _buildContactItem(
          icon: FontAwesomeIcons.phone, 
          text: "+880 1925 286359",
          onTap: () => launchUrl(Uri.parse('tel:+8801925286359')),
        ),
        const SizedBox(height: 12),
        _buildContactItem(
          icon: FontAwesomeIcons.locationDot, 
          text: "Mohammadpur, Dhaka-1207, Bangladesh",
        ),
        const SizedBox(height: 32),
        const SocialIcons(),
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
          Text(
            "Name",
            style: TextStyle(color: AppTheme.textColor),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
            decoration: _inputDecoration("Your Name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Text(
            "Email",
            style: TextStyle(color: AppTheme.textColor),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _emailController,
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
          const SizedBox(height: 16),
          Text(
            "Message",
            style: TextStyle(color: AppTheme.textColor),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _messageController,
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
      hintStyle: TextStyle(color: Colors.grey[600]),
      filled: true,
      fillColor: const Color(0xFF2A2A2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: AppTheme.primaryColor,
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}