import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../../home/views/home_view.dart';
import '../../lessons/views/lessons_view.dart';
import '../../profile/views/profile_view.dart';
import '../../progress/views/progress_view.dart';
import '../../schedule/views/schedule_view.dart';
import '../controllers/bottom_nab_bar_controller.dart';

class BottomNabBarView extends GetView<BottomNabBarController> {
  const BottomNabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomeView(),
            LessonsView(),
            ProgressView(),
            ScheduleView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}

class CustomBottomBar extends GetView<BottomNabBarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: Color(0xFF211134),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(255, 141, 139, 145).withValues(alpha: 0.20),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, ImagePaths.homeIcon, 'HOME'),
            _buildNavItem(1, ImagePaths.lessonsIcon, 'LESSONS'),
            _buildNavItem(2, ImagePaths.progressIcon, 'PROGRESS'),
            _buildNavItem(3, ImagePaths.scheduleIcon, 'SCHEDULE'),
            _buildNavItem(4, ImagePaths.profileIcon, 'PROFILE'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    return Obx(() {
      final isSelected = controller.currentIndex.value == index;
      final color = isSelected ? AppTheme.teal2 : AppTheme.greyBrown;

      return GestureDetector(
        onTap: () => controller.changePage(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: color,
                  fontSize: 10.sp,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}