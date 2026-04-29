import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // New Colors from Design
  static const Color purple1 = Color(0xFF46266C);
  static const Color purple2 = Color(0xFF241239);
  static const Color teal2 = Color(0xFF06C190);
  static const Color teal1 = Color(0xFF02CC89);
  static const Color blue1 = Color(0xFF207DBF);
  static const Color greyBrown = Color(0xFFBFAFA3);

  // Common colors
  static const Color primaryColor = purple1;
  static const Color secondaryColor = teal1;
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color textLightColor = Color(0xFFD7CEC8);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [purple1, purple2],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [teal1, blue1],
  );

  static final Decoration customBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.04),
        blurRadius: 20.r,
        offset: Offset(0, 4.h),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 3.r,
        offset: Offset(0, 1.h),
      ),
    ],
    border: Border.all(color: const Color(0xffE5E7EB)),
  );
}
