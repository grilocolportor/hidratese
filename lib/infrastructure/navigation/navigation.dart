import 'package:get/get.dart';
import 'package:hidratese/presentation/dayle_param/views/dayle_param_view.dart';
import 'package:hidratese/presentation/introduction/views/introduction_view.dart';
import 'package:hidratese/presentation/omboarding/omboarding_view.dart';

import '../../presentation/screens.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.INTRODUCTION,
      page: () => IntroductionView(),
    ),
    GetPage(
      name: Routes.OMBOARDING,
      page: () => OmboardingView(),
    ),
    GetPage(
      name: Routes.DAYLE_PARAM,
      page: () => DayleParamView(),
    ),
  ];
}
