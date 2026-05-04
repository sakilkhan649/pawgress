import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/lesson_play_controller.dart';

class LessonPlayView extends GetView<LessonPlayController> {
  const LessonPlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isFullscreen.value) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: _buildVideoPlayer()),
        );
      }

      final lesson = controller.currentLesson.value;
      if (lesson == null) {
        return const Scaffold(
          backgroundColor: Color(0xFF211134),
          body: Center(child: CircularProgressIndicator()),
        );
      }

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
            'Training Lesson',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player
              _buildVideoPlayer(),
              SizedBox(height: 10.h),
              Text(
                lesson.title,
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                lesson.description,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFAAAEB7),
                ),
                maxLines: 2,
              ),
              SizedBox(height: 32.h),

              // Repetitions Tracker
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF30264B),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Repetitions',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: controller.decrementRepetitions,
                          child: Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F4F6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: const Color(0xFF2C2843),
                              size: 24.sp,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${controller.currentRepetitions.value}/10',
                              style: GoogleFonts.inter(
                                fontSize: 42.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'REPETITIONS',
                              style: GoogleFonts.manrope(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFAEAEAE),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: controller.incrementRepetitions,
                          child: Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF08C290),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF65D187),
                          ),
                        ),
                        Text(
                          '${(controller.progress * 100).toInt()}%',
                          style: GoogleFonts.manrope(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF65D187),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: LinearProgressIndicator(
                        value: controller.progress,
                        backgroundColor: const Color(0xFFF2F4F6),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppTheme.teal2,
                        ),
                        minHeight: 10.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildVideoPlayer() {
    return Obx(() {
      return Container(
        width: double.infinity,
        height: controller.isFullscreen.value ? 1.sh : 218.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: controller.isFullscreen.value
              ? null
              : BorderRadius.circular(20.r),
        ),
        child: ClipRRect(
          borderRadius: controller.isFullscreen.value
              ? BorderRadius.zero
              : BorderRadius.circular(20.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Video Player
              if (controller.isInitialized.value)
                Center(
                  child: AspectRatio(
                    aspectRatio:
                        controller.videoPlayerController!.value.aspectRatio,
                    child: VideoPlayer(controller.videoPlayerController!),
                  ),
                )
              else
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      ImagePaths.dogProfileImage,
                      width: double.infinity,
                      height: 218.h,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.6),
                    ),
                    const CircularProgressIndicator(color: Colors.white),
                  ],
                ),
              // Transparent overlay to toggle play/pause on tap
              if (controller.isInitialized.value)
                GestureDetector(
                  onTap: () => controller.togglePlay(),
                  child: Container(color: Colors.transparent),
                ),
              // Play/Pause Button
              if (controller.isInitialized.value)
                AnimatedOpacity(
                  opacity: !controller.isPlaying.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () => controller.togglePlay(),
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        controller.isPlaying.value
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: AppTheme.teal2,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              // Fullscreen icon
              Positioned(
                top: 16.h,
                right: 16.w,
                child: GestureDetector(
                  onTap: () => controller.toggleFullscreen(),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Icon(
                      controller.isFullscreen.value
                          ? Icons.fullscreen_exit
                          : Icons.fullscreen,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              // Controls Overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      // Progress Bar
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              final progress =
                                  (details.localPosition.dx /
                                          constraints.maxWidth)
                                      .clamp(0.0, 1.0);
                              controller.seekToProgress(progress);
                            },
                            onTapDown: (details) {
                              final progress =
                                  (details.localPosition.dx /
                                          constraints.maxWidth)
                                      .clamp(0.0, 1.0);
                              controller.seekToProgress(progress);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 4.h, // Slightly larger touch area
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.3),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                Obx(() {
                                  double progress = 0;
                                  if (controller.duration.value.inMilliseconds >
                                      0) {
                                    progress =
                                        controller
                                            .position
                                            .value
                                            .inMilliseconds /
                                        controller
                                            .duration
                                            .value
                                            .inMilliseconds;
                                  }
                                  return Container(
                                    height: 4.h,
                                    width: constraints.maxWidth * progress,
                                    decoration: BoxDecoration(
                                      color: AppTheme.teal2,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.seekBackward(),
                                child: Icon(
                                  Icons.replay_10,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                '${controller.formatDuration(controller.position.value)} / ${controller.formatDuration(controller.duration.value)}',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              GestureDetector(
                                onTap: () => controller.seekForward(),
                                child: Icon(
                                  Icons.forward_10,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.toggleVolume(),
                                child: Icon(
                                  controller.isMuted.value
                                      ? Icons.volume_off
                                      : Icons.volume_up,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    isScrollControlled: true,
                                    Container(
                                      padding: EdgeInsets.all(20.w),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2A2141),
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Video Settings',
                                              style: GoogleFonts.inter(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.speed,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'Playback Speed',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              trailing: Text(
                                                '1.0x',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onTap: () => Get.back(),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.high_quality,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                'Quality',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              trailing: Text(
                                                'Auto',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onTap: () => Get.back(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
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
        ),
      );
    });
  }
}
