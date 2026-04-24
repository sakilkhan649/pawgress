import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/core/widgets/custom_button.dart';
import 'package:pawgress/core/widgets/custom_image.dart';
import 'package:pawgress/core/widgets/custom_text.dart';
import 'package:pawgress/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SafeArea(
          child: Stack(
            children: [
              // Skip Button at Top Right
              Positioned(
                top: 20.h,
                right: 24.w,
                child: GestureDetector(
                  onTap: controller.skip,
                  child: CustomText(
                    text: 'Skip',
                    fontSize: 16.sp,
                    color: AppTheme.textLightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // Content
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.contents.length,
                itemBuilder: (context, index) {
                  final content = controller.contents[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImage(
                          imagePath: content.image,
                          height: 361.h,
                          width: 313.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 40.h),
                        CustomText(
                          text: content.title,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          color: AppTheme.textColor,
                        ),
                        SizedBox(height: 10.h),
                        CustomText(
                          text: content.description,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textLightColor,
                          textAlign: TextAlign.center,
                        ),
                        CustomText(
                          text: content.description2,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textLightColor,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 74.h), // Space for buttons
                      ],
                    ),
                  );
                },
              ),

              // Bottom Buttons
              Positioned(
                bottom: 130.h,
                left: 30.w,
                right: 30.w,
                child: Row(
                  children: [
                    // Back Button
                    Expanded(
                      child: CustomButton(
                        text: '',
                        onPressed: controller.back,
                        backgroundColor: AppTheme.greyBrown,
                        borderColor: AppTheme.teal2,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(width: 8.w),
                            CustomText(
                              text: 'Back',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    // Next/Get Started Button
                    Expanded(
                      child: Obx(
                        () => CustomButton(
                          text: '',
                          onPressed: controller.next,
                          gradient: AppTheme.secondaryGradient,
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text:
                                    controller.currentPage.value ==
                                        controller.contents.length - 1
                                    ? 'Get started'
                                    : 'Next',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color:AppTheme.textColor,
                              ),
                              SizedBox(width: 8.w),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
