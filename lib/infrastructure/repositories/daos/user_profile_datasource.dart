import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/execeptions/sql_exception.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

abstract class IUserProfileDataSource {
  Future<int> registerLocalUserProfile(UserProfileParams params);
}
