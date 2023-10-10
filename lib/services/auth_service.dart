import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthService({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  })  : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  Future<UserModel?> getUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore.collection('users').doc(uid).get();

    if (doc.exists) {
      return UserModel.fromSnapshot(doc);
    } else {
      return null;
    }
  }

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

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot<Map<String, dynamic>> doc = await _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .get();

      if (doc.exists) {
        return UserModel.fromSnapshot(doc);
      } else {
        return null;
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
