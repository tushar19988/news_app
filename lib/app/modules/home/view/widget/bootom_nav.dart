import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/controllers/home_controller.dart';

class BottomNavigation extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: controller.onChangeIndex,
      indicatorColor: Colors.transparent,
      selectedIndex: controller.currentPageIndex,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(
            Icons.home,
            color: Colors.orange,
          ),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.search,
            color: Colors.orange,
          ),
          icon: Icon(Icons.search_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.bookmark,
            color: Colors.orange,
          ),
          icon: Icon(Icons.bookmark_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.settings,
            color: Colors.orange,
          ),
          icon: Icon(Icons.settings),
          label: 'Home',
        ),
      ],
    );
  }
}
