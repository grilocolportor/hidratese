import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';
import 'package:hidratese/infrastructure/repositories/user_profile_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(UserProfileUserCase)
  @Register.factory(IUserProfileRepository, from: UserProfileRepositoryImpl)
  @Register.factory(IUserProfileUserCase, from:UserProfileUserCase)
  void configure();
}
