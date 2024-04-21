import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/setting/controllers/setting_controller.dart';
import 'package:news/config/strings_enum.dart';
import 'package:news/config/theme/dark_theme_colors.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<SettingController>(
      builder: (context) {
        return Container(
          height: height * 0.25,
          width: width,
          padding: EdgeInsets.only(top: height * 0.08),
          color: Get.isDarkMode ? DarkThemeColors.navBg : Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage(
                        Strings.profileUrl,
                      ),
                    ),
                  ),
                  40.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Strings.setting,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      20.verticalSpace,
                      const Text(
                        Strings.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(Strings.userEmail),
                      8.verticalSpace,
                      const Text(
                        Strings.signOut,
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
