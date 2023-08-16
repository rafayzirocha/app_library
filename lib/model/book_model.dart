import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? docId;
  final String title;
  final String author;
  final String synopsis;

  BookModel({
    this.docId,
    required this.title,
    required this.author,
    required this.synopsis,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'synopsis': synopsis,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      title: map['title'] as String,
      author: map['author'] as String,
      synopsis: map['synopsis'] as String,
    );
  }

  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return BookModel(
      docId: doc.id,
      title: doc['title'],
      author: doc['author'],
      synopsis: doc['synopsis'],
    );
  }
}
