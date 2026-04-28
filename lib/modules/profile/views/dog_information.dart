import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import '../../../config/constants/image_paths.dart';
import '../controllers/dog_information_controller.dart';

class DogInformationView extends GetView<DogInformationController> {
  const DogInformationView({super.key});

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
          'Dog Information',
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
            // Dog Picture
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
                          backgroundImage: const AssetImage(
                            ImagePaths.dogProfileImage,
                          ),
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
                            border: Border.all(
                              color: const Color(0xFFFFFFFF),
                              width: 4.w,
                            ),
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
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF01CD87),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Dog Info Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: const Color(0xFF30264B), // Card background
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: const Color(0xFF2A9483),
                ), // Slight border
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buddy',
                          style: GoogleFonts.manrope(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Golden Retriever • 2 years',
                          style: GoogleFonts.manrope(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF01D087),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.editDogInformationView),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2E374E), // Lighter circle
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        ImagePaths.editIcon,
                        height: 24.w,
                        width: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
