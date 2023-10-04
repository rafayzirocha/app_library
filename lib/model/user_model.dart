import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String name;
  String email;
  String phoneNumber;

  UserModel({
    this.docId,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      docId: doc.id,
      name: doc['name'] as String,
      email: doc['email'] as String,
      phoneNumber: doc['phoneNumber'] as String,
    );
  }
}
