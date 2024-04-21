import 'package:get/get.dart';
import 'package:news/app/data/local/my_shared_pref.dart';
import 'package:news/config/theme/my_theme.dart';

class SettingController extends GetxController {
  bool darkMode = false;
  bool notification = false;
  bool privateAccount = false;

  changeDarkMode(bool value) {
    darkMode = value;
    update();
    MyTheme.changeTheme();
  }

  changeNotification(bool value) {
    notification = value;
    update();
  }

  changePrivateAccount(bool value) {
    privateAccount = value;
    update();
  }

  void getThemeValue() {
    bool isLightTheme = MySharedPref.getThemeIsLight();
    darkMode = !isLightTheme;
    update();
  }

  @override
  void onInit() {
    getThemeValue();
    super.onInit();
  }
}
