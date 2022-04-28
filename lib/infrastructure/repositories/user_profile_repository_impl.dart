import 'package:hidratese/domain/execeptions/user_profile_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';

class UserProfileRepositoryImpl implements IUserProfileRepository {
  final IUserProfileDataSource _profileDataSource;

  UserProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<Either<UserProfilesExceptions, int>> registerUser(
      UserProfileParams params) async {
    try {
      int r = await _profileDataSource.registerLocalUserProfile(params);
      return Right(r);
    } on UserProfilesExceptions catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(UserProfilesExceptions(e.toString()));
    }
  }
}
