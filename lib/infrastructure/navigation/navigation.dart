import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidratese/presentation/introduction/views/introduction_view.dart';

import '../../presentation/screens.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),

    ),
     GetPage(
      name: Routes.INTRODUCTION,
      page: () => IntroductionView(),

    ),
  ];
}
