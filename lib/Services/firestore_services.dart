import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motivation_quotes/helpers.dart';
import 'package:motivation_quotes/models/category.dart';
import 'package:motivation_quotes/models/quotes.dart';

import '../models/user.dart';

class FirestoreDb {
  Future<bool> createNewUser(UserModel user) async {
    try {
      await firebaseFirestore.collection("users").doc(user.id).set({
        "name": user.name,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Stream<List<Category>> catStream() {
    return firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Category> cats = [];
      for (var category in query.docs) {
        final catModel =
            Category.fromDocumentSnapshot(documentSnapshot: category);
        cats.add(catModel);
      }
      return cats;
    });
  }

  Stream<List<Quotes>> quotesStream(String uid) {
    return firebaseFirestore
        .collection("ownQuotes")
        .doc(uid)
        .collection("quotes")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Quotes> retVal = [];
      query.docs.forEach((element) {
        retVal.add(Quotes.fromDocumentSnapshot(documentSnapshot: element));
        print(retVal.length);
      });
      return retVal;
    });
  }

  Future<void> addToafavorites(Map<String, dynamic> quote, String uid) async {
    await firebaseFirestore
        .collection('usersFavs')
        .doc(uid)
        .collection('favorites')
        .add(quote);
  }

  Future<void> addOwnQuote({String? quote, String? author, String? uid}) async {
    try {
      await firebaseFirestore
          .collection("ownQuotes")
          .doc(uid)
          .collection("quotes")
          .add({
        'quote': quote,
        'category': 'own',
        'author': author,
        'likes': []
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateOne(
      String newcontentValue, String uid, String quoteId) async {
    try {
      firebaseFirestore
          .collection("ownQuotes")
          .doc(uid)
          .collection("quotes")
          .doc(quoteId)
          .update({"quote": newcontentValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  deleteOne(String uid, String quoteId) async {
    try {
      firebaseFirestore
          .collection("ownQuotes")
          .doc(uid)
          .collection("quotes")
          .doc(quoteId)
          .delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> delAsFavorites(Quotes quote, String uid) async {
    await firebaseFirestore
        .collection('usersFavs')
        .doc(uid)
        .collection('favorites')
        .where('id', isEqualTo: quote.id)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        firebaseFirestore
            .collection('usersFavs')
            .doc(uid)
            .collection('favorites')
            .doc(element.id)
            .delete()
            .then((value) => print('Success'));
      });
    });
  }

  Future<List<QueryDocumentSnapshot>> getFromFavorites(String uid) async {
    final res = await firebaseFirestore
        .collection('usersFavs')
        .doc(uid)
        .collection('favorites')
        .get();
    return res.docs;
  }
}
