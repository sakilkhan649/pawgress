import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pawgress/config/themes/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Gradient? gradient;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width = double.maxFinite,
    this.style,
    this.padding,
    this.borderColor,
    this.fontSize,
    this.fontWeight,
    this.gradient,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16.r),
        color: gradient == null ? (backgroundColor ?? AppTheme.primaryColor) : null,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: child ??
            Text(
              text,
              style: style ??
                  GoogleFonts.inter(
                    fontSize: fontSize ?? 18.sp,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: textColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
