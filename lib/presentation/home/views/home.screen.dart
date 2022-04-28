import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(() =>
               Text(
                _homeController.resultInsert.value,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          TextButton(onPressed: () => _homeController.onClick(), child: Text('Click aqui'))
        ],
      ),
    );
  }
}
