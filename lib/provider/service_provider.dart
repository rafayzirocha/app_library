import 'package:app_library/model/user_model.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/book_model.dart';
import '../services/book_service.dart';

final bookProvider = StateProvider<BookService>(
  (ref) {
    return BookService();
  },
);

final warningProvider = StateProvider<WarningService>(
  (ref) {
    return WarningService();
  },
);

final usersProvider = StateProvider<UsersService>(
  (ref) {
    return UsersService();
  },
);

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

final fetchWarnings = StreamProvider<List<WarningModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('warnings')
      .orderBy('title')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (snapshot) => WarningModel.fromSnapshot(snapshot),
            )
            .toList(),
      );
  yield* getData;
});

final buscaUsuarios = StreamProvider<List<UserModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('users')
      .orderBy('name')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (snapshot) => UserModel.fromSnapshot(snapshot),
            )
            .toList(),
      );
  yield* getData;
});
