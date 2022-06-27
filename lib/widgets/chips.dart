import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/widgets/theme.dart';

import '../controllers/setting_screenController.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (16 / 5),
        ),
        itemCount: settingsController.wordName.length,
        itemBuilder: (context, index) {
          return GestureDetector(onTap: () {
            if (settingsController.selectedIndexes.contains(index)) {
              print(index);
              settingsController.selectedIndexes.remove(index);
            } else {
              print(index);
              settingsController.selectedIndexes.add(index);
            }
            // showButton = true;
          }, child: Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: settingsController.selectedIndexes.contains(index)
                        ? Get.isDarkMode
                            ? white
                            : Colors.black
                        : context.theme.backgroundColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color:
                            settingsController.selectedIndexes.contains(index)
                                ? Get.isDarkMode
                                    ? Colors.black
                                    : white
                                : Get.isDarkMode
                                    ? white
                                    : Colors.black,
                        width: 0.8),
                  ),
                  child: Row(children: [
                    Flexible(
                        child: Center(
                            child: Text(
                                settingsController.wordName[index]
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  color: settingsController.selectedIndexes
                                          .contains(index)
                                      ? Get.isDarkMode
                                          ? Colors.black
                                          : white
                                      : Get.isDarkMode
                                          ? white
                                          : Colors.black,
                                ))))
                  ])),
            );
          }));
        });
  }
}
