import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String? catId;
  String? catName;
  String? catImageUrl;

  Category({this.catId, this.catImageUrl, this.catName});

  Category.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    catId = documentSnapshot.id;
    catName = documentSnapshot["name"];
  }
}
