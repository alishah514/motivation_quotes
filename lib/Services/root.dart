
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/screens/onboarding_screen.dart';
import 'package:motivation_quotes/screens/quotes_screen.dart';

import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user != null) {
          return QuotesScreen();
        } else {
          return OnboardingPage();
        }
      },
    );
  }
}