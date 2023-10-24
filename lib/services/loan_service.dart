import 'package:app_library/model/loan_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoanService {
  final loansCollection = FirebaseFirestore.instance.collection('loans');

  void addNewLoan(LoanModel model) {
    loansCollection.add(model.toMap());
  }

  void deleteLoan(String? docId) {
    loansCollection.doc(docId).delete();
  }
}
