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
import 'package:pawgress/modules/auth/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                  padding: EdgeInsets.fromLTRB(24.w, 27.h, 24.w, 24.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF302B4A), // Card background
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(
                      color: Color(0xFF6D6767),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back 👋',
                        style: GoogleFonts.manrope(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Sign in to continue your training journey',
                        style: GoogleFonts.manrope(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(
                            0xFFD7CEC8,
                          ), // AppTheme.textLightColor
                        ),
                      ),
                      SizedBox(height: 24.h),
          
                      // Email Field
                      _buildLabel('EMAIL'),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        label: '',
                        isLabelVisible: false,
                        hintText: 'your@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 14.h),
          
                      // Password Field
                      _buildLabel('PASSWORD'),
                      SizedBox(height: 8.h),
                      Obx(() => CustomTextField(
                        label: '',
                        isLabelVisible: false,
                        hintText: "",
                        obscureText: !controller.isPasswordVisible.value,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: GestureDetector(
                            onTap: controller.togglePasswordVisibility,
                            child: Icon(
                              controller.isPasswordVisible.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF8E8E93),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(height: 8.h),
          
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
                              fontWeight: FontWeight.w600,
                              color: Color(0xff01D086),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
          
                      // Login Button
                      CustomButton(
                        text: 'Log In',
                        onPressed: () {
                          Get.toNamed(AppRoutes.bottomNavigation);
                        },
                        gradient: AppTheme.secondaryGradient,
                      ),
                      SizedBox(height: 16.h),
          
                      // Or Continue With
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xffDA915D).withValues(alpha: 0.30),
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
                                  0xFFBCBCBC,
                                ), // AppTheme.greyBrown
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xffDA915D).withValues(alpha: 0.30),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
          
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
                      SizedBox(height: 24.h),
          
                      // Sign Up Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.manrope(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF9E7B60), // greyBrown
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.signUp);
                            },
                            child: Text(
                              ' Sign Up',
                              style: GoogleFonts.manrope(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff02CD89),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
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
        color: const Color(0xFFFFFFFF), // AppTheme.greyBrown
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
          0xFF505A83,
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
