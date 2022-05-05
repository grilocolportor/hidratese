class DayleParams {
  final int? dayleParamsId;
  final DateTime? data;
  final double? peso;
  final int? temperatura;
  final int? humidade;
  final int? lifeStyle;

  DayleParams(
      {this.dayleParamsId,
      this.data,
      this.peso,
      this.temperatura,
      this.humidade,
      this.lifeStyle});

  DayleParams.fromJson(Map<String, dynamic> json)
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
