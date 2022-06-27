import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/controllers/auth_controller.dart';

import '../widgets/first_boarding_page.dart';
import '../widgets/sec_onBoarding_page.dart';
import '../widgets/third_onBoarding_page.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  TextEditingController controller = TextEditingController();

  forwardAction() {
    if (isLastPage) {
      Get.find<AuthController>().createUser();
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<Widget> onBoardingPages = [
    FirstBoardingPage(),
    SecBoardingPage(),
    ThirdBoardingPage(),
  ];

  // List<OnboardingInfo> onboardingPages = [
  //   OnboardingInfo('assets/1.jpg', 'Order Your Food',
  //       'Now you can order food any time  right from your mobile.'),
  //   OnboardingInfo('assets/1.jpg', 'Cooking Safe Food',
  //       'We are maintain safty and We keep clean while making food.'),
  //   OnboardingInfo('assets/1.jpg', 'Quick Delivery',
  //       'Orders your favorite meals will be  immediately deliver')
  // ];

}
