import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers.dart';
import '../models/theme.dart';

class ThemingController extends GetxController {
  @override
  void onReady() {
    fetchQuotesTheme();
    super.onReady();
  }

  Rx<List<QuoteTheme>> fontsList = Rx<List<QuoteTheme>>([]);
  List<QuoteTheme> get fonts => fontsList.value;

  fetchQuotesTheme() {
    try {
      fontsList.bindStream(firebaseFirestore
          .collection('themes')
          .snapshots()
          .map((QuerySnapshot query) {
        List<QuoteTheme> fonts = [];
        for (var font in query.docs) {
          final fontModel =
              QuoteTheme.fromDocumentSnapshot(documentSnapshot: font);
          fonts.add(fontModel);
        }
        print(fonts.length);
        return fonts;
      }));
    } on Exception catch (e) {
      print(e);
    }
  }

  // RxList fonts = [
  //   // GoogleFonts.raleway,
  //   // GoogleFonts.pacifico,
  //   // GoogleFonts.lobster,
  //   // GoogleFonts.combo,
  // ].obs;

  RxList fontName = <String>[].obs;
  var myindex = 0.obs;

  var selectedFont = "aBeeZee".obs;

  RxList imagesPath = <String>[
    'assets/wall1.jpg',
    'assets/wall2.jpg',
    'assets/wall3.jpg',
    'assets/wall4.jpg',
  ].obs;

  Future<void> saveBackground(String fontFam, String imgPath) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('fontFam', fontFam);
    prefs.setString('imgPath', imgPath);
  }
}
