import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../helpers.dart';
import '../models/quotes.dart';
import 'auth_controller.dart';

class OwnQuotesController extends GetxController {
  Rx<List<Quotes>> quoteList = Rx<List<Quotes>>([]);

  List<Quotes> get quotes => quoteList.value;

  fetchOwnQuotes() {
    try {
      quoteList.bindStream(firebaseFirestore
          .collection("ownQuotes")
          .doc(Get.find<AuthController>().user!.uid)
          .collection("quotes")
          .snapshots()
          .map((QuerySnapshot query) {
        List<Quotes> quotes = [];
        for (var quote in query.docs) {
          final quoteModel =
              Quotes.fromDocumentSnapshot(documentSnapshot: quote);
          quotes.add(quoteModel);
        }
        return quotes;
      }));
    } on Exception catch (e) {
      print(e);
    }
  }

  removeFav(String id) async {
    firebaseFirestore
        .collection("ownQuotes")
        .doc(Get.find<AuthController>().user!.uid)
        .collection("quotes")
        .doc(id)
        .delete();

    // var uid = Get.find<AuthController>().user!.uid;
    // if ((doc.data()! as dynamic)['likes'].contains(uid)) {
    //   await firebaseFirestore.collection('quotes').doc(id).update({
    //     'likes': FieldValue.arrayRemove([uid]),
    //   });
    // }
  }
}
