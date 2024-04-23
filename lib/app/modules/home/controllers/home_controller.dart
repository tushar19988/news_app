import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/components/custom_snackbar.dart';
import 'package:news/app/data/models/news_model.dart';
import 'package:news/app/services/api_call_status.dart';
import 'package:news/app/services/base_client.dart';
import 'package:news/utils/constants.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;

  int currentPageIndex = 0;

  List<Articles>? article;

  List<Articles>? bookmarkedArticles = [];

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  List sliderList = [
    {
      "image":
          "https://images.pexels.com/photos/592753/pexels-photo-592753.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Serene Sunset over the Horizon",
      "ago": "1 hours ago",
      "content":
          "Honesty is the practice of speaking and acting truthfully and with integrity, and it is essential to building trust and respect in our relationships. Whether it's being honest with ourselves and others about our thoughts and feelings, admitting our mistakes and shortcomings, or communicating clearly and transparently, honesty can create a sense of authenticity and connection in our interactions with others.",
      "comment": "20",
      "view": "60",
    },
    {
      "image":
          "https://images.pexels.com/photos/696407/pexels-photo-696407.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Little Big Dreams: Navigating Life's Grand Adventures",
      "ago": "4 hours ago",
      "content":
          "Honesty is the practice of speaking and acting truthfully and with integrity, and it is essential to building trust and respect in our relationships. Whether it's being honest with ourselves and others about our thoughts and feelings, admitting our mistakes and shortcomings, or communicating clearly and transparently, honesty can create a sense of authenticity and connection in our interactions with others.",
      "comment": "30",
      "view": "40",
    },
    {
      "image":
          "https://images.pexels.com/photos/1655901/pexels-photo-1655901.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "title": "Micro Giants: Exploring the World Beyond Our Scale",
      "ago": "1 week ago",
      "content":
          "One of the most important uses of technology in nature is the development of conservation tools. From wildlife tracking devices to habitat restoration techniques, we are constantly finding new ways to protect endangered species and their ecosystems. With the help of technology, we can make a real difference in the fight against extinction.",
      "comment": "100",
      "view": "320",
    },
  ];

  onChangeIndex(int index) {
    currentPageIndex = index;
    update();
  }

  void addBookmark(Articles article) {
    bool? isBookmarked = isArticleBookmarked(article);

    if (!isBookmarked!) {
      bookmarkedArticles?.add(article);
      CustomSnackBar.showCustomSnackBar(
        message: 'added successfully!',
        title: 'News',
      );
    } else {
      bookmarkedArticles?.removeWhere((element) => element.url == article.url);
    }

    update();
  }

  bool? isArticleBookmarked(Articles article) {
    return bookmarkedArticles?.any((element) => element.url == article.url);
  }

  getData() async {
    await BaseClient.safeApiCall(
      Constants.todosApiUrl,
      queryParameters: Constants.headQueryParams,
      RequestType.get,
      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        NewsModel newsModel = newsModelFromJson(json.encode(response.data));
        article = newsModel.articles;
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: (error) {
        BaseClient.handleApiError(error);
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    getData();
    super.onInit();
  }
}
