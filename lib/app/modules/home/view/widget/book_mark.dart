import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'package:news/utils/helper.dart';

import 'list_ui.dart';
import 'news_details/news_details.dart';

class BookMark extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.bookmarkedArticles?.isNotEmpty ?? true
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  shrinkWrap: true,
                  itemCount: controller.bookmarkedArticles?.length ?? 0,
                  separatorBuilder: (context, index) => 16.verticalSpace,
                  itemBuilder: (context, index) {
                    final uData = controller.bookmarkedArticles?[index];
                    bool? isBookmarked = controller.isArticleBookmarked(uData!);
                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetails(
                              image: uData.urlToImage ?? "",
                              title: uData.title ?? "",
                              comment: "10",
                              content: uData.description ?? "",
                              timeAgo: agoTime(uData.publishedAt),
                              view: "30",
                              savePost: IconButton(
                                onPressed: () {
                                  Get.back();
                                  controller.addBookmark(uData);
                                },
                                icon: Icon(
                                  Icons.bookmark_outlined,
                                  color: isBookmarked == true
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: ListUI(
                        articles: uData,
                        savePost: () {
                          controller.addBookmark(uData);
                        },
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: Text(
                  "No Favorite News",
                ),
              ),
      ),
    );
  }
}
