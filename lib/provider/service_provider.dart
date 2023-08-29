import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/book_model.dart';
import '../services/book_service.dart';

final serviceProvider = StateProvider<BookService>((ref) {
  return BookService();
});

final buscaLivros = StreamProvider<List<BookModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('books')
      .orderBy('title')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (snapshot) => BookModel.fromSnapshot(snapshot),
            )
            .toList(),
      );
  yield* getData;
});
