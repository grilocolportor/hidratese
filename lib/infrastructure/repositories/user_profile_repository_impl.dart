import 'package:get/get.dart';
import 'package:hidratese/domain/execeptions/user_profile_exceptions.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';

class UserProfileRepositoryImpl
    implements IUserProfileRepository {
  final IUserProfileDataSource _profileDataSource;

  UserProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<Either<UserProfilesExceptions, UserProfile>> registerUser(
      UserProfileParams params) async {
    try {
      final userProfile = await _profileDataSource.registerLocal(params);
      return Right(userProfile);
    } on UserProfilesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(UserProfilesExceptions('Exception error'));
    }
  }
}
