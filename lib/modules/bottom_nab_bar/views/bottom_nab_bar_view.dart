// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../../config/constants/image_paths.dart';
// import '../../../config/themes/app_theme.dart';
// import '../controllers/bottom_nab_bar_controller.dart';


// class BottomNabBarView extends StatelessWidget {
//   const BottomNabBarView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final nav = Get.find<BottomNabBarController>();

//     return Obx(
//           () => Scaffold(
//         extendBody: true,
//         body: SafeArea(
//           top: false,
//           child: IndexedStack(
//             index: nav.currentIndex.value,
//             children: const [
//               HomeScreen(),
//               LibraryScreen(),
//               CalendarPage(),
//               ProfilePage(),
//             ],
//           ),
//         ),
//         bottomNavigationBar: const SafeArea(
//           top: false,
//           bottom: true,
//           child: CustomBottomBar(),
//         ),
//       ),
//     );
//   }
// }

// class CustomBottomBar extends StatelessWidget {
//   const CustomBottomBar({super.key});

//   final nav = Get.find<BottomNabBarController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80.h,
//       decoration: const BoxDecoration(
//         color: Color(0xffF2F2F7),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _icon(ImagePaths.homeIcon, 0),
//               _icon(ImagePaths.libraryIcon, 1),
//               const SizedBox(width: 70),
//               _icon(ImagePaths.calenderIcon, 2),
//               _profileIcon(3),
//             ],
//           ),

//           // Center Floating Button
//           Positioned(
//             top: -20.h,
//             child: GestureDetector(
//               onTap: () => Get.to(
//                     () => NewPreferenceCard(isPrivate: false),
//                 transition: Transition.downToUp,
//               ),
//               child: _centerButton(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _icon(String svgPath, int index) {
//     return InkWell(
//       onTap: () => nav.changePage(index),
//       child: SizedBox(
//         height: 26.w,
//         width: 26.w,
//         child: SvgPicture.asset(
//           svgPath,
//           width: 26.w,
//           height: 26.w,
//           color: nav.currentIndex.value == index
//               ? AppTheme.primaryColor
//               : const Color(0xff99A1AF),
//         ),
//       ),
//     );
//   }

//   Widget _profileIcon(int index) {
//     return GestureDetector(
//       onTap: () => nav.changePage(index),
//       child: Container(
//         width: 35.w,
//         height: 35.w,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: nav.currentIndex.value == index
//                 ? AppTheme.primaryColor
//                 : Colors.white,
//             width: 2.w,
//           ),
//         ),
//         padding: EdgeInsets.all(3.w),
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//               image: Image.network('https://picsum.photos/250?image=9').image,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _centerButton() {
//     return Container(
//       height: 64.w,
//       width: 64.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         gradient: const LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color(0xff9945FF),
//             Color(0xff8B3EFF),
//             Color(0xff7B35DD),
//           ],
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0xff9945FF),
//             offset: Offset(0, 8),
//             blurRadius: 12,
//             spreadRadius: -4,
//           ),
//         ],
//       ),
//       child: const Center(
//         child: Icon(Icons.add_outlined, color: Colors.white, size: 35),
//       ),
//     );
//   }
// }