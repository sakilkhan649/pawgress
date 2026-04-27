import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/progress_controller.dart';

class ProgressView extends GetView<ProgressController> {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'PROGRESS',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterTabs(),
            SizedBox(height: 32.h),
            Text(
              'Training Hours',
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Total activity this week',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFF1E9E5),
              ),
            ),
            SizedBox(height: 20.h),
            _buildChart(),
            SizedBox(height: 20.h),
            _buildChartLabels(),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final filters = ['Week', 'Month', 'All Time'];
    return Row(
      children: filters.map((filter) {
        return Obx(() {
          final isSelected = controller.selectedFilter.value == filter;
          return GestureDetector(
            onTap: () => controller.selectFilter(filter),
            child: Container(
              margin: EdgeInsets.only(right: 12.w),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF4DAF80) : Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: isSelected
                      ? Color(0xFFC1C6D7)
                      : const Color(0xFFC1C6D7),
                ),
              ),
              child: Text(
                filter,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Color(0xFF000000)
                      : const Color(0xFF000000),
                ),
              ),
            ),
          );
        });
      }).toList(),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200.h,
      padding: EdgeInsets.only(top: 10.h),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Color(0xFF2A2A40).withOpacity(0.4),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),

          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,

          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 0.8),
                FlSpot(1, 2.2),
                FlSpot(2, 1.2),
                FlSpot(3, 3.8),
                FlSpot(4, 2.8),
                FlSpot(5, 4.8),
                FlSpot(6, 4.2),
              ],

              // 🔥 smooth curve
              isCurved: true,
              curveSmoothness: 0.4,

              // 🔵 gradient line
              gradient: const LinearGradient(
                colors: [Color(0xFF1E90FF), Color(0xFF0066FF)],
              ),

              barWidth: 4,
              isStrokeCapRound: true,

              // ❌ remove dots
              dotData: const FlDotData(show: false),

              // 🌊 area gradient fill
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1E90FF).withOpacity(0.25),
                    Color(0xFF1E90FF).withOpacity(0.02),
                  ],
                ),
              ),

              // ✨ glow effect
              shadow: Shadow(
                color: Color(0xFF1E90FF).withOpacity(0.6),
                blurRadius: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartLabels() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        return Text(
          day,
          style: GoogleFonts.inter(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        );
      }).toList(),
    );
  }
}
