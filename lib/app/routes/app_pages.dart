import 'package:get/get.dart';
import 'package:news/app/modules/home/bindings/home_binding.dart';
import 'package:news/app/modules/home/view/home_view.dart';
import 'package:news/app/modules/setting/bindings/setting_binding.dart';
import 'package:news/app/modules/setting/view/setting_view.dart';
import 'app_routes.dart';

class AppPage {
  AppPage._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
