import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String rm;
  String email;
  String nome;
  int contato;
  String curso;

  UserModel({
    this.docId,
    required this.rm,
    required this.email,
    required this.nome,
    required this.contato,
    required this.curso,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rm': rm,
      'email': email,
      'nome': nome,
      'contato': contato,
      'curso': curso,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      rm: map['rm'] as String,
      email: map['email'] as String,
      nome: map['nome'] as String,
      contato: map['contato'] as int,
      curso: map['curso'] as String,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      docId: doc.id,
      rm: doc['rm'] as String,
      email: doc['email'] as String,
      nome: doc['nome'] as String,
      contato: doc['contato'] as int,
      curso: doc['curso'] as String,
    );
  }
}
