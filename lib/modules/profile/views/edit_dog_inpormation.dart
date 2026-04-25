import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/themes/app_theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/edit_dog_information_controller.dart';

class EditDogInformationView extends GetView<EditDogInformationController> {
  const EditDogInformationView({super.key});

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
          'Edit Profile', // The image shows "Edit Profile" for this page as well
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
        child: Column(
          children: [
            SizedBox(height: 10.h),

            // Form Fields
            _buildField(
              label: 'DOG NAME',
              controller: controller.nameController,
            ),
            SizedBox(height: 20.h),
            _buildField(
              label: 'AGE',
              controller: controller.ageController,
            ),
            SizedBox(height: 20.h),
            _buildField(
              label: 'BREED / BRAND',
              controller: controller.breedController,
            ),
            SizedBox(height: 40.h),

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
          style: GoogleFonts.manrope(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C2843), // Text field background
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFF454565)), // Slight border
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