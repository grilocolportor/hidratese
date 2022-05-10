import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:hidratese/presentation/home/controllers/home.controller.dart';
import 'package:hidratese/presentation/home/views/home.screen.dart';

import 'controllers/omboarding_controller.dart';

class OmboardingView extends GetView<OmboardingController> {
  final _homeController = Get.find<HomeController>();

  initMethod(context) async {
    _homeController.onClick().then((value) {
      if (value == 0) {
        Get.off(() => HomeScreen());
      } else {
        Get.off(() => HomeScreen());
      }
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => initMethod(context));
    return Container();
  }
}
