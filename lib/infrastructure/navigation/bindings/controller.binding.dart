import 'package:get/get.dart';
import 'package:hidratese/presentation/introduction/controllers/introduction_controller.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';

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
    Get.lazyPut<ProfileUserController>(
      () => ProfileUserController(),
    );
  }
}
