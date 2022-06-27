import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:motivation_quotes/Services/notification_helper.dart';
import 'package:motivation_quotes/Services/root.dart';
import 'Services/languauge.dart';
import 'Services/theme_service.dart';
import 'controllers/auth_bindings.dart';
import 'widgets/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  NotificationService().initializeNotification();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Motivation',
      themeMode: ThemeService().theme,
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: Root(),
    );
  }
}
