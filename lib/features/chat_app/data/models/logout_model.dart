import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signOut(context) async {
  FirebaseAuth authentication = FirebaseAuth.instance;
  try {
    print('Userrrr');
    await authentication.signOut();
    Navigator.pushNamed(context, '/loginPage');
  } catch (e) {
    print("error");
  }
}
