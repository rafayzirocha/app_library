import 'package:cloud_firestore/cloud_firestore.dart';

class LoanModel {
  String? docId;
  List<String> bookIsbn;
  String bookTitle;
  List<String> bookAuthors;
  String bookUrl;
  String userEmail;
  DateTime loanDate;
  DateTime dueDate;
  bool returned;

  LoanModel({
    this.docId,
    required this.bookIsbn,
    required this.bookTitle,
    required this.bookAuthors,
    required this.bookUrl,
    required this.userEmail,
    required this.loanDate,
    required this.dueDate,
    required this.returned,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookIsbn': bookIsbn,
      'bookTitle': bookTitle,
      'bookAuthors': bookAuthors,
      'bookUrl': bookUrl,
      'userEmail': userEmail,
      'loanDate': loanDate,
      'dueDate': dueDate,
      'returned': returned,
    };
  }

  factory LoanModel.fromMap(Map<String, dynamic> map) {
    return LoanModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      bookIsbn: List<String>.from(map['bookIsbn']),
      bookTitle: map['bookTitle'] as String,
      bookAuthors: List<String>.from(map['bookAuthors']),
      bookUrl: map['bookUrl'] as String,
      userEmail: map['userEmail'] as String,
      loanDate: (map['loanDate'] as Timestamp).toDate(),
      dueDate: (map['dueDate'] as Timestamp).toDate(),
      returned: map['returned'] as bool,
    );
  }

  factory LoanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return LoanModel(
      docId: doc.id,
      bookIsbn: List<String>.from(doc['bookIsbn']),
      bookTitle: doc['bookTitle'] as String,
      bookAuthors: List<String>.from(doc['bookAuthors']),
      bookUrl: doc['bookUrl'] as String,
      userEmail: doc['userEmail'] as String,
      loanDate: (doc['loanDate'] as Timestamp).toDate(),
      dueDate: (doc['dueDate'] as Timestamp).toDate(),
      returned: doc['returned'] as bool,
    );
  }
}
