import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';

abstract class IDayleParamDatasource {
  Future<int> registerDayleParams(DayleParamsParams params);
}
