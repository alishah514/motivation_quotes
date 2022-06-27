import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                allowImplicitScrolling: false,
                pageSnapping: false,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.onBoardingPages.length,
                itemBuilder: (context, index) {
                  return _controller.onBoardingPages[index];
                }),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 20,
              child: GestureDetector(
                onTap: _controller.forwardAction,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Obx(() {
                      return Center(
                        child: Text(
                            _controller.isLastPage
                                ? 'Continue'
                                : _controller.selectedPageIndex == 0
                                    ? 'Get Started'
                                    : 'Continue',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
