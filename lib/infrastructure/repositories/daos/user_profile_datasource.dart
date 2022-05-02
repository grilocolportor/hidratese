import 'package:hidratese/domain/usercases/user_profile_usercase.dart';

abstract class IUserProfileDataSource {
  Future<int> registerLocalUserProfile(UserProfileParams params);
  Future<int?> rowCountUserProfile(String table);
  Future<List<Map<String, dynamic>>> getLocalUserProfile(String table);
}
