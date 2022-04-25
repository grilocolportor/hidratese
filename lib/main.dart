import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidratese/domain/repositories/user_profile_repository_interface.dart';
import 'package:hidratese/domain/usercases/user_profile_usercase.dart';
import 'package:hidratese/external/local_database.dart';
import 'package:hidratese/infrastructure/navigation/bindings/controllers/controller.binding.dart';
import 'package:hidratese/infrastructure/repositories/daos/user_profile_datasource.dart';
import 'package:hidratese/infrastructure/repositories/user_profile_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
      
  var initialRoute = await Routes.initialRoute;
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
