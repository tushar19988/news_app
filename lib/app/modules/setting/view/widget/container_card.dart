import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/setting/controllers/setting_controller.dart';
import 'package:news/config/theme/dark_theme_colors.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: padding != null
              ? EdgeInsets.symmetric(horizontal: 24.w).add(padding!)
              : EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Get.isDarkMode ? DarkThemeColors.navBg : Colors.white,
          ),
          child: child,
        );
      },
    );
  }
}
