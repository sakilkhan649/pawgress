import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';

class SuccessfullView extends StatelessWidget {
  const SuccessfullView({super.key});

  @override
  Widget build(BuildContext context) {
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
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2843), // Card background
                  borderRadius: BorderRadius.circular(32.r),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16.h),
                    
                    // Check Icon Circle
                    Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF3B2857), // Outer ring color
                      ),
                      child: Center(
                        child: Container(
                          width: 76.w,
                          height: 76.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1B99A8), // Inner teal color
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 44.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    
                    // Success Text
                    Text(
                      'Password Created Successfully',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    
                    // Continue to Login Button
                    CustomButton(
                      text: 'Continue to Login',
                      onPressed: () {},
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
    );
  }
}
