import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/data/local/my_shared_pref.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      // main color (app bar,tabs..etc)
      primaryColor: isLight
          ? LightThemeColors.primaryColor
          : DarkThemeColors.primaryColor,

      // secondary & background color
      colorScheme: ColorScheme.fromSwatch(
        accentColor: isLight
            ? LightThemeColors.accentColor
            : DarkThemeColors.accentColor,
        backgroundColor: isLight
            ? LightThemeColors.backgroundColor
            : DarkThemeColors.backgroundColor,
        brightness: isLight ? Brightness.light : Brightness.dark,
      ).copyWith(
        secondary: isLight
            ? LightThemeColors.accentColor
            : DarkThemeColors.accentColor,
      ),
      // TabBar View
      tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory,
        labelColor: isLight ? Colors.black : Colors.white,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.orange,
      ),

      //bottom navigation
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:
            isLight ? LightThemeColors.navBg : DarkThemeColors.navBg,
        iconTheme: MaterialStatePropertyAll(
          IconThemeData(
            color: isLight
                ? LightThemeColors.blackColor
                : DarkThemeColors.whiteColor,
          ),
        ),
      ),

      switchTheme: const SwitchThemeData(
        trackOutlineColor: MaterialStatePropertyAll(Colors.transparent),
        trackColor: MaterialStatePropertyAll(Colors.black12),
      ),

      // color contrast (if the theme is dark text should be white for example)
      brightness: isLight ? Brightness.light : Brightness.dark,

      // app background color
      scaffoldBackgroundColor: isLight
          ? LightThemeColors.scaffoldBackgroundColor
          : DarkThemeColors.scaffoldBackgroundColor,

      // progress bar theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isLight
            ? LightThemeColors.primaryColor
            : DarkThemeColors.primaryColor,
      ),
    );
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();

    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);

    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
