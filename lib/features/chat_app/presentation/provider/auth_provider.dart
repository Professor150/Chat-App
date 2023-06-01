import 'package:chat/core/constants/firestore_constants.dart';
import 'package:chat/core/utils/global_variables.dart';
import 'package:chat/features/chat_app/data/models/chat_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticated1,
  authenticating,
  authenticateError,
  authenticateException,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firebaseFirestore;
  late SharedPreferences sharedPreferences;

  Status _status = Status.uninitialized;

  Status get status => _status;

  AuthProvider({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.sharedPreferences,
  });

  String? getUserFirebaseId() {
    return sharedPreferences.getString(FirestoreConstants.id);
  }

  Future<bool> isLoggedIn() async {
    await currentFirebaseUser;
    if (currentFirebaseUser != null &&
        sharedPreferences.getString(FirestoreConstants.id)?.isNotEmpty ==
            true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> handleSignUp(String name, String email, String password) async {
    _status = Status.authenticating;
    notifyListeners();
    User? firebaseUser =
        (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
            .user;
    //New user found, so writing data to server
    if (firebaseUser != null) {
      firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .doc(firebaseUser.uid)
          .set({
        FirestoreConstants.email: email,
        FirestoreConstants.name: name,
        FirestoreConstants.password: password,
        FirestoreConstants.photoUrl: firebaseUser.photoURL,
        FirestoreConstants.id: firebaseUser.uid,
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        FirestoreConstants.chattingWith: null
      });
      // Write data to local storage
      User? currentUser = firebaseUser;
      await sharedPreferences.setString(FirestoreConstants.id, currentUser.uid);
      await sharedPreferences.setString(
          FirestoreConstants.name, currentUser.displayName ?? "");
      await sharedPreferences.setString(
          FirestoreConstants.photoUrl, currentUser.photoURL ?? "");

      _status = Status.authenticated1;
      notifyListeners();
      return true;
    } else {
      _status = Status.authenticateError;
      return false;
    }
  }

  Future<bool> handleSignIn(String email, String password) async {
    _status = Status.authenticating;
    notifyListeners();
    User? firebaseUser = (await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (firebaseUser != null) {
      final QuerySnapshot result = await firebaseFirestore
          .collection(FirestoreConstants.pathUserCollection)
          .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
          .get();

      final List<DocumentSnapshot> documents = result.docs;
      // Write data to local storage
      DocumentSnapshot documentSnapshot = documents[0];
      UserChat userChat = UserChat.fromDocument(documentSnapshot);
      await sharedPreferences.setString(FirestoreConstants.id, userChat.id);
      await sharedPreferences.setString(FirestoreConstants.name, userChat.name);
      await sharedPreferences.setString(
          FirestoreConstants.photoUrl, userChat.photoUrl);
      _status = Status.authenticated;
      return true;
    } else {
      _status = Status.authenticateError;
      notifyListeners();
      return false;
    }
  }

  //
  void handleException() {
    _status = Status.authenticateException;
    notifyListeners();
  }

  Future<void> handleSignOut(context) async {
    _status = Status.uninitialized;
    await fAuth.signOut();
    notifyListeners();
    Navigator.popAndPushNamed(context, '/loginPage');
  }
}
