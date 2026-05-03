import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/routes/app_pages.dart';
import '../../../config/themes/app_theme.dart';
import '../../../data/models/library_model.dart';
import '../controllers/video_controller.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({super.key});

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
            child: GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.profileView, arguments: {'showBackButton': true}),
              child: CircleAvatar(
                radius: 18.r,
                backgroundImage: AssetImage(ImagePaths.dogProfileImage),
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: _buildSearchBar(),
          ),
          _buildFilterChips(),
          Expanded(
            child: Obx(() {
              final videos = controller.filteredVideos;
              return ListView.separated(
                padding: EdgeInsets.only(left: 20.w, right: 20.w,top: 16.h, bottom: 30.h),
                itemCount: videos.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return _buildVideoCard(videos[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2141),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF4E8A6B)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: const Color(0xFFDBC4C4), size: 24.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: controller.setSearch,
              style: GoogleFonts.manrope(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Search video...',
                hintStyle: GoogleFonts.manrope(color: const Color(0xFFDBC4C4), fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildFilterChips() {
    final categories = ['All', 'Basic', 'Advanced', 'Behavior'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: categories.map((category) {
          return Obx(
            () {
              final isSelected = controller.selectedCategory.value == category;
              return GestureDetector(
                onTap: () => controller.setCategory(category),
                child: Container(
                  margin: EdgeInsets.only(right: 12.w),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : Color(0xFF05C58D),
                    ),
                    gradient: isSelected ? AppTheme.secondaryGradient : null,
                  ),
                  child: Text(
                    category,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Color(0xFF05C58D),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVideoCard(LibraryModel video) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.playVideoView, arguments: video),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFC48FED).withValues(alpha: 0.25),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFFDBC7C7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                  child: Image.asset(
                    video.thumbnail,
                    width: double.infinity,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Color(0xFF04C68C),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      video.category.toUpperCase(),
                      style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          video.duration,
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    video.description,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFC9C9CC),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}