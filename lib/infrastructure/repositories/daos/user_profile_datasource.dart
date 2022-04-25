import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

abstract class IUserProfileDataSource {
  Future<UserProfile> registerLocal(UserProfileParams params);
}
