import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';

class LocalDatabase implements IUserProfileDataSource {
  @override
  Future<UserProfile> registerLocal(UserProfileParams params) async {
    return UserProfile(
        gender: params.gender,
        weight: params.weight,
        sleep: params.sleep,
        wakeUp: params.wakeUp);
  }
  
}
