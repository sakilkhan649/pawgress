import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/utils/validetors.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/modules/auth/controllers/otp_controller.dart';
import 'package:pawgress/config/routes/app_pages.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 52.h,
      textStyle: GoogleFonts.manrope(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF3B3B5B),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF6D6767)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: const Color(0xFFFF9B63)),
      ),
    );

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
                          'Verify Your Code',
                          style: GoogleFonts.manrope(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Enter the 6-digit code we sent to your email',
                          style: GoogleFonts.manrope(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFD7CEC8),
                          ),
                        ),
                        SizedBox(height: 32.h),

                        // OTP Input
                        Center(
                          child: Pinput(
                            length: 6,
                            controller: controller.otpController,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: defaultPinTheme,
                            showCursor: true,
                            validator: (val) => Validators.otp(val, length: 6),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 1.w,
                                  height: 18.w,
                                  color: const Color(0xFFFF9B63),
                                ),
                              ],
                            ),
                            onCompleted: (pin) {
                              // Handle OTP verification
                            },
                          ),
                        ),
                        SizedBox(height: 32.h),

                        // Resend Code
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Resend logic
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.refresh,
                                  color: const Color(0xFFC8A98A),
                                  size: 16.sp,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Resend Code',
                                  style: GoogleFonts.manrope(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFC8A98A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Separator with Paw
                        Row(
                          children: [
                            Expanded(child: Divider(color: Color(0xFFC97B44))),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Icon(
                                Icons.pets,
                                color: Color(0xFFC97B44),
                                size: 14.sp,
                              ),
                            ),
                            Expanded(child: Divider(color: Color(0xFFC97B44))),
                          ],
                        ),
                        SizedBox(height: 24.h),

                        // Verify Button
                        CustomButton(
                          text: 'Verify',
                          onPressed: () {
                            // if (controller.formKey.currentState!.validate()) {
                            //   Get.toNamed(AppRoutes.newPassword);
                            // }
                            Get.toNamed(AppRoutes.newPassword);
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
}
