// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:motivation_quotes/models/quotes.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Services/notification_helper.dart';
// import '../helpers.dart';
// import 'auth_controller.dart';

// class QuotesController extends GetxController {
//   var selectedPagexNumber = 0.obs;
//   var pageControll = PageController();
//   var notifyHelper;

//   late Quotes quote;
//   var currentQuoteId = ''.obs;

//   var currentquotesLike = [].obs;

//   Rx<List<Quotes>> quotesList = Rx<List<Quotes>>([]);
//   List<Quotes> get quotes => quotesList.value;

//   var favourite = false.obs;
//   final AuthController auth = Get.find<AuthController>();
//   // RxBool isFavorite = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   var fontFam = ''.obs;
//   var backImage = ''.obs;

//   RxList fonts = [
//     GoogleFonts.raleway,
//     GoogleFonts.pacifico,
//     GoogleFonts.lobster,
//     GoogleFonts.combo,
//   ].obs;

//   RxList imagesPath = <String>[
//     'assets/wall1.jpg',
//     'assets/wall2.jpg',
//     'assets/wall3.jpg',
//     'assets/wall4.jpg',
//     'assets/Black_colour.jpg'
//   ].obs;

//   fetchQuotes(String catId) {
//     List<Quotes> quotes = [];
//     print(catId);

//     try {
//       quotesList.bindStream(firebaseFirestore
//           .collection('quotes')
//           .where(
//             'category',
//             isEqualTo: "General",
//           )
//           .snapshots()
//           .map((QuerySnapshot query) {
//         for (var quote in query.docs) {
//           final quoteModel =
//               Quotes.fromDocumentSnapshot(documentSnapshot: quote);
//           quotes.add(quoteModel);
//         }

//         print("getting data from firestore");

//         return quotes;
//       }));
//     } on Exception catch (e) {
//       print(e);
//     }
//     quotesList.value.addAll(quotes);
//   }

//   likeQuote(String id) async {
//     DocumentSnapshot doc =
//         await firebaseFirestore.collection('quotes').doc(id).get();
//     var uid = Get.find<AuthController>().user!.uid;
//     if ((doc.data()! as dynamic)['likes'].contains(uid)) {
//       await firebaseFirestore.collection('quotes').doc(id).update({
//         'likes': FieldValue.arrayRemove([uid]),
//       });
//     } else {
//       await firebaseFirestore.collection('quotes').doc(id).update({
//         'likes': FieldValue.arrayUnion([uid]),
//       });
//     }
//   }

//   removeFav(String id) async {
//     DocumentSnapshot doc =
//         await firebaseFirestore.collection('quotes').doc(id).get();
//     var uid = Get.find<AuthController>().user!.uid;
//     if ((doc.data()! as dynamic)['likes'].contains(uid)) {
//       await firebaseFirestore.collection('quotes').doc(id).update({
//         'likes': FieldValue.arrayRemove([uid]),
//       });
//     }
//   }

//   Future<void> getIndex() async {
//     final prefs = await SharedPreferences.getInstance();

//     backImage.value = prefs.getString('imgPath') ?? '';
//     fontFam.value = prefs.getString('fontFam') ?? '';
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motivation_quotes/models/quotes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/notification_helper.dart';
import '../helpers.dart';
import 'auth_controller.dart';

class QuotesController extends GetxController {
  var selectedPagexNumber = 0.obs;
  var pageControll = PageController();
  var notifyHelper;
  var fontFam = ''.obs;
  var backImage = ''.obs;

  late Quotes quote;
  var currentQuoteId = ''.obs;

  var currentquotesLike = [].obs;

  Rx<List<Quotes>> quotesList = Rx<List<Quotes>>([]);

  List<Quotes> get quotes => quotesList.value;

  var favourite = false.obs;
  final AuthController auth = Get.find<AuthController>();

  // RxBool isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  RxList fonts = [
    GoogleFonts.raleway,
    GoogleFonts.pacifico,
    GoogleFonts.lobster,
    GoogleFonts.combo,
  ].obs;

  RxList imagesPath = <String>[
    'assets/wall1.jpg',
    'assets/wall2.jpg',
    'assets/wall3.jpg',
    'assets/wall4.jpg',
    'assets/Black_colour.jpg'
  ].obs;

  Future fetchQuotes(String catId) async {
    //print(catId);

    try {
      await firebaseFirestore
          .collection('quotes')
          .where('category', isEqualTo: 'General')
          .snapshots()
          .forEach((element) {
        element.docs.forEach((quote) {
          final quoteModel =
              Quotes.fromDocumentSnapshot(documentSnapshot: quote);
          quotesList.value.add(quoteModel);
        });
      });
      // await firebaseFirestore
      //     .collection('quotes')
      //     .where(
      //       'category',
      //       isEqualTo: "General",
      //     )
      //     .snapshots()
      //     .map((QuerySnapshot query) {
      //   for (var quote in query.docs) {
      //     final quoteModel =
      //         Quotes.fromDocumentSnapshot(documentSnapshot: quote);
      //     print('qoute model ${quoteModel.author}');
      //     quotesList.value.add(quoteModel);
      //   }
      //
      //   print("getting data from firestore");
      //
      //   return quotes;
      // });
    } on Exception catch (e) {
      print(e);
    }
  }

  likeQuote(String id) async {
    DocumentSnapshot doc =
        await firebaseFirestore.collection('quotes').doc(id).get();
    var uid = Get.find<AuthController>().user!.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firebaseFirestore.collection('quotes').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firebaseFirestore.collection('quotes').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }

  removeFav(String id) async {
    DocumentSnapshot doc =
        await firebaseFirestore.collection('quotes').doc(id).get();
    var uid = Get.find<AuthController>().user!.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firebaseFirestore.collection('quotes').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  Future<void> getIndex() async {
    final prefs = await SharedPreferences.getInstance();

    backImage.value = prefs.getString('imgPath') ??
        'https://th.bing.com/th/id/R.09ffafab488ea1e58dcd63be4f3c28f5?rik=uQCEcu7%2buWWYjw&pid=ImgRaw&r=0';
    fontFam.value = prefs.getString('fontFam') ??
        'https://th.bing.com/th/id/R.09ffafab488ea1e58dcd63be4f3c28f5?rik=uQCEcu7%2buWWYjw&pid=ImgRaw&r=0';
  }
}
