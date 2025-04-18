import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class SocialIcons extends StatelessWidget {
  final bool centered;
  final double iconSize;
  
  const SocialIcons({
    Key? key,
    this.centered = false,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialLinks = [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/kawserfdev',
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://www.linkedin.com/in/kawserfdev/',
      },
      {
        'icon': FontAwesomeIcons.twitter,
        'url': '#',
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'url': '#',
      },
    ];

    return Row(
      mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        for (var i = 0; i < socialLinks.length; i++) ...[
          if (i > 0) const SizedBox(width: 16),
          InkWell(
            onTap: () => launchUrl(Uri.parse(socialLinks[i]['url'] as String)),
            child: FaIcon(
              socialLinks[i]['icon'] as IconData,
              color: AppTheme.textColor,
              size: iconSize,
            ),
          ),
        ],
      ],
    );
  }
}