import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/book_training_controller.dart';

class BookTrainingView extends GetView<BookTrainingController> {
  const BookTrainingView({super.key});

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
          'Book Training',
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
            _buildSectionTitle('SELECT TRAINER'),
            SizedBox(height: 16.h),
            _buildTrainerList(),
            SizedBox(height: 32.h),
            _buildSectionTitle('SERVICE TYPE'),
            SizedBox(height: 16.h),
            _buildServiceTypeCard(),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('SELECT DATE'),
                Text(
                  'September 2026',
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.teal2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildDateStrip(),
            SizedBox(height: 32.h),
            _buildSectionTitle('AVAILABLE SLOTS'),
            SizedBox(height: 16.h),
            _buildSlotsGrid(),
            SizedBox(height: 40.h),
            _buildFooter(),
            SizedBox(height: 24.h),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.manrope(
        fontSize: 12.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF8B7882),
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildTrainerList() {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.trainers.length,
        separatorBuilder: (context, index) => SizedBox(width: 20.w),
        itemBuilder: (context, index) {
          final trainer = controller.trainers[index];
          return Obx(() {
            final isSelected = controller.selectedTrainerIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectTrainer(index),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(isSelected ? 3.w : 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected ? Border.all(color: AppTheme.teal2, width: 2.w) : null,
                    ),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundImage: AssetImage(ImagePaths.onboardingImage),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    trainer['name']!,
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected ? AppTheme.teal2 : const Color(0xFF8B7882),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildServiceTypeCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF454565)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppTheme.teal2,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.pets, color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1-on-1 Session',
                  style: GoogleFonts.manrope(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Focused behavioral training',
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFD7CEC8),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '10m',
                style: GoogleFonts.manrope(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'DURATION',
                style: GoogleFonts.manrope(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF8B7882),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateStrip() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.dates.length, (index) {
          final date = controller.dates[index];
          return Obx(() {
            final isSelected = controller.selectedDateIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectDate(index),
              child: Container(
                width: 50.w,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.teal2 : Colors.transparent,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppTheme.teal2.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : null,
                ),
                child: Column(
                  children: [
                    Text(
                      date['day']!,
                      style: GoogleFonts.manrope(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: isSelected ? const Color(0xFF1E1528) : const Color(0xFF8B7882),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      date['date']!,
                      style: GoogleFonts.manrope(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: isSelected ? const Color(0xFF1E1528) : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  Widget _buildSlotsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 2.2,
      ),
      itemCount: controller.slots.length,
      itemBuilder: (context, index) {
        final slot = controller.slots[index];
        final isDisabled = slot == '06:00 PM';
        return Obx(() {
          final isSelected = controller.selectedSlot.value == slot;
          return GestureDetector(
            onTap: isDisabled ? null : () => controller.selectSlot(slot),
            child: Opacity(
              opacity: isDisabled ? 0.4 : 1.0,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.teal2 : const Color(0xFF2C2843),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  slot,
                  style: GoogleFonts.manrope(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? const Color(0xFF1E1528) : Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TOTAL PRICE',
              style: GoogleFonts.manrope(
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF8B7882),
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 4.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$85',
                    style: GoogleFonts.manrope(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: ' / session',
                    style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF8B7882),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'SELECTED PET',
              style: GoogleFonts.manrope(
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF8B7882),
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text(
                  'Cooper',
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFD7CEC8),
                  ),
                ),
                SizedBox(width: 6.w),
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD7CEC8),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        gradient: AppTheme.secondaryGradient,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppTheme.teal2.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Text(
          'CONFIRM BOOKING',
          style: GoogleFonts.manrope(
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E1528),
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}