import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.sectionTitleStyle.copyWith(
            fontSize: ResponsiveHelper.getFontSize(
              context, 
              AppTheme.sectionTitleStyle.fontSize!
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 50,
          height: 4,
          color: AppTheme.primaryColor,
        ),
        SizedBox(height: isMobile ? 20 : 40),
      ],
    );
  }
}
