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
          'Behavior Tracking',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
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
            _buildSaveButton(),
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
          color: const Color(0xFF2C2843),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF454565)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: const Color(0xFF454565).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.calendar_today, color: AppTheme.teal2, size: 20.sp),
            ),
            SizedBox(width: 16.w),
            Obx(() => Text(
                  DateFormat('d/M/yyyy').format(controller.selectedDate.value),
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )),
            const Spacer(),
            Text(
              'Change Date',
              style: GoogleFonts.manrope(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8B7882),
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
        backgroundColor: const Color(0xFF2C2843),
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
                      leftChevronIcon: Icon(Icons.chevron_left, color: const Color(0xFF8B7882), size: 20.sp),
                      rightChevronIcon: Icon(Icons.chevron_right, color: const Color(0xFF8B7882), size: 20.sp),
                      titleTextStyle: GoogleFonts.manrope(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                      headerPadding: EdgeInsets.zero,
                      leftChevronPadding: EdgeInsets.zero,
                      rightChevronPadding: EdgeInsets.zero,
                      titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      weekendTextStyle: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      outsideTextStyle: GoogleFonts.manrope(
                        color: const Color(0xFF454565),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedTextStyle: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      todayTextStyle: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
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
                      weekdayStyle: GoogleFonts.manrope(
                        color: const Color(0xFF8B7882),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      weekendStyle: GoogleFonts.manrope(
                        color: const Color(0xFF8B7882),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
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
                            bottom: 1,
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

  Widget _buildSectionHeader(String title, {bool showInfo = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        if (showInfo)
          Icon(Icons.info_outline, color: const Color(0xFF53D49D).withOpacity(0.5), size: 20.sp),
      ],
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
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE8F5E9).withOpacity(0.9) : Colors.transparent,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected ? Colors.transparent : const Color(0xFF454565),
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
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? const Color(0xFF1B5E20) : const Color(0xFFD7CEC8),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF53D49D) : const Color(0xFF454565),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Text(
                tag,
                style: GoogleFonts.manrope(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xFF1E1528) : Colors.white,
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
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF454565)),
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

  Widget _buildSaveButton() {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        gradient: AppTheme.secondaryGradient,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppTheme.teal2.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        child: Text(
          'Save Log',
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E1528),
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
          style: GoogleFonts.manrope(
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
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
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF454565).withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF454565).withOpacity(0.3),
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
                    style: GoogleFonts.manrope(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    log['time'],
                    style: GoogleFonts.manrope(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8B7882),
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
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF454565),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.manrope(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          Text(
            log['notes'],
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFD7CEC8),
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