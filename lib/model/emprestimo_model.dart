import 'package:cloud_firestore/cloud_firestore.dart';

class EmprestimoModel {
  String? docId;
  String aluno;
  String email;
  String curso;
  int contato;
  int rm;
  String livro;
  List<String> isbn;
  List<String> autores;
  String urlCapa;
  DateTime retirada;
  DateTime devolucao;
  bool status;

  EmprestimoModel({
    this.docId,
    required this.aluno,
    required this.email,
    required this.curso,
    required this.contato,
    required this.rm,
    required this.livro,
    required this.isbn,
    required this.autores,
    required this.urlCapa,
    required this.retirada,
    required this.devolucao,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aluno': aluno,
      'email': email,
      'curso': curso,
      'contato': contato,
      'rm': rm,
      'livro': livro,
      'isbn': isbn,
      'autores': autores,
      'urlCapa': urlCapa,
      'retirada': retirada,
      'devolucao': devolucao,
      'status': status,
    };
  }

  factory EmprestimoModel.fromMap(Map<String, dynamic> map) {
    return EmprestimoModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      aluno: map['aluno'] as String,
      email: map['email'] as String,
      curso: map['curso'] as String,
      contato: map['contato'] as int,
      rm: map['rm'] as int,
      livro: map['livro'] as String,
      isbn: List<String>.from(map['isbn']),
      autores: List<String>.from(map['autores']),
      urlCapa: map['urlCapa'] as String,
      retirada: (map['retirada'] as Timestamp).toDate(),
      devolucao: (map['devolucao'] as Timestamp).toDate(),
      status: map['status'] as bool,
    );
  }

  factory EmprestimoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return EmprestimoModel(
      docId: doc.id,
      aluno: doc['aluno'] as String,
      email: doc['email'] as String,
      curso: doc['curso'] as String,
      contato: doc['contato'] as int,
      rm: doc['rm'] as int,
      livro: doc['livro'] as String,
      isbn: List<String>.from(doc['isbn']),
      autores: List<String>.from(doc['autores']),
      urlCapa: doc['urlCapa'] as String,
      retirada: (doc['retirada'] as Timestamp).toDate(),
      devolucao: (doc['devolucao'] as Timestamp).toDate(),
      status: doc['status'] as bool,
    );
  }
}
