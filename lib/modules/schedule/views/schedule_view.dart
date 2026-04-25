import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/routes/app_pages.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});

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
          'Schedule',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarCard(),
            SizedBox(height: 32.h),
            Text(
              'Upcoming Sessions',
              style: GoogleFonts.manrope(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.upcomingSessions.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final session = controller.upcomingSessions[index];
                return _buildSessionCard(session);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Obx(
            () => TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controller.focusedDay.value,
              selectedDayPredicate: (day) => isSameDay(controller.selectedDay.value, day),
              onDaySelected: controller.onDaySelected,
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: false,
                titleTextStyle: GoogleFonts.manrope(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white, size: 24.sp),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white, size: 24.sp),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: GoogleFonts.manrope(color: const Color(0xFF8B7882), fontWeight: FontWeight.w600),
                weekendStyle: GoogleFonts.manrope(color: const Color(0xFF8B7882), fontWeight: FontWeight.w600),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppTheme.teal2.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppTheme.teal2,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: GoogleFonts.manrope(color: Colors.white),
                weekendTextStyle: GoogleFonts.manrope(color: Colors.white),
                outsideTextStyle: GoogleFonts.manrope(color: const Color(0xFF454565)),
                markersMaxCount: 1,
                markerDecoration: BoxDecoration(
                  color: AppTheme.teal2,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: (day) {
                // Mock events for 17th and 19th as per image
                if (day.day == 17 || day.day == 19) {
                  return [day];
                }
                return [];
              },
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              gradient: AppTheme.secondaryGradient,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.bookTrainingView);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleHeader(borderRadius: BorderRadius.circular(16.r)),
              ),
              child: Text(
                'Book New Session',
                style: GoogleFonts.manrope(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1E1528),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(Map<String, dynamic> session) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(16.r),
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
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppTheme.teal2.withOpacity(0.5)),
                  ),
                  child: Text(
                    session['category'],
                    style: GoogleFonts.manrope(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.teal2,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  session['title'],
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: const Color(0xFF8B7882), size: 14.sp),
                    SizedBox(width: 4.w),
                    Text(
                      session['date'],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF8B7882),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Icon(Icons.access_time, color: const Color(0xFF8B7882), size: 14.sp),
                    SizedBox(width: 4.w),
                    Text(
                      session['time'],
                      style: GoogleFonts.manrope(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF8B7882),
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
}

class RoundedRectangleHeader extends RoundedRectangleBorder {
  const RoundedRectangleHeader({super.borderRadius});
}
