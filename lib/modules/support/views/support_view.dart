import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/routes/app_pages.dart';

import '../../../config/themes/app_theme.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1528), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF454565), // Greyish purple
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
              onPressed: () => Get.back(),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        title: Text(
          'Support',
          style: GoogleFonts.manrope(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2843), // Card background
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF454565)), // Slight border
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            leading: Container(
              padding: EdgeInsets.all(12.w),
              decoration: const BoxDecoration(
                color: Color(0xFF454565), // Icon background
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mail_outline,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            title: Text(
              'Email Support',
              style: GoogleFonts.manrope(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                'support@petcareapp.com',
                style: GoogleFonts.manrope(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.teal2,
                ),
              ),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.greyBrown,
              size: 24.sp,
            ),
            onTap: () {
              Get.toNamed(AppRoutes.contractSupportView);
            },
          ),
        ),
      ),
    );
  }
}