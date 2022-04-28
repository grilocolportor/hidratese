class UserProfile {
  final String? gender;
  final String? weight;
  final String? sleep;
  final String? wakeUp;
  final String? remember;
  final String? liter;

  UserProfile(
      {this.remember,
       this.liter,
       this.gender,
       this.weight,
       this.sleep,
       this.wakeUp});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      'sexo': gender,
      'peso': weight,
      'acordar': wakeUp,
      'dormir': sleep,
      'lembrar': remember,
      'litros': liter
    };
    return jsonData;
  }
}
