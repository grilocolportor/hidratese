import 'package:get/get.dart';

class DayleParamController extends GetxController {
  var humidade = 50.obs;
  var temperatura = 28.obs;
  var estiloVida = 'Normal'.obs;

  void changeDropDownLigeStyle(String item) {
    estiloVida.value = item;
  }
}
