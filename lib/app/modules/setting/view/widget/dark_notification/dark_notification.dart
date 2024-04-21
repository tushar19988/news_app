import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/setting/controllers/setting_controller.dart';
import 'package:news/app/modules/setting/view/widget/container_card.dart';
import 'package:news/app/modules/setting/view/widget/switch_with_name.dart';
import 'package:news/config/strings_enum.dart';

class DarkAndNotification extends StatelessWidget {
  final SettingController controller = Get.put(SettingController());

  DarkAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        ContainerCard(
          child: Column(
            children: [
              SwitchWithName(
                title: Strings.darkMode,
                onChanged: controller.changeDarkMode,
                switchValue: controller.darkMode,
              ),
              SwitchWithName(
                title: Strings.notification,
                onChanged: controller.changeNotification,
                switchValue: controller.notification,
              ),
            ],
          ),
        ),
        30.verticalSpace,
      ],
    );
  }
}
