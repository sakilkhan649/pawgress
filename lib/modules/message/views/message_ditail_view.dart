import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../controllers/message_ditail_controller.dart';

class MessageDitailView extends GetView<MessageDitailController> {
  const MessageDitailView({super.key});

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
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: AssetImage(ImagePaths.onboardingImage),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF53D49D),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF1E1528), width: 1.5.w),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sarah Mitchell',
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.manrope(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF53D49D),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemCount: controller.messages.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return _buildChatBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(Map<String, dynamic> message) {
    final isMe = message['isMe'];
    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 0.7.sw),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFF435A54) : Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: isMe ? Radius.circular(16.r) : Radius.zero,
              bottomRight: isMe ? Radius.zero : Radius.circular(16.r),
            ),
            border: isMe ? null : Border.all(color: const Color(0xFF454565)),
          ),
          child: Text(
            message['text'],
            style: GoogleFonts.manrope(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          message['time'],
          style: GoogleFonts.manrope(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8B7882),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: EdgeInsets.all(24.w),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF454565)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF454565),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.attach_file, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              style: GoogleFonts.manrope(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: GoogleFonts.manrope(color: const Color(0xFF8B7882), fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF454565),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.send, color: Colors.white, size: 20.sp),
          ),
        ],
      ),
    );
  }
}