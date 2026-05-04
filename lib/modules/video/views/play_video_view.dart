import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:pawgress/config/routes/app_pages.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/themes/app_theme.dart';
import '../controllers/play_video_controller.dart';

class PlayVideoView extends GetView<PlayVideoController> {
  const PlayVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isFullscreen.value) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(child: _buildVideoPlayer()),
        );
      }

      return Scaffold(
        backgroundColor: const Color(0xFF211134),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w),
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
            'Video Details',
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: GestureDetector(
                onTap: () => Get.toNamed(
                  AppRoutes.profileView,
                  arguments: {'showBackButton': true},
                ),
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage(ImagePaths.dogProfileImage),
                ),
              ),
            ),
          ],
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              _buildVideoPlayer(),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: _buildVideoDetailsCard(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildVideoPlayer() {
    return Obx(() {
      return SizedBox(
        width: double.infinity,
        height: controller.isFullscreen.value ? 1.sh : 250.h,
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
                    controller.video.thumbnail,
                    width: double.infinity,
                    height: 250.h,
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
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6C5DD3).withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      controller.isPlaying.value
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 40.sp,
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
                    color: Colors.white.withValues(alpha: 0.15),
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
                decoration: BoxDecoration(),
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
                                      controller.position.value.inMilliseconds /
                                      controller.duration.value.inMilliseconds;
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
                    SizedBox(height: 16.h),
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
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              '${controller.formatDuration(controller.position.value)} / ${controller.formatDuration(controller.duration.value)}',
                              style: GoogleFonts.manrope(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            GestureDetector(
                              onTap: () => controller.seekForward(),
                              child: Icon(
                                Icons.forward_10,
                                color: Colors.white,
                                size: 24.sp,
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
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
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
                                size: 20.sp,
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
      );
    });
  }

  Widget _buildVideoDetailsCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFF372848),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.10),
        ),
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
                    Icon(
                      Icons.access_time,
                      color: const Color(0xFF474554),
                      size: 13.sp,
                    ),
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
                Icon(
                  Icons.bar_chart,
                  color: const Color(0xFF474554),
                  size: 18.sp,
                ),
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
