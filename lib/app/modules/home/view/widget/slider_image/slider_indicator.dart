import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';

class SliderIndicator extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  SliderIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: controller.sliderList.map((url) {
        int index = controller.sliderList.indexOf(url);
        return GestureDetector(
          onTap: () => controller.carouselController.animateToPage(index),
          child: Container(
            width: controller.currentIndex == index ? 12.w : 10.w,
            height: controller.currentIndex == index ? 12.w : 10.w,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: controller.currentIndex == index
                  ? Colors.white
                  : Colors.orange,
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: Colors.orange,
                width: 1.5,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
