import 'package:cloud_firestore/cloud_firestore.dart';

class EmprestimoModel {
  String? docId;
  String livroId; // ID do livro emprestado
  String rmAluno; // Registro do Aluno
  DateTime dataEmprestimo;
  DateTime dataDevolucao;
  bool devolvido;

  EmprestimoModel({
    this.docId,
    required this.livroId,
    required this.rmAluno,
    required this.dataEmprestimo,
    required this.dataDevolucao,
    required this.devolvido,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'livroId': livroId,
      'rmAluno': rmAluno,
      'dataEmprestimo': dataEmprestimo,
      'dataDevolucao': dataDevolucao,
      'devolvido': devolvido,
    };
  }

  factory EmprestimoModel.fromMap(Map<String, dynamic> map) {
    return EmprestimoModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      livroId: map['livroId'] as String,
      rmAluno: map['rmAluno'] as String,
      dataEmprestimo: (map['dataEmprestimo'] as Timestamp).toDate(),
      dataDevolucao: (map['dataDevolucao'] as Timestamp).toDate(),
      devolvido: map['devolvido'] as bool,
    );
  }

  factory EmprestimoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return EmprestimoModel(
      docId: doc.id,
      livroId: doc['livroId'] as String,
      rmAluno: doc['rmAluno'] as String,
      dataEmprestimo: (doc['dataEmprestimo'] as Timestamp).toDate(),
      dataDevolucao: (doc['dataDevolucao'] as Timestamp).toDate(),
      devolvido: doc['devolvido'] as bool,
    );
  }
}
