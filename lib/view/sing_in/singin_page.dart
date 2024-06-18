import 'package:fakestore_api_ecommerce_platform/controller/sing_in/singin_controller.dart';
import 'package:fakestore_api_ecommerce_platform/model/colors.dart';
import 'package:fakestore_api_ecommerce_platform/model/utils.dart';
import 'package:fakestore_api_ecommerce_platform/view/ui/fs_textformfield.dart';
import 'package:fakestore_api_ecommerce_platform/view/ui/progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(),
      builder: (_) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ProgressHUD(
              loading: _.isLoading,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Image.asset(
                              Utils().imageLogoAsset,
                              width: 90,
                              height: 90,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            FSTextFormField(
                              controller: _.controllerName,
                              keyboardType: TextInputType.text,
                              validator: _.validateUserName,
                              onChanged: _.onChangeUserName,
                              label: "User Name",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FSTextFormField(
                              controller: _.controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              validator: _.validateEmail,
                              onChanged: _.onChangeEmail,
                              label: "Email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GetBuilder<SignInController>(
                              id: 'Password',
                              builder: (_) {
                                return FSTextFormField(
                                  controller: _.controllerPass,
                                  keyboardType: TextInputType.text,
                                  validator: _.validatePass,
                                  onChanged: _.onChangePass,
                                  obscureText: !_.isVisibilityPass,
                                  label: "PassWord",
                                  suffixIcon: IconButton(
                                    icon: !_.isVisibilityPass
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onPressed: _.changePasswordVisibility,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GetBuilder<SignInController>(
                                id: 'BtnSingIn',
                                builder: (_) {
                                  return OutlinedButton(
                                    onPressed: _.isCompleteForm
                                        ? () => _.onSignIn()
                                        : null,
                                    child: Text(
                                      "Sign In",
                                      style: const TextStyle().copyWith(
                                        color: AppColors.purple,
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
