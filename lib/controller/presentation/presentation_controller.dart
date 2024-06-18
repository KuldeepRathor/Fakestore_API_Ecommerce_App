import 'package:fakestore_api_ecommerce_platform/model/constants.dart';
import 'package:fakestore_api_ecommerce_platform/model/network/StatusController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresentationController extends FSGetXController {
  void goToHome() async {
    SharedPreferences.getInstance().then((preferences) {
      preferences.setBool(Persistence.isInitialFirst, false);
      preferences.setBool(Persistence.isGuest, true);
      Get.offAllNamed('/home');
    });
  }

  void goToLogin() {
    Get.toNamed('/login');
  }
}
