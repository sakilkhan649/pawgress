import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';
import 'package:pawgress/modules/auth/controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

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
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(24.w, 27.h, 24.w, 50.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2843),
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: const Color(0xFF6D6767)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create New Password 👋',
                        style: GoogleFonts.inter(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Choose a strong password to secure your account.',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFD7CEC8), // AppTheme.textLightColor
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      // New Password Field
                      _buildLabel('NEW PASSWORD'),
                      SizedBox(height: 8.h),
                      Obx(() => CustomTextField(
                        label: '',
                        isLabelVisible: false,
                        hintText: '',
                        obscureText: controller.isPasswordHidden.value,
                        fillColior: const Color(0xFF3B3B5B), // Text field background
                        suffixIcon: GestureDetector(
                          onTap: controller.togglePasswordVisibility,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF8E8E93),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 20.h),
                      
                      // Confirm New Password Field
                      _buildLabel('CONFIRM NEW PASSWORD'),
                      SizedBox(height: 8.h),
                      Obx(() => CustomTextField(
                        label: '',
                        isLabelVisible: false,
                        hintText: '',
                        obscureText: controller.isConfirmPasswordHidden.value,
                        fillColior: const Color(0xFF3B3B5B),
                        suffixIcon: GestureDetector(
                          onTap: controller.toggleConfirmPasswordVisibility,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Icon(
                              controller.isConfirmPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF8E8E93),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 20.h),
                      
                      // Confirm Button
                      CustomButton(
                        text: '', // using child parameter
                        onPressed: () {
                          Get.toNamed(AppRoutes.success);
                        },
                        gradient: AppTheme.secondaryGradient,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Confirm',
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
      style: GoogleFonts.manrope(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: const Color(0xFFBFAFA3), // AppTheme.greyBrown
      ),
    );
  }
}
