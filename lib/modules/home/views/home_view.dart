import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: const Color(0xFF1E1528), // Background matches image
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Alex! 👋',
                        style: GoogleFonts.manrope(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Let\'s train Buddy today',
                        style: GoogleFonts.manrope(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFD7CEC8),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.notificationView),
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3B3B5B),
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
                            right: 2.w,
                            top: 2.h,
                            child: Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard(
                    icon: Icons.check_circle_outline,
                    value: '12/15',
                    label: 'Tasks Complete',
                  ),
                  _buildStatCard(
                    icon: Icons.timer_outlined,
                    value: '8.5',
                    label: 'Training Hours',
                  ),
                  _buildStatCard(
                    icon: Icons.check_circle_outline,
                    value: '78%',
                    label: 'Progress',
                  ),
                ],
              ),
              SizedBox(height: 32.h),

              // Today's Tasks
              _buildSectionHeader(title: "Today's Tasks", actionText: 'View All'),
              SizedBox(height: 16.h),
              _buildTaskCard(
                icon: Icons.record_voice_over_outlined,
                title: 'Practice "Sit" command',
                subtitle: '10 repetitions',
              ),
              SizedBox(height: 12.h),
              _buildTaskCard(
                icon: Icons.favorite_border,
                title: 'Reward positive behavior',
                subtitle: 'Throughout the day',
              ),
              SizedBox(height: 32.h),

              // Upcoming Sessions
              _buildSectionHeader(title: "Upcoming Sessions", actionText: 'View Calendar'),
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

  Widget _buildStatCard({required IconData icon, required String value, required String label}) {
    return Container(
      width: 105.w, 
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF21E0A1), Color(0xFF2490CD)], // Green to Blue gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF21E0A1).withOpacity(0.2),
            blurRadius: 8.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: GoogleFonts.manrope(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({required String title, required String actionText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text(
          actionText,
          style: GoogleFonts.manrope(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: AppTheme.teal2,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskCard({required IconData icon, required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF454565)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: Color(0xFF3B3B5B),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.teal2, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFD7CEC8),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.radio_button_unchecked, color: AppTheme.teal2, size: 24.sp),
        ],
      ),
    );
  }

  Widget _buildSessionCard({required String tag, required String title, required String time}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF454565)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              ImagePaths.onboardingImage,
              width: 80.w,
              height: 80.w,
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
                    border: Border.all(color: AppTheme.teal2.withOpacity(0.5)),
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.manrope(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: AppTheme.teal2,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: const Color(0xFFD7CEC8), size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      time.split('    ')[0],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFD7CEC8),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Icon(Icons.access_time_outlined, color: const Color(0xFFD7CEC8), size: 12.sp),
                    SizedBox(width: 4.w),
                    Text(
                      time.split('    ')[1],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFD7CEC8),
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

  Widget _buildQuickActionCard({required IconData icon, required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF454565)),
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
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: GoogleFonts.manrope(
              fontSize: 9.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: const Color(0xFFD7CEC8),
            ),
          ),
        ],
      ),
    );
  }
}
