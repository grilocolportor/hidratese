import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';

abstract class IDayleParamRespository {
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam param);
  Future<Either<GeneralExcepion, int>> registerTemperatura(TemperaturaParam param);
  Future<Either<GeneralExcepion, int>> registerHumidade(HumidadeParam param);
  Future<Either<GeneralExcepion, int>> registerEstiloVida(LifeStyleParam param);
}
