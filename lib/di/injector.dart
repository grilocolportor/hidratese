import 'package:hidratese/domain/entities/dayle_params.dart';
import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/repositories/dayle_param_param_repository_interface.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/dayle_params_usercase.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/external/handler_native_code/handler_native_code.dart';
import 'package:hidratese/external/local_repository/local_database_dayle_param.dart';
import 'package:hidratese/external/local_repository/local_database_user_profile.dart';
import 'package:hidratese/external/local_repository/sql_lite/database_helper.dart';
import 'package:hidratese/external/storage/get_storage_handle.dart';
import 'package:hidratese/infrastructure/repositories/daos/dayle_param_datasource.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';
import 'package:hidratese/infrastructure/repositories/dayle_params_repository_impl.dart';
import 'package:hidratese/infrastructure/repositories/user_profile_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

abstract class Injector {
  static var _container = KiwiContainer();

  static void setup() {
    _container = KiwiContainer()
      ..registerFactory((container) => UserProfile())
      ..registerFactory((container) => UserProfileUserCase(container.resolve()))
      ..registerFactory<IUserProfileRepository>(
          (container) => UserProfileRepositoryImpl(container.resolve()))
      ..registerFactory<IUserProfileDataSource>(
          (container) => LocalDataBaseUserProfile(container.resolve()))
      ..registerFactory((container) => DayleParams())
      ..registerFactory((container) => DayleParamUserCase(container.resolve()))
      ..registerFactory<IDayleParamRespository>(
          (container) => DayleParamsReppsitoryImpl(container.resolve()))
      ..registerFactory<IDayleParamDatasource>(
          (container) => LocalDataBaseDayleParams(container.resolve()))
      ..registerFactory((container) => HandlerNativeCode())
      ..registerFactory((container) => GetStoragehandle())
      ..registerFactory<ISQLDataBaseHelper>(
          (container) => DatabaseHelper.instance);
  }

  static final resolve = _container.resolve;

  // void configure() {
  //   _configureHidrateseFeatureModuleInstace();
  //   _configureHidrateseFeatureModuleFactories();
  // }

  // void _configureHidrateseFeatureModuleInstace() {
  //   _container.registerInstance(IUserProfileDataSource);
  // }

  // @Register.factory(UserProfileUserCase)
  // @Register.factory(LocalDatabase)
  // @Register.factory(IUserProfileRepository, from: UserProfileRepositoryImpl)
  // void _configureHidrateseFeatureModuleFactories();
}
