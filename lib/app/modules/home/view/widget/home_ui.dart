import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/components/api_error_widget.dart';
import 'package:news/app/components/my_widgets_animator.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'package:news/config/strings_enum.dart';
import 'news_list.dart';
import 'slider_image/slider_image.dart';

class HomeUi extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyWidgetsAnimator(
        apiCallStatus: controller.apiCallStatus,
        loadingWidget: () => const Center(
          child: CupertinoActivityIndicator(),
        ),
        errorWidget: () => ApiErrorWidget(
          message: Strings.internetError,
          retryAction: () => controller.getData(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
        ),
        successWidget: () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "NEWS",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
            ),
            TabBar(
              controller: controller.tabController,
              tabs: const [
                Tab(
                  text: "All News",
                ),
                Tab(
                  text: "Business",
                ),
                Tab(
                  text: "Politics",
                ),
                Tab(
                  text: "Tech",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: [
                  AllNews(),
                  const Center(
                    child: Text("Business"),
                  ),
                  const Center(
                    child: Text("Politics"),
                  ),
                  const Center(
                    child: Text("Tech"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllNews extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  AllNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageSlider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "Latest News",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        10.verticalSpace,
        NewsList(),
      ],
    );
  }
}
