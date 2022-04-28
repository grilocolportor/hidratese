import 'package:get/get.dart';
import 'package:hidratese/presentation/introduction/controllers/introduction_controller.dart';

import '../../../presentation/home/controllers/home.controller.dart';

class ControllerBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<IntroductionController>(
      () => IntroductionController(),
    );
  }
}
