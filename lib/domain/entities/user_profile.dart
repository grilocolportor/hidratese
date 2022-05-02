class UserProfile {
  final String? gender;
  final String? sleep;
  final String? wakeUp;

  UserProfile({this.gender, this.sleep, this.wakeUp});

  UserProfile.fromJson(Map<String, dynamic> json)
      : gender = json['sexo'],
        sleep = json['dormir'],
        wakeUp = json['acordar'];

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      'sexo': gender,
      'acordar': wakeUp,
      'dormir': sleep,
    };
    return jsonData;
  }
}
