import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app_theme.dart';
import '../responsive_helper.dart';

class NavigationBar extends StatefulWidget {
  final Function(String) onSectionSelected;

  const NavigationBar({Key? key, required this.onSectionSelected})
    : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  bool _isMobileMenuOpen = false;

  final List<Map<String, String>> navItems = [
    {'label': 'About', 'section': 'about'},
    {'label': 'Case Studies', 'section': 'case-studies'},
    {'label': 'Testimonials', 'section': 'testimonials'},
    {'label': 'Recent Work', 'section': 'recent-work'},
    {'label': 'Contact', 'section': 'contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.black.withOpacity(0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Kawser Ahmed',
                    style: TextStyle(
                      color: AppTheme.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  isMobile
                      ? _buildMobileMenuButton()
                      : _buildDesktopMenu(),
                  // if (isMobile)
                  //   _buildMobileMenuButton()
                  // Row(
                  //   children: [
                  //     for (var item in navItems) ...[
                  //       TextButton(
                  //         onPressed:
                  //             () => widget.onSectionSelected(item['section']!),
                  //         style: TextButton.styleFrom(
                  //           foregroundColor: AppTheme.textColor,
                  //         ),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 12),
                  //           child: Text(item['label']!),
                  //         ),
                  //       ),
                  //     ],
                  //   ],
                  // )
                  // else
                  //   _buildDesktopMenu(),
                  // IconButton(
                  //   icon: Icon(
                  //     _isMobileMenuOpen ? Icons.close : FontAwesomeIcons.bars,
                  //     color: AppTheme.textColor,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isMobileMenuOpen = !_isMobileMenuOpen;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            if (isMobile && _isMobileMenuOpen) _buildMobileMenu(),
            // Container(
            //   width: double.infinity,
            //   color: Colors.black,
            //   padding: const EdgeInsets.symmetric(vertical: 16),
            //   child: Column(
            //     children: [
            //       for (var item in navItems)
            //         Padding(
            //           padding: const EdgeInsets.symmetric(vertical: 8),
            //           child: TextButton(
            //             onPressed: () {
            //               widget.onSectionSelected(item['section']!);
            //               setState(() {
            //                 _isMobileMenuOpen = false;
            //               });
            //             },
            //             style: TextButton.styleFrom(
            //               foregroundColor: AppTheme.textColor,
            //             ),
            //             child: Text(item['label']!),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var item in navItems)
          TextButton(
            onPressed: () => widget.onSectionSelected(item['section']!),
            style: TextButton.styleFrom(foregroundColor: AppTheme.textColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(item['label']!, style: const TextStyle(fontSize: 16)),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: Icon(
        _isMobileMenuOpen ? Icons.close : FontAwesomeIcons.bars,
        color: AppTheme.textColor,
      ),
      onPressed: () {
        setState(() {
          _isMobileMenuOpen = !_isMobileMenuOpen;
        });
      },
    );
  }

  Widget _buildMobileMenu() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          for (var item in navItems)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextButton(
                onPressed: () {
                  widget.onSectionSelected(item['section']!);
                  setState(() {
                    _isMobileMenuOpen = false;
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.textColor,
                ),
                child: Text(
                  item['label']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
