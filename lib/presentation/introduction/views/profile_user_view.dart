import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
          Center(
            child: Text(
              'ProfileUserView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        
      ],
    );
  }
}
