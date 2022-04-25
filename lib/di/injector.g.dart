// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => UserProfileUserCase(c<UserProfileUserCase>()))
      ..registerFactory<IUserProfileRepository>(
          (c) => UserProfileRepositoryImpl(c<IUserProfileDataSource>()))
      ..registerFactory<IUserProfileUserCase>(
          (c) => UserProfileUserCase(c<UserProfileUserCase>()));
  }
}
