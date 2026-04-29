import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      width: 40.w,
      height: 58.h,
      textStyle: GoogleFonts.inter(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      padding: EdgeInsets.all(11.r),
      decoration: BoxDecoration(
        color: const Color(0xFF323663),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFFF9B63).withValues(alpha: 0.3)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFFFF9B63)),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFFFF9B63).withValues(alpha: 0.2),
          blurRadius: 10.r,
          spreadRadius: 2.r,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFF221A36),
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
                SizedBox(height: 10.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 31.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2843),
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: const Color(0xFF6D6767)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verify Your Code',
                        style: GoogleFonts.inter(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "We've sent a 6-digit verification \ncode to your email/phone",
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFDED7D2),
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Pinput
                      Center(
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: defaultPinTheme,
                          showCursor: true,
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
                      SizedBox(height: 24.h),

                      // Resend Code in Timer
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3B3B5B).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: const Color(0xFFFF9B63),
                                size: 16.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Resend code in ',
                                style: GoogleFonts.manrope(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF01D086),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Text(
                                  '00:30',
                                  style: GoogleFonts.manrope(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFA0612E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14.h),

                      // Resend Code Button
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: const Color(0xFFFF9B63).withValues(alpha: 0.2),
                            ),
                          ),
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
                          Expanded(child: Divider(color: Color(0xFFC97B442E))),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Icon(
                              Icons.pets,
                              color: Color(0xFFC97B442E),
                              size: 14.sp,
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFFC97B442E))),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      // Verify Button
                      CustomButton(
                        text: 'Verify',
                        onPressed: () {
                          Get.toNamed(AppRoutes.newPassword);
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
