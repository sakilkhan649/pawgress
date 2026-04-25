import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/themes/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isLabelVisible;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColior;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.isLabelVisible = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.inputFormatters,
    this.fillColior,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    /// ✅ ONE BORDER FOR ALL STATES
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(
        color: Color(0xff6D6767),
        width: 1.2,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= LABEL =================
        if (isLabelVisible)
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.textColor,
              ),
            ),
          ),

        /// ================= TEXT FIELD =================
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          readOnly: readOnly,
          keyboardType: keyboardType,
          onTap: onTap,
          onChanged: onChanged,
          inputFormatters: inputFormatters,

          style: GoogleFonts.inter(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppTheme.textColor,
          ),

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8E8E93),
            ),

            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 16.w,
            ),

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            filled: true,
            fillColor: fillColior ?? const Color(0xff323663),

            /// ✅ SAME BORDER EVERYWHERE
            border: outlineBorder,
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
            errorBorder: outlineBorder,
            focusedErrorBorder: outlineBorder,

            errorStyle: GoogleFonts.manrope(
              fontSize: 11.sp,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
