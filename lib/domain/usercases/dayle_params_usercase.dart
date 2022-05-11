import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/general_exception.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';

abstract class IDayleParamUserCase {
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam params);
  Future<Either<GeneralExcepion, int>> registerEstiloVida(
      LifeStyleParam params);
  Future<Either<GeneralExcepion, int>> registerTemperatura(
      TemperaturaParam params);
  Future<Either<GeneralExcepion, int>> registerHumidade(HumidadeParam params);
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>> getPeso();
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>> getTemperatura();
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>> getHumidade();
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>> getEstiloVida();
}

class DayleParamUserCase implements IDayleParamUserCase {
  final IDayleParamRespository _dayleParamRespository;

  DayleParamUserCase(this._dayleParamRespository);

  @override
  Future<Either<GeneralExcepion, int>> registerPeso(PesoParam params) async {
    return await _dayleParamRespository.registerPeso(params);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerEstiloVida(
      LifeStyleParam params) async {
    return await _dayleParamRespository.registerEstiloVida(params);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerHumidade(
      HumidadeParam params) async {
    return await _dayleParamRespository.registerHumidade(params);
  }

  @override
  Future<Either<GeneralExcepion, int>> registerTemperatura(
      TemperaturaParam params) async {
    return await _dayleParamRespository.registerTemperatura(params);
  }

  @override
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>> getPeso() async {
    return await _dayleParamRespository.getPeso();
  }

  @override
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>>
      getEstiloVida() async {
    return await _dayleParamRespository.getEstiloVida();
  }

  @override
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>>
      getHumidade() async {
    return await _dayleParamRespository.gethumanidade();
  }

  @override
  Future<Either<GeneralExcepion, List<Map<String, dynamic>>>>
      getTemperatura() async {
    return await _dayleParamRespository.getTemperatura();
  }
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

  TemperaturaParam({this.pesoId, this.data, this.temperatura});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': temperatura};
    return jsonData;
  }
}

class HumidadeParam {
  final int? pesoId;
  final String? data;
  final String? humidade;

  HumidadeParam({this.pesoId, this.data, this.humidade});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': humidade};
    return jsonData;
  }
}

class LifeStyleParam {
  final int? pesoId;
  final String? data;
  final String? lifeStyle;

  LifeStyleParam({this.pesoId, this.data, this.lifeStyle});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {'data': data, 'peso': lifeStyle};
    return jsonData;
  }
}
