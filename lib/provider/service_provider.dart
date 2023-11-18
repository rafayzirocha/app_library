import 'package:app_library/model/emprestimo_model.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:app_library/services/emprestimo_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/book_model.dart';
import '../model/user_model.dart';
import '../services/auth_service.dart';
import '../services/book_service.dart';
import '../services/users_service.dart';

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

final emprestimoProvider = StateProvider<EmprestimoService>(
  (ref) {
    return EmprestimoService();
  },
);

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

final usersServiceProvider = Provider<UsersService>((ref) {
  return UsersService(
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

final fetchUsers = StreamProvider<List<UserModel>>((ref) async* {
  final getData = FirebaseFirestore.instance
      .collection('users')
      .orderBy('rm')
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

final buscaEmprestimosAbertos =
    StreamProvider<List<EmprestimoModel>>((ref) async* {
  final emailUsuarioLogado = FirebaseAuth.instance.currentUser?.email;

  final getData = FirebaseFirestore.instance
      .collection('emprestimos')
      .orderBy('devolucao')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
          (snapshot) => EmprestimoModel.fromSnapshot(snapshot),
        )
            .where((emprestimo) {
          if (emailUsuarioLogado == "e096bibli@cps.sp.gov.br") {
            return true &&
                emprestimo.status == true &&
                emprestimo.devolucao.isAfter(DateTime.now());
          } else {
            return emprestimo.email == emailUsuarioLogado &&
                emprestimo.status == true &&
                emprestimo.devolucao.isAfter(DateTime.now());
          }
        }).toList(),
      );
  yield* getData;
});

final buscaEmprestimosPendentes =
    StreamProvider<List<EmprestimoModel>>((ref) async* {
  final emailUsuarioLogado = FirebaseAuth.instance.currentUser?.email;

  final getData = FirebaseFirestore.instance
      .collection('emprestimos')
      .orderBy('devolucao')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
          (snapshot) => EmprestimoModel.fromSnapshot(snapshot),
        )
            .where((emprestimo) {
          if (emailUsuarioLogado == "e096bibli@cps.sp.gov.br") {
            return true &&
                emprestimo.status == true &&
                emprestimo.devolucao.isBefore(DateTime.now());
          } else {
            return emprestimo.email == emailUsuarioLogado &&
                emprestimo.status == true &&
                emprestimo.devolucao.isBefore(DateTime.now());
          }
        }).toList(),
      );
  yield* getData;
});

final buscaEmprestimosConcluidos =
    StreamProvider<List<EmprestimoModel>>((ref) async* {
  final emailUsuarioLogado = FirebaseAuth.instance.currentUser?.email;

  final getData = FirebaseFirestore.instance
      .collection('emprestimos')
      .orderBy('devolucao')
      .snapshots()
      .map(
        (event) => event.docs
            .map(
          (snapshot) => EmprestimoModel.fromSnapshot(snapshot),
        )
            .where((emprestimo) {
          if (emailUsuarioLogado == "e096bibli@cps.sp.gov.br") {
            return true && emprestimo.status == false;
          } else {
            return emprestimo.email == emailUsuarioLogado &&
                emprestimo.status == false;
          }
        }).toList(),
      );
  yield* getData;
});
