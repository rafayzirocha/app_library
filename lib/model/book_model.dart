import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? docId;
  String title;
  List<String> isbn;
  List<String> authors;
  List<String> categories;
  String publisher;
  DateTime publishedDate;
  String description;
  int pageCount;
  int copyCount;
  int loansCount;
  int averageRating;
  int ratingsCount;
  String thumbnail;
  String language;
  bool isAvailable;

  BookModel({
    this.docId,
    required this.title,
    required this.isbn,
    required this.authors,
    required this.categories,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.copyCount,
    required this.loansCount,
    required this.averageRating,
    required this.ratingsCount,
    required this.thumbnail,
    required this.language,
    required this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isbn': isbn,
      'authors': authors,
      'categories': categories,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'pageCount': pageCount,
      'copyCount': copyCount,
      'loansCount': loansCount,
      'averageRating': averageRating,
      'ratingsCount': ratingsCount,
      'thumbnail': thumbnail,
      'language': language,
      'isAvailable': isAvailable,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      title: map['title'] as String,
      isbn: List<String>.from(map['isbn']),
      authors: List<String>.from(map['authors']),
      categories: List<String>.from(map['categories']),
      publisher: map['publisher'] as String,
      publishedDate: map['publishedDate'].toDate(),
      description: map['description'] as String,
      pageCount: map['pageCount'] as int,
      copyCount: map['copyCount'] as int,
      loansCount: map['loansCount'] as int,
      averageRating: map['averageRating'] as int,
      ratingsCount: map['ratingsCount'] as int,
      thumbnail: map['thumbnail'] as String,
      language: map['language'] as String,
      isAvailable: map['isAvailable'] as bool,
    );
  }

  factory BookModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return BookModel(
      docId: doc.id,
      title: doc['title'] as String,
      isbn: List<String>.from(doc['isbn']),
      authors: List<String>.from(doc['authors']),
      categories: List<String>.from(doc['categories']),
      publisher: doc['publisher'] as String,
      publishedDate: (doc['publishedDate'] as Timestamp).toDate(),
      description: doc['description'] as String,
      pageCount: doc['pageCount'] as int,
      copyCount: doc['copyCount'] as int,
      loansCount: doc['loansCount'] as int,
      averageRating: doc['averageRating'] as int,
      ratingsCount: doc['ratingsCount'] as int,
      thumbnail: doc['thumbnail'] as String,
      language: doc['language'] as String,
      isAvailable: doc['isAvailable'] as bool,
    );
  }
}
