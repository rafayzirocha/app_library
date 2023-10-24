import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class UsersService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UsersService({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  Future<UserModel?> createUser(
    String email,
    String password,
    String nome,
    String rm,
    int contato,
    String curso,
  ) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        email: email,
        nome: nome,
        rm: rm,
        contato: contato,
        curso: curso,
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(user.toMap());

      return user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  final usersCollection = FirebaseFirestore.instance.collection('users');

  void deleteUser(String? docId) {
    usersCollection.doc(docId).delete();
  }
}
