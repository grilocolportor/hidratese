import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:intl/intl.dart';

class ProfileUserController extends GetxController {
//  final _hidrateseControler = Get.find<HidrateseController>();

  TextEditingController pesoEditController = TextEditingController();
  TextEditingController dormirEditController = TextEditingController();
  TextEditingController acordarEditController = TextEditingController();
  var sexo = true.obs;
  var peso = 0.0.obs;
  var acordar = ''.obs;
  var dormir = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> addPerfil() async {
    // _hidrateseControler.userModel.value.acordar = acordar.value;
    // _hidrateseControler.userModel.value.dormir = dormir.value;
    // _hidrateseControler.userModel.value.sexo =
    //     sexo.value ? 'masculino' : 'Femenino';
    // _hidrateseControler.userModel.value.peso = peso.value.toString();
    // _hidrateseControler.userModel.value.litros = (peso.value * 35).toString();

    // await _hidrateseControler.gerarRelatorio();

    // await _hidrateseControler.addDayleTarget();

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('cancelNotification', false);

     final _userProfileParam = UserProfileParams(
    gender: '',
    weight: '70.0',
    sleep: DateFormat('hh:MM').format(DateTime.now()),
    wakeUp: DateFormat('hh:MM').format(DateTime.now()),
  );

 var resultInsert = ''.obs;

    final userProfile = Injector.container.resolve<UserProfileUserCase>();
    var p = await userProfile.call(_userProfileParam);
    p.fold((l) => resultInsert.value = l.message,
        (r) => resultInsert.value = 'Usuario adcionado');
  }

  @override
  void onClose() {
    pesoEditController.dispose();
    dormirEditController.dispose();
    acordarEditController.dispose();
  }
}
