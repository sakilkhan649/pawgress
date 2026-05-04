import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/utils/validetors.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';
import 'package:pawgress/modules/auth/controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134), // Deep purple background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                SizedBox(height: 15.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 32.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF302B4A), // Card background
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: const Color(0xFF6D6767)),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Password 👋',
                          style: GoogleFonts.manrope(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Enter your new password below',
                          style: GoogleFonts.manrope(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFD7CEC8),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        // Password Field
                        _buildLabel('NEW PASSWORD'),
                        SizedBox(height: 8.h),
                        Obx(() => CustomTextField(
                          label: '',
                          isLabelVisible: false,
                          hintText: '',
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          validator: Validators.password,
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
                        SizedBox(height: 16.h),

                        // Confirm Password Field
                        _buildLabel('CONFIRM PASSWORD'),
                        SizedBox(height: 8.h),
                        Obx(() => CustomTextField(
                          label: '',
                          isLabelVisible: false,
                          hintText: '',
                          controller: controller.confirmPasswordController,
                          obscureText: controller.isConfirmPasswordHidden.value,
                          validator: (val) => Validators.confirmPassword(val, controller.passwordController.text),
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
                        SizedBox(height: 40.h),

                        // Confirm Button
                        CustomButton(
                          text: '', // using child parameter
                          onPressed: () {
                            // if (controller.formKey.currentState!.validate()) {
                            //   Get.toNamed(AppRoutes.success);
                            // }
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
