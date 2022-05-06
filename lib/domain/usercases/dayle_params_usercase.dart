import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';

abstract class IDayleParamUserCase {
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam params);
}

class DayleParamUserCase implements IDayleParamUserCase {
  final IDayleParamRespository _dayleParamRespository;

  DayleParamUserCase(this._dayleParamRespository);

  @override
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam params) async {
    return await _dayleParamRespository.registerPeso(params);
  }

  // @override
  // Future<Either<GeneralExcepion, int>> registerDaylePram(
  //     DayleParamsParams params) async {
  //   return await _dayleParamRespository.registerDaylePram(params);
  // }
}

class PesoParam {
  final int? pesoId;
  final String? date;
  final String? peso;

  PesoParam({this.pesoId, this.date, this.peso});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'date': date, 'peso': peso};
    return jsonData;
  }
}

class TemperaturaParam {
  final int? pesoId;
  final String? data;
  final String? temperatura;

  TemperaturaParam(this.pesoId, this.data, this.temperatura);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': temperatura};
    return jsonData;
  }
}

class HumidadeParam {
  final int? pesoId;
  final String? data;
  final String? humidade;

  HumidadeParam(this.pesoId, this.data, this.humidade);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': humidade};
    return jsonData;
  }
}

class LifeStyleParam {
  final int? pesoId;
  final String? data;
  final String? lifeStyle;

  LifeStyleParam(this.pesoId, this.data, this.lifeStyle);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': lifeStyle};
    return jsonData;
  }
}
