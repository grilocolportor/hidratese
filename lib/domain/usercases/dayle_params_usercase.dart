import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';

abstract class IDayleParamUserCase {
  Future<Either<GeneralExcepion, int>> registerDaylePram(
      DayleParamsParams params);
}

class DayleParamUserCase implements IDayleParamUserCase {
  final IDayleParamRespository _dayleParamRespository;

  DayleParamUserCase(this._dayleParamRespository);

  @override
  Future<Either<GeneralExcepion, int>> registerDaylePram(
      DayleParamsParams params) async {
    return await _dayleParamRespository.registerDaylePram(params);
  }
}

class DayleParamsParams {
  final int? dayleParamsId;
  final DateTime? data;
  final double? peso;
  final int? temperatura;
  final int? humidade;
  final int? lifeStyle;

  DayleParamsParams(
      {this.dayleParamsId,
      this.data,
      this.peso,
      this.temperatura,
      this.humidade,
      this.lifeStyle});

  DayleParamsParams.fromJson(Map<String, dynamic> json)
      : dayleParamsId = json['dayleParamsId'],
        data = json['data'],
        peso = json['peso'],
        temperatura = json['temperatura'],
        humidade = json['humidade'],
        lifeStyle = json['lifeStyle'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      'dayleParamsId': dayleParamsId,
      'data': data,
      'peso': peso,
      'temperatura': temperatura,
      'humidade': humidade,
      'lifeStyle': lifeStyle
    };
    return jsonData;
  }
}
