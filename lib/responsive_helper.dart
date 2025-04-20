import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveHelper {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 894) {
      return DeviceType.mobile;
    } else if (width < 1024) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static bool isMobile(BuildContext context) {
    return getDeviceType(context) == DeviceType.mobile;
  }

  static bool isTablet(BuildContext context) {
    return getDeviceType(context) == DeviceType.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return getDeviceType(context) == DeviceType.desktop;
  }

  static double getContainerWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 894) {
      return width * 0.9; // 90% of screen on mobile
    } else if (width < 1024) {
      return width * 0.85; // 85% of screen on tablet
    } else if (width < 1440) {
      return width * 0.8; // 80% of screen on small desktop
    } else {
      return 1200; // Max width on large desktop
    }
  }

  static EdgeInsets getPagePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 40);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 60);
    } else {
      return const EdgeInsets.symmetric(horizontal: 60, vertical: 80);
    }
  }

  static double getFontSize(BuildContext context, double baseSize) {
    if (isMobile(context)) {
      return baseSize * 0.8;
    } else if (isTablet(context)) {
      return baseSize * 0.9;
    } else {
      return baseSize;
    }
  }
}
