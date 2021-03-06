import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/execeptions/user_profile_exceptions.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

abstract class IUserProfileRepository {
  Future<Either<UserProfilesExceptions, int>> registerUser(
      UserProfileParams params);
  Future<Either<UserProfilesExceptions, List<UserProfile>>> getLocalUserProfile(
      String table);
  Future<int?> getRowUserProfileCoubnt(String table);
}
