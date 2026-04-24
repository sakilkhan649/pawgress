import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                      'Welcome back 👋',
                      style: GoogleFonts.manrope(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sign in to continue your training journey',
                      style: GoogleFonts.manrope(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(
                          0xFFD7CEC8,
                        ), // AppTheme.textLightColor
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
                      fillColior: const Color(
                        0xFF3B3B5B,
                      ), // Text field background
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.h),

                    // Password Field
                    _buildLabel('PASSWORD'),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      label: '',
                      isLabelVisible: false,
                      hintText: '••••••••',
                      obscureText: true,
                      fillColior: const Color(0xFF3B3B5B),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFF8E8E93),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.manrope(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.teal2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Login Button
                    CustomButton(
                      text: 'Login',
                      onPressed: () {},
                      gradient: AppTheme.secondaryGradient,
                    ),
                    SizedBox(height: 32.h),

                    // Or Continue With
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white.withOpacity(0.1),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'OR CONTINUE WITH',
                            style: GoogleFonts.manrope(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(
                                0xFFBFAFA3,
                              ), // AppTheme.greyBrown
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white.withOpacity(0.1),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),

                    // Social Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _SocialButton(
                            iconPath: ImagePaths.appleIcon,
                            label: 'Apple',
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _SocialButton(
                            iconPath: ImagePaths.googleIcon,
                            label: 'Google',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),

                    // Sign Up Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFBFAFA3), // greyBrown
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUp);
                          },
                          child: Text(
                            'Sign Up',
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

class _SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.iconPath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
          0xFF454565,
        ), // Lighter background for buttons
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath == ImagePaths.appleIcon)
            SvgPicture.asset(
              iconPath,
              height: 20.w,
              width: 20.w,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )
          else
            SvgPicture.asset(iconPath, height: 20.w, width: 20.w),
          SizedBox(width: 8.w),
          Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
