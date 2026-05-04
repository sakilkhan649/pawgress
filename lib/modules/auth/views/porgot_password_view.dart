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
import 'package:pawgress/modules/auth/controllers/porgot_password_controller.dart';

class PorgotPasswordView extends GetView<PorgotPasswordController> {
  const PorgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134), // Deep purple background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60.h),
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
                    border: Border.all(color: Color(0xFF6D6767)),
                  ),
                  child: Form(
                    key: controller.formKey,
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
                          'Enter your email address to receive a verification code',
                          style: GoogleFonts.manrope(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFD7CEC8),
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
                          controller: controller.emailController,
                          validator: Validators.email,
                          fillColior: const Color(
                            0xFF3B3B5B,
                          ), // Text field background
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 45.h),

                        // Confirm Button
                        CustomButton(
                          text: 'Confirm',
                          onPressed: () {
                            // if (controller.formKey.currentState!.validate()) {
                            Get.toNamed(AppRoutes.otp);
                            // }
                          },
                          gradient: AppTheme.secondaryGradient,
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
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
