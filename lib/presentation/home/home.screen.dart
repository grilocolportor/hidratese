import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      body: InkWell(
        child: Center(
          child: Text(
            'HomeScreen is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        onTap: () => _homeController.onClick(),
      ),
    );
  }
}
