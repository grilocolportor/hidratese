import 'package:hidratese/domain/entities/user_profile.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/external/local_repository/sql_lite/database_helper.dart';
import 'package:hidratese/external/local_repository/local_database.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';
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
          (container) => LocalDataBase(container.resolve()))
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
