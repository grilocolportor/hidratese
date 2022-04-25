import 'package:get/get.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
   
  }
}
