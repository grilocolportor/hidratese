import 'package:get/get.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

class HomeController extends GetxController {
  final _userProfileParam = UserProfileParams(
          gender: 'Masculino',
          weight: 70.0,
          sleep: DateTime.now(),
          wakeUp: DateTime.now())
      .obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onClick() {}
}
