import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'widget/image_card.dart';

class NewsDetails extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final String view;
  final String comment;
  final String timeAgo;
  final Widget? savePost;

  const NewsDetails({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.view,
    required this.comment,
    required this.timeAgo,
    this.savePost,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              ImageCard(
                image: image,
                view: view,
                timeAgo: timeAgo,
                comment: comment,
                savePost: savePost,
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Container(
                      height: 70.h,
                      width: 4.w,
                      color: Colors.orange,
                    ),
                    14.horizontalSpace,
                    Flexible(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 28.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
