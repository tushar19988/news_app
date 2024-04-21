import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/setting/controllers/setting_controller.dart';
import 'package:news/app/modules/setting/view/widget/account/account.dart';
import 'widget/dark_notification/dark_notification.dart';
import 'widget/privacy_security/privacy_security.dart';
import 'widget/setting_card.dart';

class SettingView extends GetView<SettingController> {
  @override
  final SettingController controller = Get.put(SettingController());

  SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (context) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingCard(),
              DarkAndNotification(),
              const Account(),
              PrivacySecurity(),
            ],
          ),
        );
      },
    );
  }
}
