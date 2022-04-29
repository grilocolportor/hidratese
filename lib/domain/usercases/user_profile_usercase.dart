import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/user_profile_exceptions.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';

abstract class IUserProfileUserCase {
  Future<Either<UserProfilesExceptions, int>> call(UserProfileParams params);
}

class UserProfileUserCase implements IUserProfileUserCase {
  final IUserProfileRepository _repository;

  UserProfileUserCase(this._repository);

  @override
  Future<Either<UserProfilesExceptions, int>> call(
      UserProfileParams params) async {
    if (params.wakeUp!.isEmpty) {
      return Left(throw UserProfilesExceptions('Weight cannot be empty'));
    }
    if (params.sleep!.isEmpty) {
      return Left(throw UserProfilesExceptions('Sleep cannot be empty'));
    } else {
      return await _repository.registerUser(params);
    }
  }
}

class UserProfileParams {
  final String? gender;
  final String? sleep;
  final String? wakeUp;

  UserProfileParams({this.gender, this.sleep, this.wakeUp});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> jsonData = {
      'sexo': gender,
      'acordar': wakeUp,
      'dormir': sleep,
    };
    return jsonData;
  }
}
