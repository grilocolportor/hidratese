import 'package:get/get.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';

class HomeController extends GetxController {
  final _perfilController = Get.find<ProfileUserController>();

  var resultInsert = 0.obs;



  @override
  void onClose() {}

  Future<int> onClick() async {
    resultInsert.value = await _perfilController.getCountUserProfile();
    return resultInsert.value;
  }
}
