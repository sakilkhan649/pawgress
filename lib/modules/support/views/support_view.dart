import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import '../controllers/support_controller.dart';

class SupportView extends GetView<SupportController> {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221234), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
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
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF382948), // Card background
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A9483).withValues(alpha: 0.40)), // Slight border
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            leading: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6).withValues(alpha: 0.20), // Icon background
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
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                'support@petcareapp.com',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF01D086),
                ),
              ),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF6E7A71),
              size: 28.sp,
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