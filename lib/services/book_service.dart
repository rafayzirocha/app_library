import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book_model.dart';

class BookService {
  final bookCollection = FirebaseFirestore.instance.collection('books');

  void addNewBook(BookModel model) {
    bookCollection.add(model.toMap());
  }

  void updateBook(String? docId, BookModel model) {
    //bookCollection.doc(docId).update({'title': 'A Magia do Silêncio'});
    bookCollection.doc(docId).update(model.toMap());
  }

  /*void updateTask(String? docId, bool? valueUpdate) {
    taskCollection.doc(docId).update({
      'isDone': valueUpdate,
    });
  }*/

  void deleteBook(String? docId) {
    bookCollection.doc(docId).delete();
  }
}
