import 'package:fakestore_api_ecommerce_platform/model/network/StatusController.dart';
import 'package:get/get.dart';

class ErrorController extends FSGetXController {
  int _statusCode = 0;
  String _message = '';

  String get message => _message;

  @override
  void onInit() {
    if (Get.arguments['StatusCode'] != null) {
      _statusCode = int.tryParse(Get.arguments['StatusCode']!)!;
    }
    _evaluateCode();

    super.onInit();
  }

  void _evaluateCode() {
    switch (_statusCode) {
      case 401:
        _message = 'Your username or password is incorrect';
        break;
      default:
        _message = 'An unknown error occurred';
    }
  }
}
