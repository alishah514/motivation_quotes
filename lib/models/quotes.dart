import 'package:cloud_firestore/cloud_firestore.dart';

class Quotes {
  String? id;
  String? quote;
  String? author;
  String? category;
  List? likes;

  Quotes({
    this.quote,
    this.author,
    this.category,
    this.id,
    this.likes,
  });

  Quotes.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    quote = documentSnapshot["quote"];
    category = documentSnapshot["category"];
    author = documentSnapshot["author"];
    likes = documentSnapshot['likes'] ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      "quote": quote,
      "category": category,
      "author": author,
      'likes': likes
    };
  }
}
