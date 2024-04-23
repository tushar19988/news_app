import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';

class ImageCard extends StatelessWidget {
  final String image;
  final String timeAgo;
  final String comment;
  final String view;
  final Widget? savePost;

  const ImageCard({
    super.key,
    required this.image,
    required this.timeAgo,
    required this.comment,
    required this.view,
    this.savePost,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: 350.h,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  height: 350.h,
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
              ),
              Positioned(
                top: 300.h,
                left: 24.w,
                right: 24.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline_outlined,
                          color: Colors.white,
                        ),
                        2.horizontalSpace,
                        Text(
                          comment,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        16.horizontalSpace,
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                        2.horizontalSpace,
                        Text(
                          view,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              savePost ??
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark,
                                      color: Colors.white,
                                    ),
                                  ),
                              10.horizontalSpace,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
