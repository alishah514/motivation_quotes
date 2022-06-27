import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/controllers/setting_screenController.dart';
import '../widgets/chips.dart';
import '../widgets/theme.dart';

class ContentPreferences extends StatelessWidget {
  ContentPreferences({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0.0,
          leadingWidth: 30,
          title: Text(
            "Content Preferences",
            style: appBarTextStyle,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
            color: context.theme.iconTheme.color,
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            child: CustomChip(settingsController: settingsController)
            ));
  }
}

