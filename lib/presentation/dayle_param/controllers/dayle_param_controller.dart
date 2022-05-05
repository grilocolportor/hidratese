import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/infrastructure/utils/utils.dart';

class DayleParamController extends GetxController {
  final _dayleParamUserCase = Injector.resolve<DayleParamUserCase>();

  var humidade = 50.obs;
  var temperatura = 28.obs;
  var estiloVida = 'Normal'.obs;
  var peso = 65.0.obs;

  void changeDropDownLigeStyle(String item) {
    estiloVida.value = item;
  }

  void changeHumildade(int item) {
    humidade.value = item;
  }

  void changeTemperatura(int item) {
    temperatura.value = item;
  }

  void changePeso(double item) {
    peso.value = item;
  }

  void addDayleParam() async {
    await _dayleParamUserCase.registerDaylePram(DayleParamsParams(
        data: Utils.dataFormatOnlyDate(DateTime.now()),
        humidade: humidade.value,
        lifeStyle: estiloVida.value,
        peso: peso.value,
        temperatura: temperatura.value));
  }
}
