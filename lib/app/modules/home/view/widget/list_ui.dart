import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/data/models/news_model.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'package:news/config/theme/dark_theme_colors.dart';
import 'package:news/utils/helper.dart';

class ListUI extends StatelessWidget {
  const ListUI({super.key, required this.articles});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return SizedBox(
          height: 130.h,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 48.w,
                  top: 20.h,
                ),
                padding: EdgeInsets.only(
                  left: 96.w,
                  top: 10.h,
                  right: 2.w,
                  bottom: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r),
                  ),
                  color: Get.isDarkMode ? DarkThemeColors.navBg : Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${articles.title}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          agoTime(articles.publishedAt),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Icon(
                            Icons.bookmark_outlined,
                            size: 16.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (articles.urlToImage != null)
                Container(
                  height: 108.w,
                  width: 108.w,
                  margin: EdgeInsets.only(left: 24.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage ?? "",
                      height: 108.w,
                      width: 108.w,
                      fit: BoxFit.cover,
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
                ),
            ],
          ),
        );
      },
    );
  }
}
