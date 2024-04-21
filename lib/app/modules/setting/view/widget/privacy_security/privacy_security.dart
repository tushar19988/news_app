import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/setting/controllers/setting_controller.dart';
import 'package:news/app/modules/setting/view/widget/arrow_with_name.dart';
import 'package:news/app/modules/setting/view/widget/container_card.dart';
import 'package:news/app/modules/setting/view/widget/switch_with_name.dart';
import 'package:news/config/strings_enum.dart';

class PrivacySecurity extends StatelessWidget {
  final SettingController controller = Get.put(SettingController());

  PrivacySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.sp,
          ),
          child: Text(
            Strings.privacy,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.verticalSpace,
        ContainerCard(
          child: Column(
            children: [
              SwitchWithName(
                title: Strings.privateAccount,
                onChanged: controller.changePrivateAccount,
                switchValue: controller.privateAccount,
              ),
              6.verticalSpace,
              const ArrowWithName(
                title: Strings.privacyHelp,
              ),
              14.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
