import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentFirebaseUser = fAuth.currentUser;
FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
FirebaseFirestore? firebaseFirestore;
SharedPreferences? sharedPreferences;
