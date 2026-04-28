import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pawgress/config/themes/app_theme.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final bool centerTitle;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final double? elevation;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.centerTitle = true,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor = Colors.transparent,
    this.backButtonColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: showBackButton
          ? Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: GestureDetector(
                onTap: onBackPressed ?? () => Get.back(),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF454565),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: Icon(
                    Icons.arrow_back,
                    color: backButtonColor ?? Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            )
          : null,
      title: title != null
          ? Text(
        title!,
        style:
        titleStyle ??
            TextStyle(
              color: AppTheme.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
      )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}