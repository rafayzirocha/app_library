import 'package:cloud_firestore/cloud_firestore.dart';

class WarningModel {
  String? docId;
  String title;
  String description;
  String imageUrl;
  DateTime publishedDate;

  WarningModel({
    this.docId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'publishedDate': publishedDate,
    };
  }

  factory WarningModel.fromMap(Map<String, dynamic> map) {
    return WarningModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      publishedDate: map['publishedDate'].toDate(),
    );
  }

  factory WarningModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return WarningModel(
      docId: doc.id,
      title: doc['title'] as String,
      description: doc['description'] as String,
      imageUrl: doc['imageUrl'] as String,
      publishedDate: (doc['publishedDate'] as Timestamp).toDate(),
    );
  }
}
