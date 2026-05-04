import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';

class PorgotPasswordView extends StatelessWidget {
  const PorgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221A36), // Deep purple background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: Image.asset(
                    ImagePaths.appLogo,
                    width: 268.w,
                    height: 177.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 29.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(24.w, 37.h, 24.w, 31.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2843), // Card background
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: Color(0xFF6D6767)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Forgot Password? 👋',
                        style: GoogleFonts.manrope(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Enter your email or phone number to reset your password',
                        style: GoogleFonts.manrope(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: const Color(0xFFEEEEEE), // AppTheme.textLightColor
                        ),
                      ),
                      SizedBox(height: 32.h),
                      
                      // Email Field
                      _buildLabel('EMAIL'),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        label: '',
                        isLabelVisible: false,
                        hintText: 'your@email.com',
                        fillColior: const Color(0xFF3B3B5B), // Text field background
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 45.h),
                      
                      // Confirm Button
                      CustomButton(
                        text: 'Confirm',
                        onPressed: () {
                          Get.toNamed(AppRoutes.otp);
                        },
                        gradient: AppTheme.secondaryGradient,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFBFAFA3), // AppTheme.greyBrown
      ),
    );
  }
}
