import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book_model.dart';

class BookService {
  final bookCollection = FirebaseFirestore.instance.collection('books');

  void addNewBook(BookModel model) {
    bookCollection.add(model.toMap());
  }

  void deleteBook(String? docId) {
    bookCollection.doc(docId).delete();
  }
}
