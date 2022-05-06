import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';

abstract class IDayleParamRespository {
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam param);
}
