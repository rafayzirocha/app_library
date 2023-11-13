import 'package:app_library/model/emprestimo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmprestimoService {
  final emprestimosCollection =
      FirebaseFirestore.instance.collection('emprestimos');

  void novoEmprestimo(EmprestimoModel model) {
    emprestimosCollection.add(model.toMap());
  }

  void excluirEmprestimo(String? docId) {
    emprestimosCollection.doc(docId).delete();
  }
}
