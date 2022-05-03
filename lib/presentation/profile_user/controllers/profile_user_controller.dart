import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

class ProfileUserController extends GetxController {
  final _profileUserCase = Injector.resolve<UserProfileUserCase>();

  TextEditingController pesoEditController = TextEditingController();
  TextEditingController dormirEditController = TextEditingController();
  TextEditingController acordarEditController = TextEditingController();
  var sexo = true.obs;
  var peso = 0.0.obs;
  var acordar = ''.obs;
  var dormir = ''.obs;



  void updateTime(String modo, var h, var m) {
    switch (modo) {
      case 'dormir':
        dormirEditController.text = '$h:$m';
        dormir.value = '$h:$m';
        break;
      case 'acordar':
        acordarEditController.text = '$h:$m';
        acordar.value = '$h:$m';
        break;
      default:
        '';
    }
  }

  Future<void> getPerfil() async {
    var result = await _profileUserCase.getUser('user');

    result.fold((l) {
      print(l.message);
     
    }, (r) {
      
    });
  }

  Future<int> getCountUserProfile() async {
    var result = await _profileUserCase.rowCounterUser('user');

   return result.fold((l) {
      print(l.message);
      return 0;
    }, (r) {
      return r;
    });
  }

  Future<void> addPerfil() async {
    // await _hidrateseControler.gerarRelatorio();

    // await _hidrateseControler.addDayleTarget();

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('cancelNotification', false);

    final _userProfileParam = UserProfileParams(
      gender: sexo.value ? 'masculino' : 'Femenino',
      sleep: acordar.value,
      wakeUp: dormir.value,
    );

    var resultInsert = ''.obs;
    await _profileUserCase.insertUser(_userProfileParam).then((value) {
      if (value.isRight()) {
        resultInsert.value = 'Usuario adcionado';
      } else {}
    });

    //liter: (peso.value * coeficientePadrao).toString()
  }

 
}
