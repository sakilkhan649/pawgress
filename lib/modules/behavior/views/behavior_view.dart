import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/behavior_controller.dart';

class BehaviorView extends GetView<BehaviorController> {
  const BehaviorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134),
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
          'Behavior Tracking',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage(ImagePaths.dogProfileImage),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSelector(context),
            SizedBox(height: 32.h),
            _buildSectionHeader('How is Buddy feeling?', showInfo: true),
            SizedBox(height: 16.h),
            _buildFeelingGrid(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Behavior Tags'),
            SizedBox(height: 16.h),
            _buildTagsWrap(),
            SizedBox(height: 32.h),
            _buildSectionHeader('Additional Notes'),
            SizedBox(height: 16.h),
            _buildNotesField(),
            SizedBox(height: 32.h),
            _buildSaveButton('Save Log', () {}),
            SizedBox(height: 40.h),
            _buildRecentLogsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCalendarDialog(context),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF372848),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF01551F).withValues(alpha: 0.80)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF01551F).withValues(alpha: 0.10)),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.calendar_today, color: Color(0xFF10B981), size: 20.sp),
            ),
            SizedBox(width: 16.w),
            Obx(() => Text(
                  DateFormat('d/M/yyyy').format(controller.selectedDate.value),
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )),
            const Spacer(),
            Text(
              'Change Date',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF10B981),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF403057),
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 24.sp),
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(() => TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: controller.focusedDate.value,
                    selectedDayPredicate: (day) => isSameDay(controller.selectedDate.value, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.updateDate(selectedDay);
                      controller.updateFocusedDate(focusedDay);
                    },
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: false,
                      leftChevronVisible: true,
                      rightChevronVisible: true,
                      leftChevronIcon: Icon(Icons.chevron_left, color: const Color(0xFF8B7882), size: 24.sp),
                      rightChevronIcon: Icon(Icons.chevron_right, color: const Color(0xFF8B7882), size: 24.sp),
                      titleTextStyle: GoogleFonts.inter(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      headerPadding: EdgeInsets.only(bottom: 24.h),
                      leftChevronPadding: EdgeInsets.zero,
                      rightChevronPadding: EdgeInsets.zero,
                      titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendTextStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      outsideTextStyle: GoogleFonts.inter(
                        color: const Color(0xFF8B7882).withValues(alpha: 0.5),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedTextStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      todayTextStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      markersMaxCount: 1,
                      markerDecoration: const BoxDecoration(
                        color: Color(0xFF53D49D),
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) => DateFormat.E(locale).format(date)[0],
                      weekdayStyle: GoogleFonts.inter(
                        color: const Color(0xFF8B7882),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      weekendStyle: GoogleFonts.inter(
                        color: const Color(0xFF8B7882),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    eventLoader: (day) {
                      // Mock events for 17th and 19th as per image
                      if (day.day == 17 || day.day == 19) {
                        return [day];
                      }
                      return [];
                    },
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        if (events.isNotEmpty) {
                          return Positioned(
                            bottom: 6.h,
                            child: Container(
                              width: 4.w,
                              height: 4.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFF53D49D),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        }
                        return null;
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showInfo = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        if (showInfo)
          Icon(Icons.info_outline, color: const Color(0xFF006E2C), size: 24.sp),
      ],
    ),
    );
  }

  Widget _buildFeelingGrid() {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: controller.feelings.map((feeling) {
        return Obx(() {
          final isSelected = controller.selectedFeeling.value == feeling['name'];
          return GestureDetector(
            onTap: () => controller.selectFeeling(feeling['name']),
            child: Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 2.w),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF2F6E3) : Color(0xFF372848),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? Color(0xFF372848) : const Color(0xFFF2F6E3).withValues(alpha: 0.60),
                  width: 1.5.w,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _getIconData(feeling['icon']),
                    color: isSelected ? const Color(0xFF53D49D) : Color(feeling['color']),
                    size: 28.sp,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    feeling['name'],
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? const Color(0xFF065F46) : const Color(0xFFE5FFE5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildTagsWrap() {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: controller.availableTags.map((tag) {
        return Obx(() {
          final isSelected = controller.selectedTags.contains(tag);
          return GestureDetector(
            onTap: () => controller.toggleTag(tag),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1FD761) : const Color(0xFF827B8D),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                tag,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF000000) : Colors.white,
                ),
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildNotesField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF372848),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF827272)),
      ),
      child: TextField(
        maxLines: 4,
        style: GoogleFonts.manrope(color: Colors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.w),
          hintText: 'Type...',
          hintStyle: GoogleFonts.manrope(color: const Color(0xFF8B7882)),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSaveButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
        decoration: BoxDecoration(
          gradient: AppTheme.secondaryGradient,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildRecentLogsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Logs',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.recentLogs.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final log = controller.recentLogs[index];
            return _buildLogCard(log);
          },
        ),
      ],
    );
  }

  Widget _buildLogCard(Map<String, dynamic> log) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF372848),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF057E58)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF52535B),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  log['feeling'] == 'Calm' ? Icons.sentiment_satisfied_alt : Icons.favorite_border,
                  color: Color(log['color']),
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log['feeling'],
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    log['time'],
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            children: (log['tags'] as List<String>).map((tag) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF26A72A).withOpacity(0.60),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.inter(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          Text(
            log['notes'],
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String name) {
    switch (name) {
      case 'sentiment_satisfied_alt':
        return Icons.sentiment_satisfied_alt;
      case 'favorite_border':
        return Icons.favorite_border;
      case 'sentiment_dissatisfied':
        return Icons.sentiment_dissatisfied;
      case 'bolt':
        return Icons.bolt;
      case 'sentiment_very_dissatisfied':
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.help_outline;
    }
  }
}