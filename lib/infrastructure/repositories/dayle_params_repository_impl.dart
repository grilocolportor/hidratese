import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/infrastructure/repositories/daos/dayle_param_datasource.dart';

class DayleParamsReppsitoryImpl implements IDayleParamRespository {
  final IDayleParamDatasource _dayleParamDatasource;

  DayleParamsReppsitoryImpl(this._dayleParamDatasource);

  @override
  Future<Either<GeneralExcepion, int>> registerDaylePram(DayleParamsParams params) async {
    int a = await _dayleParamDatasource.registerDayleParams(params);
    return Right(a);
  }
}
