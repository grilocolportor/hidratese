import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/external/local_repository/sql_lite/database_helper.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';

class LocalDataBase implements IUserProfileDataSource {
  final ISQLDataBaseHelper _dataBaseHelper;

  LocalDataBase(this._dataBaseHelper);

  @override
  Future<int> registerLocalUserProfile(UserProfileParams params) async {
    return await _dataBaseHelper.insert(params.toMap(), 'User');
  }
}
