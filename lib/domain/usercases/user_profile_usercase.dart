import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/execeptions/user_profile_exceptions.dart';
import 'package:hidratese/infrastructure/repositories/user_profile_repository_impl.dart';

abstract class IUserProfileUserCase {
  Future<Either<UserProfilesExceptions, UserProfile>> call(
      UserProfileParams params);
}

class UserProfileUserCase extends GetxController
    implements IUserProfileUserCase {
  final UserProfileUserCase _repository;

  UserProfileUserCase(this._repository);

  @override
  Future<Either<UserProfilesExceptions, UserProfile>> call(
      UserProfileParams params) async {
    if (params.weight.compareTo(0) == 0) {
      return Left(throw UserProfilesExceptions('Weight cannot be zero'));
    }

    return await _repository(params);
  }
}

class UserProfileParams extends GetxController {
  final String gender;
  final double weight;
  final DateTime sleep;
  final DateTime wakeUp;

  UserProfileParams(
      {required this.gender,
      required this.weight,
      required this.sleep,
      required this.wakeUp});
}
