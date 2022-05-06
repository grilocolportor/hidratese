import 'package:get/get.dart';
import 'package:hidratese/presentation/dayle_param/controllers/dayle_param_controller.dart';
import 'package:hidratese/presentation/introduction/controllers/introduction_controller.dart';
import 'package:hidratese/presentation/omboarding/controllers/omboarding_controller.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';

import '../../../presentation/home/controllers/home.controller.dart';

class ControllerBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(), fenix: true
    );
    Get.lazyPut<IntroductionController>(
      () => IntroductionController(),fenix: true
    );
    Get.lazyPut<ProfileUserController>(
      () => ProfileUserController(),fenix: true
    );
    Get.lazyPut<OmboardingController>(
      () => OmboardingController(),fenix: true
    );
    Get.lazyPut<DayleParamController>(
      () => DayleParamController(),fenix: true
    );
  }
}
