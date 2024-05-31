import 'package:flutter/material.dart';

double mobileWidth = 600.0;
double tabletWidth = 1024.0;

bool isMobile(double width) => width <= mobileWidth;

bool isTablet(double width) => width > mobileWidth && width <= tabletWidth;

bool isDesktop(double width) => width > tabletWidth;

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;
      if (isMobile(maxWidth)) {
        return mobile;
      } else if (isTablet(maxWidth)) {
        return tablet;
      } else {
        return desktop;
      }
    });
  }
}
