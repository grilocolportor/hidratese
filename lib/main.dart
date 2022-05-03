import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hidratese/di/injector.dart';
import 'package:hidratese/infrastructure/navigation/bindings/controller.binding.dart';
import 'package:hidratese/infrastructure/theme/app_theme.dart';


import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/themes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();
  await GetStorage.init();
  var initialRoute = await Routes.initialRoute;
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
      theme: AppTheme().themeDatalight,
      darkTheme: AppTheme().themeDataDark,
      themeMode: ThemeService().theme,
    );
  }
}
