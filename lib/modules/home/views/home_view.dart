import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/routes/app_pages.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        //Header Section
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Alex! 👋',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Let\'s train Buddy today',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFECEDEE),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.notificationView),
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: const BoxDecoration(
                  color: Color(0xFF3F4066),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                    Positioned(
                      right: -6.w,
                      top: -13.h,
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFFFFFFF),
                            width: 2.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: ImagePaths.completeIcon,
                      value: '12/15',
                      label: 'Tasks Complete',
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildStatCard(
                      icon: ImagePaths.hoursIcon,
                      value: '8.5',
                      label: 'Training Hours',
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildStatCard(
                      icon: ImagePaths.completeIcon,
                      value: '78%',
                      label: 'Progress',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              // Today's Tasks
              _buildSectionHeader(
                title: "Today's Tasks",
                actionText: 'View All',
                onTap: () {
                  Get.toNamed(AppRoutes.lessonView, arguments: {'showBackButton': true});
                },
              ),
              SizedBox(height: 18.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.lessonView, arguments: {'showBackButton': true});
                },
                child: _buildTaskCard(
                  icon: Icons.record_voice_over_outlined,
                  title: 'Practice "Sit" command',
                  subtitle: '10 repetitions',
                ),
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.lessonView, arguments: {'showBackButton': true});
                },
                child: _buildTaskCard(
                  icon: Icons.favorite_border,
                  title: 'Reward positive behavior',
                  subtitle: 'Throughout the day',
                ),
              ),
              SizedBox(height: 32.h),

              // Upcoming Sessions
              _buildSectionHeader(
                title: "Upcoming Sessions",
                actionText: 'View Calendar',
                onTap: () {
                  Get.toNamed(AppRoutes.scheduleView, arguments: {'showBackButton': true});
                },
              ),
              SizedBox(height: 16.h),
              _buildSessionCard(
                tag: 'BASIC OBEDIENCE',
                title: 'With Sarah Mitchell',
                time: 'Today    3:00 PM',
              ),
              SizedBox(height: 12.h),
              _buildSessionCard(
                tag: 'BEHAVIORAL ASSESSMENT',
                title: 'with Mike Johnson',
                time: 'Today    2:00 PM',
              ),
              SizedBox(height: 32.h),

              // Quick Actions
              Text(
                'Quick Actions',
                style: GoogleFonts.manrope(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.messageView),
                      child: _buildQuickActionCard(
                        icon: Icons.chat_bubble,
                        title: 'Messages',
                        subtitle: 'CHAT WITH TRAINER',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.videoView),
                      child: _buildQuickActionCard(
                        icon: Icons.play_circle_filled,
                        title: 'Videos',
                        subtitle: 'TRAINING LIBRARY',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.behaviorView),
                      child: _buildQuickActionCard(
                        icon: Icons.edit_document,
                        title: 'Log Behavior',
                        subtitle: 'TRACK MOOD',
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.homeworkView),
                      child: _buildQuickActionCard(
                        icon: Icons.assignment,
                        title: 'Homework',
                        subtitle: 'VIEW MATERIALS',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

//Stat card 
  Widget _buildStatCard({
    required String icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(14.w, 12.h, 10.w, 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF999999)),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF02E379),
            Color(0xFF1B8BB6),
          ], // Green to Blue gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF02E379).withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 24.w,
            width: 24.w,
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
//Section header
  Widget _buildSectionHeader({
    required String title,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF01E378),
            ),
          ),
        ),
      ],
    );
  }
//Task Card
  Widget _buildTaskCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF3B3459).withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF0BC38F).withValues(alpha: 0.60),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: Color(0xFF0DBB95),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFC7BFBA),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.radio_button_unchecked,
            color: Color(0xFF0DBB95),
            size: 24.sp,
          ),
        ],
      ),
    );
  }
//Session Card
  Widget _buildSessionCard({
    required String tag,
    required String title,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: const Color(0xFF3B3459).withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF0BC38F).withValues(alpha: 0.60),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              ImagePaths.dogProfileImage,
              width: 80.w,
              height: 96.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppTheme.teal2.withValues(alpha: 0.5)),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.inter(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF02CE88),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: const Color(0xFFC0BAB5),
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      time.split('    ')[0],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFC0BAB5),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(
                      Icons.access_time_outlined,
                      color: const Color(0xFFC0BAB5),
                      size: 12.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      time.split('    ')[1],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFC0BAB5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
//Quick Action Card
  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF3B3459).withValues(alpha: 0.60),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF0BC38F).withValues(alpha: 0.60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: AppTheme.teal2,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: Colors.white, size: 24.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFC3C0BE),
            ),
          ),
        ],
      ),
    );
  }
}
