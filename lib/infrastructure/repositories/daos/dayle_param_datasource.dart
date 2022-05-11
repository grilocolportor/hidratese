import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';

abstract class IDayleParamDatasource {
  Future<int> resgisterPeso(PesoParam params);
  Future<List<Map<String, dynamic>>> queryLast(
      List<String> columns, String table);
  Future<int> resgisterTemperatura(TemperaturaParam params);
  Future<int> resgisterHumidade(HumidadeParam params);
  Future<int> resgisterEstiloVida(LifeStyleParam params);
}
