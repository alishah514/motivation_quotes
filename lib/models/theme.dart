import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteTheme {
  String? themeName;
  String? themeBackground;
  String? themeFont;

  QuoteTheme({
    this.themeName,
    this.themeBackground,
    this.themeFont,
  });

  QuoteTheme.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    themeName = documentSnapshot["themeName"];
    themeFont = documentSnapshot["themeFont"];
    themeBackground = documentSnapshot["themeBackground"];
  }

  Map<String, dynamic> toMap() {
    return {
      "themeName": themeName,
      "themeFont": themeFont,
      "themeBackground": themeBackground,
    };
  }
}
