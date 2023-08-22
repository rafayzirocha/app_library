import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? docId;
  final String imageUrl;
  final String isbn;
  final String title;
  final String author;
  final String synopsis;
  final String pages;
  final String copies;
  final String status;

  BookModel({
    this.docId,
    required this.imageUrl,
    required this.isbn,
    required this.title,
    required this.author,
    required this.synopsis,
    required this.pages,
    required this.copies,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'isbn': isbn,
      'title': title,
      'author': author,
      'synopsis': synopsis,
      'pages': pages,
      'copies': copies,
      'status': status,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      imageUrl: map['imageUrl'] as String,
      isbn: map['isbn'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      synopsis: map['synopsis'] as String,
      pages: map['pages'] as String,
      copies: map['copies'] as String,
      status: map['status'] as String,
    );
  }

  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return BookModel(
      docId: doc.id,
      imageUrl: doc['imageUrl'],
      isbn: doc['isbn'],
      title: doc['title'],
      author: doc['author'],
      synopsis: doc['synopsis'],
      pages: doc['pages'],
      copies: doc['copies'],
      status: doc['status'],
    );
  }
}
