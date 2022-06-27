import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class Login extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  _authController.createUser();
                },
                child: Text("Welcome"))));
  }
}
