import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/routes/app_pages.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/lessons_model.dart';
import '../controllers/lessons_controller.dart';

class LessonsView extends GetView<LessonsController> {
  const LessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1528),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Training Lessons',
                style: GoogleFonts.manrope(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Continue your dog\'s learning journey',
                style: GoogleFonts.manrope(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFD7CEC8),
                ),
              ),
              SizedBox(height: 24.h),
              _buildCategoryTabs(),
              SizedBox(height: 24.h),
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    itemCount: controller.filteredLessons.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final lesson = controller.filteredLessons[index];
                      return _buildLessonCard(lesson);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    final categories = ['All', 'Basic', 'Advanced', 'Behavior'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Obx(
            () {
              final isSelected = controller.selectedCategory.value == category;
              return GestureDetector(
                onTap: () => controller.selectCategory(category),
                child: Container(
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : AppTheme.teal2,
                    ),
                    gradient: isSelected ? AppTheme.secondaryGradient : null,
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppTheme.teal2,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLessonCard(LessonsModel lesson) {
    final isCompleted = lesson.status == 'Completed';
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.lessonPlayView, arguments: lesson),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2843),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF454565)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppTheme.teal2,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    isCompleted ? Icons.check : Icons.play_arrow,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppTheme.teal2.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              lesson.category,
                              style: GoogleFonts.manrope(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.teal2,
                              ),
                            ),
                          ),
                          Text(
                            lesson.duration,
                            style: GoogleFonts.manrope(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.teal2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        lesson.title,
                        style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              lesson.description,
              style: GoogleFonts.manrope(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFD7CEC8),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lesson.status,
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.teal2,
                  ),
                ),
                Text(
                  '${(lesson.progress * 100).toInt()}%',
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.teal2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: LinearProgressIndicator(
                value: lesson.progress,
                backgroundColor: const Color(0xFF454565),
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.teal2),
                minHeight: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
