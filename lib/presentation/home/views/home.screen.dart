import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:hidratese/infrastructure/navigation/routes.dart';

import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final _homeController = Get.find<HomeController>();

  initMethod(context) async {}

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => initMethod(context));

    // _homeController.onClick().then((value) {
    //   if (value == 0) {
    //     FlutterNativeSplash.remove();
    //     Get.toNamed('/introduction');
    //   }
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Text(
                _homeController.resultInsert.value.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextButton(
              onPressed: () => _homeController.onClick(),
              child: Text('Click aqui'))
        ],
      ),
    );
  }
}
