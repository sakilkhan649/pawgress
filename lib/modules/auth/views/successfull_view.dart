import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
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
                SizedBox(height: 32.h),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(40.w, 73.h, 40.w, 95.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2843),
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: const Color(0xFF6D6767)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 16.h),

                      // Check Icon Circle
                      Container(
                        width: 128.w,
                        height: 128.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF3B1F53), // Outer ring color
                        ),
                        child: Center(
                          child: Container(
                            width: 84.w,
                            height: 84.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF1992B1), // Inner teal color
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
                      SizedBox(height: 10.h),

                      // Success Text
                      Text(
                        'Password Created Successfully',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 29.h),

                      // Continue to Login Button
                      CustomButton(
                        text: 'Back to Login',
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.login);
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
}
