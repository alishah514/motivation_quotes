import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/controllers/favourite_controller.dart';
import 'package:motivation_quotes/screens/addQuote_screen.dart';
import 'package:motivation_quotes/screens/favorites_screen.dart';
import 'package:motivation_quotes/screens/edit_reminder_screen.dart';
import 'package:motivation_quotes/screens/reminder_screen.dart';
import 'package:motivation_quotes/widgets/setting_list.dart';

import '../widgets/theme.dart';
import 'general_screen.dart';
import 'widgets_screen.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  final FavController favController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    favController.fetchFav();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
        title: Text(
          "Motivation",
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
      body: Container(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Settings",
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SettingsTile(
                onTap: () {
                  Get.to(() => GenralScreen());
                },
                iconData: Icons.access_alarms,
                title: "General"),
            // SettingsTile(
            //     onTap: () {}, iconData: Icons.access_alarms, title: "App Icon"),
            SettingsTile(
                onTap: () {
                  Get.to(()=> ReminderScreen());
                },
                iconData: Icons.notifications,
                title: "Reminders"),
            SettingsTile(
                onTap: () {
                  Get.to(() => WidgetsScreen());
                },
                iconData: Icons.dashboard,
                title: "Widgets"),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Your Quotes",
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SettingsTile(
                onTap: () {
                  Get.to(() => AddQuote());
                },
                iconData: Icons.note_add,
                title: "Add Your Own"),

            Obx(() {
              return SettingsTile(
                  onTap: () {
                    Get.to(() => FavouritesScreen());
                  },
                  iconData: Icons.favorite,
                  title: "Favourites (${favController.favQuotesLength.value})");
            }),
          ]),
        ),
      ),
    );
  }
}
