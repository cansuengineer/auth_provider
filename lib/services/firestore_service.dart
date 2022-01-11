import 'package:auth_provider/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime time = DateTime.now();

  Future<void> createUser({
    id,
    mail,
    userName,
  }) async {
    await _firestore.collection("users").doc(id).set(
        {"userName": userName, "mail": mail, "about": " ", "createTime": time});
  }

  // Future getUser(String uid) async {
  //   try {
  //     var userData = await _usersCollectionReference.document(uid).get();
  //     return User.fromData(userData.data);
  //   } catch (e) {
  //     // TODO: Find or create a way to repeat error handling without so much repeated code
  //     if (e is PlatformException) {
  //       return e.message;
  //     }

  //     return e.toString();
  //   }
  // }
}
