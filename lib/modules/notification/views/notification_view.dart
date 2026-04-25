import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/themes/app_theme.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

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
          'Notifications',
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
            _buildNotificationCard(
              icon: Icons.eco,
              iconColor: AppTheme.teal2,
              iconBgColor: AppTheme.teal2.withOpacity(0.15),
              title: 'Practice "Sit" command',
              subtitle: '10 repetitions',
              time: 'Apr 8, 2026 • 3:00 PM',
              isNew: true,
              borderColor: AppTheme.teal2.withOpacity(0.3), // Highlighted border
            ),
            SizedBox(height: 16.h),
            _buildNotificationCard(
              icon: Icons.access_time_filled,
              iconColor: Colors.redAccent.shade100,
              iconBgColor: Colors.redAccent.shade100.withOpacity(0.15),
              title: 'Session Booked: Basic\nObedience',
              subtitle: 'Sarah Mitchell at 3:00 PM',
              time: 'Apr 8, 2026 • 12:45 PM',
            ),
            SizedBox(height: 16.h),
            _buildNotificationCard(
              icon: Icons.security,
              iconColor: Colors.blueAccent.shade100,
              iconBgColor: Colors.blueAccent.shade100.withOpacity(0.15),
              title: 'Security Update',
              subtitle: 'Your account security has been\nimproved.',
              time: 'Apr 7, 2026 • 10:00 AM',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String time,
    bool isNew = false,
    Color? borderColor,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843), // Card background
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor ?? const Color(0xFF454565)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (isNew)
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          'NEW',
                          style: GoogleFonts.manrope(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                            color: const Color(0xFFD7CEC8), // Greyish text
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFD7CEC8),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  time,
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF8B7882), // Darker grey
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}