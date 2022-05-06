import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/external/local_repository/sql_lite/database_helper.dart';
import 'package:hidratese/infrastructure/repositories/daos/dayle_param_datasource.dart';

class LocalDataBaseDayleParams implements IDayleParamDatasource {
  final ISQLDataBaseHelper _databaseHelper;

  LocalDataBaseDayleParams(this._databaseHelper);

  @override
  Future<int> resgisterPeso(params) async {
    Map<String, dynamic> pesoMap = {'date': params.date, 'peso': params.peso};
    return await _databaseHelper.insert(pesoMap, 'peso');
  }

  @override
  Future<int> resgisterEstiloVida(LifeStyleParam params) async {
    Map<String, dynamic> map = {
      'date': params.data,
      'estilo_vida': params.lifeStyle
    };
    return await _databaseHelper.insert(map, 'estilo_vida');
  }

  @override
  Future<int> resgisterHumidade(HumidadeParam params) async {
    Map<String, dynamic> map = {
      'date': params.data,
      'humidade': params.humidade
    };
    return await _databaseHelper.insert(map, 'humidade');
  }

  @override
  Future<int> resgisterTemperatura(TemperaturaParam params) async {
    Map<String, dynamic> map = {
      'date': params.data,
      'temperatura': params.temperatura
    };
    return await _databaseHelper.insert(map, 'temperatura');
  }
}
