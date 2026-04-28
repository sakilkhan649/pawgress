import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/routes/app_pages.dart';
import '../controllers/message_controller.dart';

class MessageViews extends GetView<MessageController> {
  const MessageViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
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
          'Messages',
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
              backgroundImage: AssetImage(ImagePaths.massageProfileImage),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: controller.conversations.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final conversation = controller.conversations[index];
                return _buildMessageCard(conversation);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2141),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFF4E8A6B)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: const Color(0xFF8B7882), size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              style: GoogleFonts.manrope(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Search conversations...',
                hintStyle: GoogleFonts.manrope(
                  color: const Color(0xFF8B7882),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageCard(Map<String, dynamic> conversation) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.messageDitailView),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF30264B),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF493A7C)),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundImage: AssetImage(ImagePaths.massageProfileImage),
                ),
                if (conversation['isOnline'])
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF82C4A8),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFFFFFFF),
                          width: 2.w,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        conversation['name'],
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        conversation['time'],
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation['lastMessage'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFC3BDBD),
                          ),
                        ),
                      ),
                      if (conversation['unreadCount'] > 0)
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          padding: EdgeInsets.all(6.w),
                          decoration: const BoxDecoration(
                            color: Color(0xFF82C4A8),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            conversation['unreadCount'].toString(),
                            style: GoogleFonts.inter(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                    ],
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
