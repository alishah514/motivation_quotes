import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/controllers/setting_screenController.dart';

import '../widgets/theme.dart';

class WidgetsScreen extends StatelessWidget {
  WidgetsScreen({Key? key}) : super(key: key);

  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    List text = ['Small', 'Medium', 'Big'];
    List updateWidget = ['Never', 'Once a day', 'Once a week'];
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Widgets",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Select the text size of the widget",
              style: subHeadingTextStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: text.length,
                itemBuilder: (context, index) {
                  return MyContainer(
                    title: text[index],
                    settingsController: settingsController,
                    list: settingsController.isSelected,
                    onTap: () {
                      print(settingsController.isSelected);
                      settingsController.selectContainer(
                          index: index, text: text[index]);
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              "Set how often the widget will update.",
              style: subHeadingTextStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: updateWidget.length,
                itemBuilder: (context, index) {
                  return MyContainer(
                    title: updateWidget[index],
                    settingsController: settingsController,
                    list: settingsController.isSelectedUpdate,
                    onTap: () {
                      settingsController.selectWidgetContainer(
                          index: index, text: updateWidget[index]);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer(
      {Key? key,
      required this.title,
      required this.settingsController,
      required this.list,
      required this.onTap})
      : super(key: key);

  final String title;
  final SettingsController settingsController;
  final VoidCallback onTap;
  final List list;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        return Container(
            height: 80,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.1,
              color: lightGreyClr,
            ))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: listTileTextStyle,
                  ),
                  list.contains(title)
                      ? CircleAvatar(
                          radius: 12,
                          backgroundColor: darkHeaderClr,
                          child: Center(
                            child: Icon(
                              Icons.check,
                              size: 12,
                              color: context.theme.iconTheme.color,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ));
      }),
    );
  }
}
