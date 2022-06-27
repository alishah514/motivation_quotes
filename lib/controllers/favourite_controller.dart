import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:motivation_quotes/controllers/auth_controller.dart';

import '../helpers.dart';
import '../models/quotes.dart';

class FavController extends GetxController {
  Rx<List<Quotes>> favQuotesList = Rx<List<Quotes>>([]);
  List<Quotes> get favQuotes => favQuotesList.value;

  var favQuotesLength = 0.obs;

  fetchFav() async {
    try {
      favQuotesList.bindStream(firebaseFirestore
          .collection('quotes')
          .where('likes', arrayContains: Get.find<AuthController>().user!.uid)
          .snapshots()
          .map((QuerySnapshot query) {
        List<Quotes> favquotes = [];
        for (var fav in query.docs) {
          print("SS");
          final quoteModel = Quotes.fromDocumentSnapshot(documentSnapshot: fav);
          favquotes.add(quoteModel);
        }
        favQuotesLength.value = favquotes.length;

        return favquotes;
      }));
    } on Exception catch (e) {
      print(e);
    }
  }

  
}
