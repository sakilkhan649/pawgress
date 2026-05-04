import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/utils/validetors.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';
import 'package:pawgress/modules/auth/controllers/sign_up_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221A36), // Deep purple background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 13.h),

                // Full Name
                CustomTextField(
                  label: 'Full Name',
                  hintText: 'John Doe',
                  controller: controller.nameController,
                  validator: Validators.name,
                  fillColior: const Color(0xFF3B3B5B),
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Color(0xFF8E8E93),
                  ),
                ),
                SizedBox(height: 16.h),

                // Email
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'john@example.com',
                  controller: controller.emailController,
                  validator: Validators.email,
                  keyboardType: TextInputType.emailAddress,
                  fillColior: const Color(0xFF3B3B5B),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF8E8E93),
                  ),
                ),
                SizedBox(height: 16.h),

                // Phone
                CustomTextField(
                  label: 'Phone Number',
                  hintText: '+1 (555) 000-0000',
                  controller: controller.phoneController,
                  validator: Validators.phone,
                  keyboardType: TextInputType.phone,
                  fillColior: const Color(0xFF3B3B5B),
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: Color(0xFF8E8E93),
                  ),
                ),
                SizedBox(height: 16.h),

                // Dog's Name
                CustomTextField(
                  label: "Dog's Name",
                  hintText: 'e.g. Max, Bella...',
                  controller: controller.dogNameController,
                  validator: (val) => Validators.required(val, message: "Dog's name is required"),
                  fillColior: const Color(0xFF3B3B5B),
                  prefixIcon: const Icon(
                    Icons.pets_outlined,
                    color: Color(0xFF8E8E93),
                  ),
                ),
                SizedBox(height: 16.h),

                // Password
                Obx(
                  () => CustomTextField(
                    label: 'Password',
                    hintText: '',
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    validator: Validators.password,
                    fillColior: const Color(0xFF3B3B5B),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF8E8E93),
                    ),
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
                  ),
                ),
                SizedBox(height: 16.h),

                // Confirm Password
                Obx(
                  () => CustomTextField(
                    label: 'Confirm Password',
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
                  ),
                ),
                SizedBox(height: 24.h),

                // Terms & Conditions Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: Obx(
                        () => Checkbox(
                          value: controller.isTermsAccepted.value,
                          onChanged: controller.toggleTerms,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          activeColor: Colors.white,
                          checkColor: const Color(0xFF221A36),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to our ',
                          style: GoogleFonts.manrope(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: GoogleFonts.manrope(
                                color: const Color(
                                  0xFF6B5CD1,
                                ), // Purple link color
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.manrope(
                                color: const Color(
                                  0xFF6B5CD1,
                                ), // Purple link color
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 34.h),

                // Sign Up Button
                CustomButton(
                  text: '', // Using child
                  onPressed: () {
                    // if (controller.formKey.currentState!.validate()) {
                    //   if (!controller.isTermsAccepted.value) {
                    //     Get.snackbar("Error", "Please accept the terms and conditions");
                    //     return;
                    //   }
                    //   Get.toNamed(AppRoutes.bottomNavigation);
                    // }
                    Get.toNamed(AppRoutes.bottomNavigation);
                  },
                  gradient: AppTheme.secondaryGradient,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: GoogleFonts.manrope(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
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
}
