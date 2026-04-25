import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/themes/app_theme.dart';
import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1528), // Background matches image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF454565), // Greyish purple
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
          'Privacy Policy',
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
            Text(
              'SAFETY FIRST',
              style: GoogleFonts.manrope(
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: const Color(0xFFD7CEC8),
              ),
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(
                style: GoogleFonts.manrope(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
                children: [
                  const TextSpan(
                    text: 'Your Trust is\n',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Our Priority.',
                    style: TextStyle(color: AppTheme.teal2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'We designed our policies to be as clear and caring as the service we provide to your furry companions.',
              style: GoogleFonts.manrope(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFD7CEC8),
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),
            
            _buildPrivacyCard(
              icon: Icons.folder_outlined,
              title: 'Data Collection',
              content: RichText(
                text: TextSpan(
                  style: GoogleFonts.manrope(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFD7CEC8),
                    height: 1.5,
                  ),
                  children: const [
                    TextSpan(text: 'To provide a personalized experience for your pets, we collect essential identifiers such as your '),
                    TextSpan(text: 'Full Name, Email Address', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                    TextSpan(text: ', and comprehensive '),
                    TextSpan(text: 'Pet Profiles', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                    TextSpan(text: ' (including health history and preferences).'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            _buildPrivacyCard(
              icon: Icons.settings_outlined,
              title: 'Data Usage',
              content: Text(
                'Your information is exclusively utilized to enhance and improve the application experience. We analyze usage patterns to optimize scheduling, tailor nutrition advice, and refine our caretaker match-making algorithms.',
                style: GoogleFonts.manrope(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFD7CEC8),
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            _buildPrivacyCard(
              icon: Icons.security_outlined,
              title: 'Security Protocol',
              content: Text(
                'We implement industry-standard AES-256 encryption for all data at rest and TLS 1.3 for data in transit. Protecting your information from unauthorized access is a core pillar of our technical infrastructure.',
                style: GoogleFonts.manrope(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFD7CEC8),
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            _buildPrivacyCard(
              icon: Icons.public_outlined,
              title: 'Third-Party Sharing',
              content: Text(
                'We maintain a strict "No-Sale" policy. Your data is never sold to advertisers. We only share essential details with verified pet care providers you explicitly book through our platform.',
                style: GoogleFonts.manrope(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFD7CEC8),
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyCard({
    required IconData icon,
    required String title,
    required Widget content,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2843), // Card background
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF454565)), // Slight border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B3B5B), // Lighter purple
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          content,
        ],
      ),
    );
  }
}