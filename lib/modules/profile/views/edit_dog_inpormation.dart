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
      backgroundColor: const Color(0xFF211134), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF454565),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(10.w),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
            ),
          ),
        ),
        title: Text(
          'Edit Profile', // The image shows "Edit Profile" for this page as well
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
            SizedBox(height: 10.h),

            // Form Fields
            _buildField(
              label: 'DOG NAME',
              controller: controller.nameController,
            ),
            SizedBox(height: 22.h),
            _buildField(
              label: 'AGE',
              controller: controller.ageController,
            ),
            SizedBox(height: 22.h),
            _buildField(
              label: 'BREED / BRAND',
              controller: controller.breedController,
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
            color: const Color(0xFF372848), // Text field background
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFF2A9483)), // Slight border
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: GoogleFonts.inter(
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