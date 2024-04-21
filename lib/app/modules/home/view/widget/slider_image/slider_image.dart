import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'package:news/app/modules/home/view/widget/news_details/news_details.dart';
import 'slider_indicator.dart';

class ImageSlider extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.verticalSpace,
        CarouselSlider(
          carouselController: controller.carouselController,
          options: CarouselOptions(
            height: 200.h,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              controller.currentIndex = index;
              controller.update();
            },
          ),
          items: controller.sliderList.map((slide) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                          image: slide["image"],
                          title: slide["title"],
                          comment: slide["comment"],
                          content: slide["content"],
                          timeAgo: slide["ago"],
                          view: slide["view"],
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: slide["image"],
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                          placeholder: (context, url) {
                            return const Center(
                              child: CupertinoActivityIndicator(),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(
                                Icons.error_outline,
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 10.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                slide["ago"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.bookmark_outlined,
                                color: Colors.white,
                                size: 18.r,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              slide["title"],
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        20.verticalSpace,
        SliderIndicator(),
        10.verticalSpace,
      ],
    );
  }
}
