import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/screens/change_theme.dart';
import 'package:motivation_quotes/screens/content_preferences.dart';
import 'package:motivation_quotes/widgets/setting_list.dart';
import 'package:motivation_quotes/widgets/theme.dart';

class GenralScreen extends StatelessWidget {
  const GenralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "General",
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
          color: context.theme.iconTheme.color,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Make It Yours"),
          ),
          SettingsTile(
              onTap: () {
                Get.to(() => ContentPreferences());
              },
              iconData: Icons.checklist_sharp,
              title: "Content Preferences"),
          SettingsTile(
              onTap: () {}, iconData: Icons.language, title: "Language"),
          SettingsTile(
              onTap: () {
                Get.to(() => ChangeTheme());
              },
              iconData: Icons.dark_mode,
              title: "App Theme"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Suport Us"),
          ),
          SettingsTile(
              onTap: () {}, iconData: Icons.share, title: "Share Motivation"),
          SettingsTile(onTap: () {}, iconData: Icons.android, title: "More"),
          SettingsTile(
              onTap: () {},
              iconData: Icons.thumbs_up_down,
              title: "Leave Review"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Help"),
          ),
          SettingsTile(onTap: () {}, iconData: Icons.help, title: "Help"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text("Other"),
          ),
          SettingsTile(
              onTap: () {},
              iconData: Icons.privacy_tip,
              title: "Privacy Policy"),
        ],
      ),
    );
  }
}
