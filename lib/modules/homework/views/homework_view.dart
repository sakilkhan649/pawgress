import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/homework_controller.dart';

class HomeworkView extends GetView<HomeworkController> {
  const HomeworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1528),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF454565),
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
          'Homework Materials',
          style: GoogleFonts.manrope(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage(ImagePaths.onboardingImage),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(24.w),
        itemCount: controller.homeworks.length,
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemBuilder: (context, index) {
          final homework = controller.homeworks[index];
          return _buildHomeworkCard(homework);
        },
      ),
    );
  }

  Widget _buildHomeworkCard(Map<String, dynamic> homework) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFF454565).withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF454565).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  homework['isImportant'] ? Icons.assignment_outlined : Icons.description_outlined,
                  color: homework['isImportant'] ? Colors.redAccent : Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homework['title'],
                      style: GoogleFonts.manrope(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      homework['description'],
                      style: GoogleFonts.manrope(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8B7882),
                      ),
                    ),
                  ],
                ),
              ),
              if (homework['isNew'])
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFF53D49D).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: const Color(0xFF53D49D).withOpacity(0.5)),
                  ),
                  child: Text(
                    'NEW',
                    style: GoogleFonts.manrope(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF53D49D),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            '${homework['date']}  •  ${homework['pages']}  •  ${homework['size']}',
            style: GoogleFonts.manrope(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF8B7882),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF53D49D),
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF53D49D).withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.visibility_outlined, color: const Color(0xFF1E1528), size: 20.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'View',
                          style: GoogleFonts.manrope(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1E1528),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 48.h,
                height: 48.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5.w),
                ),
                child: Icon(Icons.download_outlined, color: Colors.white, size: 22.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}