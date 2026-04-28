import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/play_video_controller.dart';

class PlayVideoView extends GetView<PlayVideoController> {
  const PlayVideoView({super.key});

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
          'Video Library',
          style: GoogleFonts.inter(
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
              backgroundImage: AssetImage(ImagePaths.dogProfileImage),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          _buildVideoPlayer(),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: _buildVideoDetailsCard(),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return Container(
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(controller.video.thumbnail),
          fit: BoxFit.cover,
          opacity: 0.6,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Play Button
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              color: const Color(0xFF6C5DD3).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 40.sp),
          ),
          // Fullscreen icon
          Positioned(
            top: 16.h,
            right: 16.w,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Icon(Icons.fullscreen, color: Colors.white, size: 20.sp),
            ),
          ),
          // Controls Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: Column(
                children: [
                  // Progress Bar
                  Stack(
                    children: [
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      Container(
                        height: 4.h,
                        width: 0.4.sw,
                        decoration: BoxDecoration(
                          color: AppTheme.teal2,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.replay_10, color: Colors.white, size: 24.sp),
                          SizedBox(width: 16.w),
                          Text(
                            '01:25 / ${controller.video.duration}',
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Icon(Icons.forward_10, color: Colors.white, size: 24.sp),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.volume_up, color: Colors.white, size: 20.sp),
                          SizedBox(width: 16.w),
                          Icon(Icons.settings, color: Colors.white, size: 20.sp),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoDetailsCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFF372848),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.video.title,
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Learn how to train your dog to sit using positive reinforcement techniques that build trust and focus.',
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFEDEDED),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundImage: AssetImage(controller.video.trainerImage),
              ),
              SizedBox(width: 10.w),
              Text(
                'By ${controller.video.trainerName}',
                style: GoogleFonts.manrope(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFD9D9D9),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF77DAA7),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: const Color(0xFF474554), size: 13.sp),
                    SizedBox(width: 6.w),
                    Text(
                      'Duration: ${controller.video.duration} min',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF474554),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: const Color(0xFF77DAA7),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bar_chart, color: const Color(0xFF474554), size: 18.sp),
                SizedBox(width: 8.w),
                Text(
                  controller.video.category,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF474554),
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