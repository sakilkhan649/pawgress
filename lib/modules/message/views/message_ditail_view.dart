import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/constants/image_paths.dart';
import '../controllers/message_ditail_controller.dart';

class MessageDitailView extends GetView<MessageDitailController> {
  const MessageDitailView({super.key});

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
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage(ImagePaths.massageProfileImage),
                ),
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
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sarah Mitchell',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF82C4A8),
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
              padding: EdgeInsets.all(20.w),
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
      crossAxisAlignment: isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 0.7.sw),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: isMe
                ? const Color(0xFF86CEAC).withValues(alpha: 0.60)
                : const Color(0xFF2A2141),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
              bottomLeft: isMe ? Radius.circular(16.r) : Radius.zero,
              bottomRight: isMe ? Radius.zero : Radius.circular(16.r),
            ),
            border: isMe
                ? Border.all(color: const Color(0xFFE5E7EB))
                : Border.all(color: const Color(0xFFE6D8D8)),
          ),
          child: Text(
            message['text'],
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          message['time'],
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      margin: EdgeInsets.all(30.w),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3150).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF454565),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(ImagePaths.documentSendSmsIcon),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              style: GoogleFonts.manrope(color: Colors.white, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: GoogleFonts.manrope(
                  color: const Color(0xFF8B7882),
                  fontSize: 14.sp,
                ),
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
            child: SvgPicture.asset(ImagePaths.sendSmsIcon),
          ),
        ],
      ),
    );
  }
}
