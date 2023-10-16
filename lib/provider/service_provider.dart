import 'package:app_library/model/warning_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/book_model.dart';
import '../model/user_model.dart';
import '../services/auth_service.dart';
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

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
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

final buscaUsuarioLogado = StreamProvider<UserModel>((ref) async* {
  final emailLogado = FirebaseAuth.instance.currentUser?.email;
  if (emailLogado != null) {
    final getData = FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailLogado)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (snapshot) => UserModel.fromSnapshot(snapshot),
              )
              .first,
        );
    yield* getData;
  }
});
