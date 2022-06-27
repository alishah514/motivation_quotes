import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/widgets/theme.dart';
import '../controllers/setting_screenController.dart';
import 'chips.dart';

class ThirdBoardingPage extends StatelessWidget {
  ThirdBoardingPage({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/1.jpg",
                  )),
            ),
          ),
          SizedBox(height: 50),
          Text(
            "What areas of your life would \n like to improve?",
            textAlign: TextAlign.center,
            style: subHeadingTextStyle,
          ),
          SizedBox(height: 15),
          Expanded(child: CustomChip(settingsController: settingsController))
        ],
      ),
    );
  }
}
