import 'package:hidratese/domain/entities/user_profile.dart';
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

  @override
  Future<Either<UserProfilesExceptions, List<UserProfile>>> getLocalUserProfile(
      String table) async {
    var result = await _profileDataSource.getLocalUserProfile(table);

    List<UserProfile> _listUserProfile = [];

    if (!result.isEmpty) {
      for (var element in result) {
        var _userProfile = UserProfile.fromJson(element);
        _listUserProfile.add(_userProfile);
      }

      return Right(_listUserProfile);
    } else {
      return Left(UserProfilesExceptions('Usuario não encontrado'));
    }
  }

  @override
  Future<int?> getRowUserProfileCoubnt(String table) async {
    var result = await _profileDataSource.rowCountUserProfile(table);
  }
}
