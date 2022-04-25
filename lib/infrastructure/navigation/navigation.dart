import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../presentation/screens.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),

    ),
  ];
}
