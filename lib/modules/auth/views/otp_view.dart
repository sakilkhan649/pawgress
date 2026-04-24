import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pinput/pinput.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.w,
      textStyle: GoogleFonts.manrope(
        fontSize: 22.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF3B3B5B), // Text field background
        borderRadius: BorderRadius.circular(16.r),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF221A36), // Deep purple background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Image.asset(
                  ImagePaths.appLogo,
                  width: 140.w,
                  height: 140.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2843), // Card background
                  borderRadius: BorderRadius.circular(32.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification 👋',
                      style: GoogleFonts.manrope(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Enter the verification code sent to your email or phone number',
                      style: GoogleFonts.manrope(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: const Color(0xFFD7CEC8), // AppTheme.textLightColor
                      ),
                    ),
                    SizedBox(height: 32.h),
                    
                    // Pinput
                    Center(
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyDecorationWith(
                          border: Border.all(color: AppTheme.teal2, width: 1.5),
                        ),
                        submittedPinTheme: defaultPinTheme,
                        showCursor: true,
                        onCompleted: (pin) {
                          // Handle OTP verification
                        },
                      ),
                    ),
                    SizedBox(height: 32.h),
                    
                    // Verify Button
                    CustomButton(
                      text: 'Verify',
                      onPressed: () {
                        Get.toNamed(AppRoutes.newPassword);
                      },
                      gradient: AppTheme.secondaryGradient,
                    ),
                    SizedBox(height: 24.h),
                    
                    // Resend Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive code? ",
                          style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBFAFA3), // greyBrown
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Resend',
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.teal2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
