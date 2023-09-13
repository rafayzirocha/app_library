import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book_model.dart';
import '../model/warning_model.dart';

class BookService {
  final bookCollection = FirebaseFirestore.instance.collection('books');

  void addNewBook(BookModel model) {
    bookCollection.add(model.toMap());
  }

  void deleteBook(String? docId) {
    bookCollection.doc(docId).delete();
  }
}

class WarningService {
  final warningCollection = FirebaseFirestore.instance.collection('warnings');

  void addNewWarning(WarningModel model) {
    warningCollection.add(model.toMap());
  }

  void deleteWarning(String? docId) {
    warningCollection.doc(docId).delete();
  }
}
