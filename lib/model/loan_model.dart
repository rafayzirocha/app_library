import 'package:cloud_firestore/cloud_firestore.dart';

class LoanModel {
  String? docId;
  String bookId;
  String userId;
  DateTime loanDate;
  DateTime dueDate;
  bool returned;

  LoanModel({
    this.docId,
    required this.bookId,
    required this.userId,
    required this.loanDate,
    required this.dueDate,
    required this.returned,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookId': bookId,
      'userId': userId,
      'loanDate': loanDate,
      'dueDate': dueDate,
      'returned': returned,
    };
  }

  factory LoanModel.fromMap(Map<String, dynamic> map) {
    return LoanModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      bookId: map['bookId'] as String,
      userId: map['userId'] as String,
      loanDate: (map['loanDate'] as Timestamp).toDate(),
      dueDate: (map['dueDate'] as Timestamp).toDate(),
      returned: map['returned'] as bool,
    );
  }

  factory LoanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return LoanModel(
      docId: doc.id,
      bookId: doc['bookId'] as String,
      userId: doc['userId'] as String,
      loanDate: (doc['loanDate'] as Timestamp).toDate(),
      dueDate: (doc['dueDate'] as Timestamp).toDate(),
      returned: doc['returned'] as bool,
    );
  }
}
