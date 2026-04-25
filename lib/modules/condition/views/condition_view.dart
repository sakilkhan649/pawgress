import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/condition_controller.dart';

class ConditionView extends GetView<ConditionController> {
  const ConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1528), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Terms & Conditions',
          style: GoogleFonts.manrope(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Column(
                children: [
                  // Banner Image Placeholder
                  Container(
                    width: double.infinity,
                    height: 140.h,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF86D2D9), Color(0xFF4A8992)], // Teal gradient matching image
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Our Commitment to Care',
                          style: GoogleFonts.manrope(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Effective Date: October 2023',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Terms Card
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2843), // Card background
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: const Color(0xFF454565)), // Slight border
                    ),
                    child: Column(
                      children: [
                        _buildTermItem(
                          icon: Icons.person_outline,
                          title: 'User Responsibilities',
                          contentParts: [
                            const TextSpan(text: 'You are solely responsible for providing '),
                            TextSpan(text: 'accurate medical history', style: TextStyle(color: AppTheme.teal2)),
                            const TextSpan(text: ' and behavior details for your pets. Failure to disclose aggressive tendencies may result in account termination.'),
                          ],
                        ),
                        _buildDivider(),
                        _buildTermItem(
                          icon: Icons.pets,
                          title: 'Pet Care Standards',
                          contentParts: [
                            const TextSpan(text: 'All caregivers must adhere to our '),
                            TextSpan(text: 'high-quality welfare protocols', style: TextStyle(color: AppTheme.teal2)),
                            const TextSpan(text: '. This includes consistent exercise, nutritional monitoring, and immediate reporting of any health anomalies.'),
                          ],
                        ),
                        _buildDivider(),
                        _buildTermItem(
                          icon: Icons.credit_card_outlined,
                          title: 'Payment & Subscription',
                          contentParts: [
                            const TextSpan(text: 'Subscriptions are billed monthly. Cancellation must be processed '),
                            TextSpan(text: '48 hours', style: TextStyle(color: AppTheme.teal2)),
                            const TextSpan(text: ' prior to the renewal date. Refunds are subject to the specific service level agreement selected.'),
                          ],
                        ),
                        _buildDivider(),
                        _buildTermItem(
                          icon: Icons.shield_outlined,
                          title: 'Liability',
                          contentParts: [
                            const TextSpan(text: 'Our liability for any single incident is capped at the total amount paid for the specific service. Users agree to '),
                            TextSpan(text: 'indemnify the platform', style: TextStyle(color: AppTheme.teal2)),
                            const TextSpan(text: ' against third-party claims.'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // I Agree Button
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.h, top: 10.h),
            child: CustomButton(
              text: 'I agree',
              onPressed: () {
                Get.back();
              },
              gradient: AppTheme.secondaryGradient,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermItem({
    required IconData icon,
    required String title,
    required List<TextSpan> contentParts,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: Color(0xFF3B3B5B), // Icon background
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.manrope(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFD7CEC8),
                      height: 1.5,
                    ),
                    children: contentParts,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Divider(
        color: const Color(0xFF454565),
        thickness: 1,
        height: 1,
      ),
    );
  }
}