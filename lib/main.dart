import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/infrastructure/navigation/bindings/controllers/controller.binding.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

// final container = KiwiContainer()
//   ..registerFactory((container) => UserProfileUserCase(container.resolve()))
//   ..registerFactory<IUserProfileRepository>(
//       (container) => UserProfileRepositoryImpl(container.resolve()))
//   ..registerFactory<IUserProfileDataSource>((container) => DatabaseHelper());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();
  var initialRoute = await Routes.initialRoute;
//  Injector.setup();
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      initialBinding: ControllerBinding(),
    );
  }
}
