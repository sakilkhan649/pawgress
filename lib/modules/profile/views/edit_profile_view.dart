import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134), // Background matches image
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
          'Edit Profile',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            // Profile Picture
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4.w),
                        ),
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: const Color(0xFF3B3B5B),
                          // A placeholder for the user's photo
                          backgroundImage: AssetImage(ImagePaths.editProfileImage),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF006E2C),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFFFFFFF), width: 4.w),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Change Photo',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF01CE87),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Form Fields
            _buildField(
              label: 'FULL NAME',
              controller: controller.nameController,
            ),
            SizedBox(height: 22.h),
            _buildField(
              label: 'EMAIL',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 22.h),
            _buildField(
              label: 'PHONE NUMBER',
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 56.h),

            // Save Button
            CustomButton(
              text: 'Save',
              onPressed: () {
                Get.back();
              },
              gradient: AppTheme.secondaryGradient, // Green to blue gradient
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF312347), // Text field background
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFF2F4876)), // Slight border
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.manrope(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFD7CEC8), // Lighter text color
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}