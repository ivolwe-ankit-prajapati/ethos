import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LoginController>(() => LoginController(),fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);

  }
}
