import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/external/handler_native_code/handler_native_code.dart';
import 'package:hidratese/presentation/profile_user/controllers/profile_user_controller.dart';

enum Devices {
  xiaomi,
  letv,
  asusrog,
  honor,
  huawei,
  oppo,
  vivo,
  nokia,
  samsung,
  oneplus
}

class HomeController extends GetxController {
  final _perfilController = Get.find<ProfileUserController>();

  final _handlerNativeCode = Injector.resolve<IHandlerNativeCode>();

  var resultInsert = 0.obs;
  var device = ''.obs;
  var showMessage = false.obs;

  @override
  void onReady() async {
    super.onReady();
    device.value = await _handlerNativeCode.checkDeviceManufacturer();

    for (var name in Devices.values) {
      String dev = name.toString().split('.').elementAt(1);
      if (device.value.removeAllWhitespace.contains(dev)) {
        showMessage.value = true;
        break;
      }
    }
    print('=================${device.value}');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  Future<int> onClick() async {
    resultInsert.value = await _perfilController.getCountUserProfile();
    return resultInsert.value;
  }
}
