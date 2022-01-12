import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../model/user_model.dart';

class Auth {
  //1
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //2
  User? _firebaseUser(auth.User? user) {
    //3
    if (user == null) {
      return null;
    }
    //4
    return User(user.uid, user.email);
  }

  //5
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_firebaseUser);
  }

  //6
  Future<User?> handleSignInEmail(String email, String password) async {
    //7
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    //8
    return _firebaseUser(result.user);
  }

  //9
  Future<User?> handleSignUp(String email, String password) async {
    //10
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    //11
    return _firebaseUser(result.user);
  }

  //12
  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }

  // Future<void> createUser({
  //   id,
  //   mail,
  //   userName,
  // }) async {
  //   await _firestore
  //       .collection("users")
  //       .doc(id)
  //       .set({"userName": userName, "mail": mail, "about": " "});
  // }
  Future<User?> createUser(
      //String username,
      String email,
      String password) async {
    var user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      await _firestore
          .collection("User")
          .doc(user.user?.uid ?? "")
          .set({'email': email, 'password': password});
    } catch (e) {
      print(e);
    }
    return _firebaseUser(user.user);
  }
}
