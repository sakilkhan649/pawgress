import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../config/constants/image_paths.dart';
import '../../../config/routes/app_pages.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF211134), // Background matched with image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: (Get.arguments is Map && Get.arguments['showBackButton'] == true)
            ? Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF454565),
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(10.w),
                    child:
                        Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
                  ),
                ),
              )
            : null,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTopCard(),
              SizedBox(height: 20.h),
              _buildSectionOne(),
              SizedBox(height: 20.h),
              _buildSectionTwo(),
              SizedBox(height: 20.h),
              _buildSectionThree(),
              SizedBox(height: 100.h),
              _buildLogoutButton(),
              SizedBox(height: 100.h), // Bottom nav bar padding
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFF4E8A6B)),
        gradient: RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [
            const Color(0xFF06C190).withValues(alpha: 0.25), // Greenish glow
            const Color(0xFF2C2843),
          ],
          stops: const [0.0, 0.4],
        ),
      ),
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 22.h),
      child: Column(
        children: [
          // User Avatar
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            //user profile image
            child: CircleAvatar(
              radius: 40.r,
              backgroundColor: const Color(0xFF3B3B5B),
              child: Image.asset(ImagePaths.profileImage),
            ),
          ),
          SizedBox(height: 16.h),

          // User Name
          Text(
            'Alex Johnson',
            style: GoogleFonts.manrope(
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.h),

          // User Email
          Text(
            'alex.johnson@pettech.com',
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1ED760),
            ),
          ),
          SizedBox(height: 20.h),

          // Dog Info Inner Card
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: const Color(0xFF4A526E),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Color(0xFF717A96)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const AssetImage(ImagePaths.dogProfileImage),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buddy, Golden Retriever',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        '2 years',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.pets, color: Color(0xFF1ED760), size: 24.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionOne() {
    return Container(
      decoration: _sectionDecoration(),
      child: Column(
        children: [
          _buildListItem(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            iconColor: Color(0xFF40973A),
            onTap: () => Get.toNamed(AppRoutes.editProfileView),
          ),
          _buildDivider(),
          _buildListItem(
            icon: Icons.pets_outlined, // Better icon for dog info
            title: 'Dog Information',
            iconColor: Color(0xFF40973A),
            onTap: () => Get.toNamed(AppRoutes.dogInformationView),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTwo() {
    return Container(
      decoration: _sectionDecoration(),
      child: Column(
        children: [
          _buildListItem(
            icon: Icons.notifications_none_outlined,
            title: 'Notifications',
            iconColor: Color(0xFF6C7B6B),
            onTap: () => Get.toNamed(AppRoutes.notificationView),
          ),
          _buildDivider(),
          _buildListItem(
            icon: Icons.shield_outlined,
            title: 'Privacy',
            iconColor: Color(0xFF6C7B6B),
            onTap: () => Get.toNamed(AppRoutes.privacyView),
          ),
          _buildDivider(),
          _buildListItem(
            icon: Icons.verified_user_outlined,
            title: 'Condition',
            iconColor: Color(0xFF6C7B6B),
            onTap: () => Get.toNamed(AppRoutes.conditionView),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionThree() {
    return Container(
      decoration: _sectionDecoration(),
      child: _buildListItem(
        icon: Icons.help_outline,
        title: 'Support',
        iconColor: Color(0xFF6C7B6B),
        onTap: () => Get.toNamed(AppRoutes.supportView),
      ),
    );
  }

  BoxDecoration _sectionDecoration() {
    return BoxDecoration(
      color: const Color(0xFF2C2843),
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Color(0xFF4E8A6B)),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String title,
    required Color iconColor,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: 24.sp),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: Color(0xFFBBCBB8),
        size: 24.sp,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      onTap: () {
        onTap?.call();
      }, // Add navigation logic here
    );
  }

  Widget _buildDivider() {
    return Divider(color: const Color(0xFF4E8A6B), height: 1, thickness: 1);
  }

  Widget _buildLogoutButton() {
    return ElevatedButton(
      onPressed: _showLogoutDialog,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(
          0xFFFFDAD6,
        ).withValues(alpha: 0.53), // Brownish muted color
        padding: EdgeInsets.symmetric(vertical: 20.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout_rounded,
            color: const Color(0xFFBA1A1A), // Red icon
            size: 24.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            'Logout',
            style: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFBA1A1A), // Red text
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        backgroundColor: const Color(0xFF2C2843), // Dark purple background
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want\nto logout?',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Yes Button
                  ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.LOGIN);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1982C4), // Blue
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Yes',
                          style: GoogleFonts.manrope(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.check, color: Colors.white, size: 20.sp),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // No Button
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD62828), // Red
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 10.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'No',
                          style: GoogleFonts.manrope(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.close, color: Colors.white, size: 20.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
