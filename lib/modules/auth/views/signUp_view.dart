import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';
import 'package:pawgress/modules/auth/controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221A36), // Deep purple background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              Center(
                child: Image.asset(
                  ImagePaths.appLogo,
                  width: 130.w,
                  height: 130.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 32.h),
              
              // Full Name
              CustomTextField(
                label: 'Full Name',
                hintText: 'John Doe',
                fillColior: const Color(0xFF3B3B5B),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF8E8E93),
                ),
              ),
              SizedBox(height: 20.h),
              
              // Email
              CustomTextField(
                label: 'Email Address',
                hintText: 'john@example.com',
                keyboardType: TextInputType.emailAddress,
                fillColior: const Color(0xFF3B3B5B),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Color(0xFF8E8E93),
                ),
              ),
              SizedBox(height: 20.h),
              
              // Phone
              CustomTextField(
                label: 'Phone Number',
                hintText: '+1 (555) 000-0000',
                keyboardType: TextInputType.phone,
                fillColior: const Color(0xFF3B3B5B),
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Color(0xFF8E8E93),
                ),
              ),
              SizedBox(height: 20.h),
              
              // Dog's Name
              CustomTextField(
                label: "Dog's Name",
                hintText: 'e.g. Max, Bella...',
                fillColior: const Color(0xFF3B3B5B),
                prefixIcon: const Icon(
                  Icons.pets_outlined,
                  color: Color(0xFF8E8E93),
                ),
              ),
              SizedBox(height: 20.h),
              
              // Password
              Obx(() => CustomTextField(
                label: 'Password',
                hintText: '••••••••',
                obscureText: controller.isPasswordHidden.value,
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
              )),
              SizedBox(height: 20.h),
              
              // Confirm Password
              Obx(() => CustomTextField(
                label: 'Confirm Password',
                hintText: '••••••••',
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
              SizedBox(height: 24.h),
              
              // Terms & Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Obx(() => Checkbox(
                      value: controller.isTermsAccepted.value,
                      onChanged: controller.toggleTerms,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      side: const BorderSide(color: Colors.white, width: 1.5),
                      activeColor: Colors.white,
                      checkColor: const Color(0xFF221A36),
                    )),
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
                              color: const Color(0xFF6B5CD1), // Purple link color
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: GoogleFonts.manrope(
                              color: const Color(0xFF6B5CD1), // Purple link color
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
              SizedBox(height: 32.h),
              
              // Sign Up Button
              CustomButton(
                text: '', // Using child
                onPressed: () {},
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
                    SizedBox(width: 8.w),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
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
