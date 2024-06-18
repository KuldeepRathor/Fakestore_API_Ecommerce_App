import 'package:fakestore_api_ecommerce_platform/model/constants.dart';
import 'package:fakestore_api_ecommerce_platform/model/errors.dart';
import 'package:fakestore_api_ecommerce_platform/model/network/StatusController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends FSGetXController {
  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerPass => _controllerPass;

  void changePasswordVisibility() {
    _isVisibilityPass = !_isVisibilityPass;
    update(['Password']);
  }

  String? validateUserName(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter your username.";
    } else if (!GetUtils.isUsername(value)) {
      return "Please enter a valid username.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter your email.";
    } else if (!GetUtils.isEmail(value)) {
      return "Please enter a valid email.";
    }
    return null;
  }

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter your password.";
    }
    if (value.trim().length < 8) {
      return "Your password must be at least 8 characters.";
    }
    return null;
  }

  void onChangeUserName(String? value) {
    _validateBtnContinue();
  }

  void onChangeEmail(String? value) {
    _validateBtnContinue();
  }

  void onChangePass(String? value) {
    _validateBtnContinue();
  }

  void _validateBtnContinue() {
    if (_formKey.currentState!.validate()) {
      _isCompleteForm = true;
    } else {
      _isCompleteForm = false;
    }
    update(['BtnSignIn']);
  }

  void onSignIn() async {
    _isLoading = true;
    update();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    JsonResponseSingIn response = await postSingIn(
      EndPoint.singIn,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
        'email': _controllerEmail.text.trim(),
      },
    );
    if (response.statusCode == 200) {
      Get.offAllNamed('/login');
      Get.snackbar("Great!",
          'User successfully registered with id: ${response.response!.id ?? ''}');
    } else {
      Errors().errors(response.statusCode,
          message: 'Some information is incorrect.');
    }
    _isLoading = false;
    update();
  }
}
