import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dayle_param_controller.dart';

class DayleParamView extends GetView<DayleParamController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'DayleParamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
