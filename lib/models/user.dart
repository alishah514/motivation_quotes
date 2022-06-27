import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;

  UserModel({this.id, this.name});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    // ignore: deprecated_member_use
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
  }
}