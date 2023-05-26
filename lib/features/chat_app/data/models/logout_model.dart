import 'package:firebase_auth/firebase_auth.dart';

Future logOut() async {
  FirebaseAuth authentication = FirebaseAuth.instance;
  try {
    await authentication.signOut();
  } catch (e) {
    print("error");
  }
}
