class UserProfile {
  final String? gender;
  final String? sleep;
  final String? wakeUp;

  UserProfile({this.gender, this.sleep, this.wakeUp});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      'sexo': gender,
      'acordar': wakeUp,
      'dormir': sleep,
    };
    return jsonData;
  }
}
