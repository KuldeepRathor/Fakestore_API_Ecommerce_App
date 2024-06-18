import 'package:get/get.dart';

class Errors {
  void errors(int code, {String message = ''}) {
    switch (code) {
      case 401:
        Get.snackbar('Error', message.isEmpty ? 'Login Failed' : message);
        break;
      case 404:
        Get.snackbar('Eroor', message.isEmpty ? 'Data not found' : message);
        break;
      case 0:
        Get.snackbar('Error', message.isEmpty ? 'Error' : message);
        break;
    }
  }
}
