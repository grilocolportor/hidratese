import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final _userProfileParam = UserProfileParams(
    gender: '',
    weight: '70.0',
    sleep: DateFormat('hh:MM').format(DateTime.now()),
    wakeUp: DateFormat('hh:MM').format(DateTime.now()),
  );

  var resultInsert = ''.obs;

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

  void onClick() async {
    final userProfile = Injector.container.resolve<UserProfileUserCase>();
    var p = await userProfile.call(_userProfileParam);
    p.fold((l) => resultInsert.value = l.message,
        (r) => resultInsert.value = 'Usuario adcionado');
  }
}
