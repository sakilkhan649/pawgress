import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/contract_support_controller.dart';

class ContractSupportView extends GetView<ContractSupportController> {
  const ContractSupportView({super.key});

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
          'Contact Support',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 15.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2843), // Card background
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFF4C4D4C),
                ), // Slight border
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4B4765), // Icon background
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.headset_mic_outlined,
                      color: Colors.white,
                      size: 32.sp,
                    ),
                  ),
                  SizedBox(height: 29.h),
                  Text(
                    'Email Support',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Need help? Send us a message and our support\nteam will get back to you shortly.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Form Fields Card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2843), // Card background
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: const Color(0xFF4C4D4C),
                ), // Slight border
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildField(
                    label: 'Subject',
                    hintText: 'Type...',
                    controller: controller.subjectController,
                  ),
                  SizedBox(height: 30.h),
                  _buildField(
                    label: 'Your Email',
                    hintText: 'john.doe@email.com',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  _buildField(
                    label: 'Message',
                    hintText: 'type',
                    controller: controller.messageController,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Attachments Section
            Text(
              'ATTACHMENTS',
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2843), // Card background
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFF4C4D4C), // Slight border
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Color(0xFF454565),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF4C4D4C),
                      ), // Slight border
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Upload photos or screenshots (Optional)',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),

            // Send Button
            CustomButton(
              text: 'Send',
              onPressed: () {
                Get.back();
              },
              gradient: AppTheme.secondaryGradient, // Green to blue gradient
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF454565), // Inner field background
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFF4C4D4C)), // Slight border
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFD7CEC8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
