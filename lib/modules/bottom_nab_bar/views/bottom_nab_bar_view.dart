import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawgress/config/constants/image_paths.dart';
import 'package:pawgress/config/themes/app_theme.dart';
import 'package:pawgress/modules/home/views/home_view.dart';
import 'package:pawgress/modules/lessons/views/lessons_view.dart';
import 'package:pawgress/modules/profile/views/profile_view.dart';
import 'package:pawgress/modules/progress/views/progress_view.dart';
import 'package:pawgress/modules/schedule/views/schedule_view.dart';
import 'package:pawgress/modules/bottom_nab_bar/controllers/bottom_nab_bar_controller.dart';

/// ================= MAIN VIEW =================
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

/// ================= NAV MODEL =================
class _NavItem {
  final String label;
  final String iconPath;

  _NavItem(this.label, this.iconPath);
}

/// ================= CUSTOM BOTTOM BAR =================
class CustomBottomBar extends GetView<BottomNabBarController> {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem("HOME", ImagePaths.homeIcon),
      _NavItem("LESSONS", ImagePaths.lessonsIcon),
      _NavItem("PROGRESS", ImagePaths.progressIcon),
      _NavItem("SCHEDULE", ImagePaths.scheduleIcon),
      _NavItem("PROFILE", ImagePaths.profileIcon),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: const Color(0xFF211134),
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
        child: Obx(
          () => Row(
            children: List.generate(items.length, (index) {
              final isSelected = controller.currentIndex.value == index;
              final color = isSelected ? AppTheme.teal2 : Colors.grey;

              return Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.changePage(index),
                    borderRadius: BorderRadius.circular(12.r),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// ICON
                          SvgPicture.asset(
                            items[index].iconPath,
                            width: 24.w,
                            height: 24.w,
                            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                          ),
                          SizedBox(height: 4.h),

                          /// TEXT
                          Text(
                            items[index].label,
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}