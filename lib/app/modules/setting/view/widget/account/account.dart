import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/app/modules/setting/view/widget/arrow_with_name.dart';
import 'package:news/app/modules/setting/view/widget/container_card.dart';
import 'package:news/config/strings_enum.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
            Strings.account,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.verticalSpace,
        ContainerCard(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              const ArrowWithName(
                title: Strings.editAccount,
              ),
              16.verticalSpace,
              const ArrowWithName(
                title: Strings.changePassword,
              ),
              16.verticalSpace,
              const ArrowWithName(
                title: Strings.language,
              ),
            ],
          ),
        ),
        30.verticalSpace,
      ],
    );
  }
}
