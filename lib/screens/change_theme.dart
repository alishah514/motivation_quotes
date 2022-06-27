import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/Services/notification_helper.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../Services/theme_service.dart';
import '../widgets/theme.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Change Theme",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.search,
        //         color: context.theme.iconTheme.color,
        //       ))
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: Get.isDarkMode
                ? () {
                    // tz.initializeTimeZones();
                    ThemeService().switchTheme();
                    //   NotificationService().showNotification(
                    //     1, DateTime.now().toString() , "Notification_descrp.text");
                  }
                : null,
            child: Container(
                height: 80,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 0.4,
                  color: lightGreyClr,
                ))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Light Mode',
                        style: subHeadingTextStyle,
                      ),
                      Get.isDarkMode
                          ? Container()
                          : Icon(
                              Icons.check,
                              color: context.theme.iconTheme.color,
                            )
                    ],
                  ),
                )),
          ),
          GestureDetector(
            onTap: Get.isDarkMode
                ? null
                : () {
                    ThemeService().switchTheme();
                  },
            child: Container(
                height: 80,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 0.4,
                  color: lightGreyClr,
                ))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark Mode',
                        style: subHeadingTextStyle,
                      ),
                      Get.isDarkMode
                          ? Icon(
                              Icons.check,
                              color: context.theme.iconTheme.color,
                            )
                          : Container()
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
