import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'list_ui.dart';

class NewsList extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.article?.length != null) {
      return Expanded(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shrinkWrap: true,
          itemCount: controller.article?.length ?? 0,
          separatorBuilder: (context, index) => 16.verticalSpace,
          itemBuilder: (context, index) {
            final uData = controller.article?[index];
            return ListUI(
              articles: uData!,
            );
          },
        ),
      );
    } else {
      return Text(
        "No Data Available",
        style: TextStyle(
          fontSize: 14.sp,
        ),
      );
    }
  }
}
