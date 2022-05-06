import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/infrastructure/repositories/daos/dayle_param_datasource.dart';

class DayleParamsReppsitoryImpl implements IDayleParamRespository {
  final IDayleParamDatasource _dayleParamDatasource;

  DayleParamsReppsitoryImpl(this._dayleParamDatasource);

  @override
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam param) async {
    int a = await _dayleParamDatasource.resgisterPeso(param);
    return Right(a);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerEstiloVida(
      LifeStyleParam param) async {
    int a = await _dayleParamDatasource.resgisterEstiloVida(param);
    return Right(a);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerHumidade(
      HumidadeParam param) async {
    int a = await _dayleParamDatasource.resgisterHumidade(param);
    return Right(a);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerTemperatura(
      TemperaturaParam param) async {
    int a = await _dayleParamDatasource.resgisterTemperatura(param);
    return Right(a);
  }
}
