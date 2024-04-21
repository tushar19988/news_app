import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';
import 'package:news/app/modules/home/view/widget/book_mark.dart';
import 'package:news/app/modules/home/view/widget/search.dart';
import 'package:news/app/modules/setting/view/setting_view.dart';
import 'widget/bootom_nav.dart';
import 'widget/home_ui.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigation(),
        body: [
          HomeUi(),
          const Search(),
          const BookMark(),
          SettingView(),
        ][controller.currentPageIndex],
      );
    });
  }
}
