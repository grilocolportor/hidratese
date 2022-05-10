import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/external/handler_native_code/handler_native_code.dart';
import 'package:hidratese/external/storage/get_storage_handle.dart';
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
  final _checkPermission = Injector.resolve<HandlerNativeCode>();
  final _alreadConfig = Injector.resolve<GetStoragehandle>();

  var resultInsert = 0.obs;
  var device = ''.obs;
  var showMessageConfig = false.obs;

  Future<void> setAlreadyConfig() async {
    _alreadConfig.setData("isConfigured", true);
  }

  @override
  void onClose() {}

  Future<int> onClick() async {
    resultInsert.value = await _perfilController.getCountUserProfile();
    return resultInsert.value;
  }
  
  Future<bool> isConfigured() async{
     return await _alreadConfig.getBool("isConfigured") ?? false;
  }

  Future<String> checkPermission() async {
    String result = "";
    String device =
        await _checkPermission.checkDeviceManufacturer().then((value) {
      return value.toLowerCase();
    });

    for (var name in Devices.values) {
      String target = name.toString().split('.').elementAt(1);
      if (device.removeAllWhitespace.contains(target)) {
        result = target;
        break;
      }
    }
    return result;
  }
}
