import 'package:fakestore_api_ecommerce_platform/controller/presentation/presentation_controller.dart';
import 'package:fakestore_api_ecommerce_platform/model/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PresentationController>(
      init: PresentationController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  bottom: 1,
                  right: 20,
                  child: OutlinedButton(
                    onPressed: () => _.goToLogin(),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: 20,
                  child: OutlinedButton(
                    onPressed: () => _.goToHome(),
                    child: Text(
                      "Guest",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: Text(
                    "Fake Store ECommerce App",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
