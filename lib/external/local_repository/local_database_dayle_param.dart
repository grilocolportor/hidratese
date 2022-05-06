import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/external/local_repository/sql_lite/database_helper.dart';
import 'package:hidratese/infrastructure/repositories/daos/dayle_param_datasource.dart';

class LocalDataBaseDayleParams implements IDayleParamDatasource {
  final ISQLDataBaseHelper _databaseHelper;

  LocalDataBaseDayleParams(this._databaseHelper);

  @override
  Future<int> resgisterPeso(params) async{
     Map<String, dynamic> pesoMap = {
      'date' : params.date,
      'peso' : params.peso
    };
     return await _databaseHelper.insert(pesoMap, 'peso');
  }

  // @override
  // Future<int> registerDayleParams(DayleParamsParams params) async {
  //   Map<String, dynamic> humidadeMap = {
  //     'data' : params.data,
  //     'humidade' : params.humidade
  //   };
  //   return await _databaseHelper.insert(params.toMap(), 'User');
  // }
}
