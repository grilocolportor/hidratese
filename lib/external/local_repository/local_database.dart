import 'package:dartz/dartz.dart';
import 'package:hidratese/domain/execeptions/sql_exception.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/external/local_repository/database_helper.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';

class LocalDataBase implements IUserProfileDataSource {
  final IDataBaseHelper _dataBaseHelper;

  LocalDataBase(this._dataBaseHelper);

  @override
  Future<int> registerLocalUserProfile(
      UserProfileParams params) async {
    return await _dataBaseHelper.insert(params.toMap(), 'User');

    // return UserProfile(
    //     gender: params.gender!,
    //     weight: params.weight!,
    //     sleep: params.sleep!,
    //     wakeUp: params.wakeUp!, liter: '');
  }
}
