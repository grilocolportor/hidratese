import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final _perfilController = Get.find<ProfileUserController>();

  var resultInsert = 0.obs;

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

  Future<int> onClick() async {
    resultInsert.value = await _perfilController.getCountUserProfile();
    return resultInsert.value;
  }
}
