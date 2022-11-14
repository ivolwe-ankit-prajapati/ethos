import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;
  var isLoggedIn =false.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  Future<void> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    isLoggedIn.value=prefs.getBool('isLogin') ?? false;
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}