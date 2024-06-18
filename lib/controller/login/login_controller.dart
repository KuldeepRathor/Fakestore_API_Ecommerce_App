import 'package:fakestore_api_ecommerce_platform/model/constants.dart';
import 'package:fakestore_api_ecommerce_platform/model/errors.dart';
import 'package:fakestore_api_ecommerce_platform/model/network/StatusController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends FSGetXController {
  bool _isCompleteForm = false;
  bool _isVisibilityPass = false;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  bool get isCompleteForm => _isCompleteForm;
  bool get isVisibilityPass => _isVisibilityPass;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get controllerName => _controllerName;
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

  String? validatePass(String? value) {
    if (value!.trim().isEmpty) {
      return "Please enter your password.";
    }
    if (value.trim().length < 3) {
      return "Your password must be at least 3 characters.";
    }
    return null;
  }

  void onChangeUserName(String? value) {
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
    update(['BtnLogin']);
  }

  void onLogin() async {
    _isLoading = true;
    update();
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    JsonResponseToken response = await postToken(
      EndPoint.login,
      params: {
        'username': _controllerName.text.trim(),
        'password': _controllerPass.text.trim(),
      },
    );
    if (response.statusCode == 200) {
      _loginFinish(true);
      TokenJwk.jwk = response.response!.token!;
      Get.offAllNamed('/home');
    } else {
      _loginFinish(false);
      Errors().errors(response.statusCode,
          message: 'Your username or password is incorrect.');
    }
    _isLoading = false;
    update();
  }

  void goToSignIn() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.toNamed('/signin');
  }

  void _loginFinish(bool success) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(Persistence.isLogged, success);
    preferences.setString(Persistence.user, _controllerName.text.trim());
    preferences.setString(Persistence.pass, _controllerPass.text.trim());
  }
}
