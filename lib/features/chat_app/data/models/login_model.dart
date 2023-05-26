import 'package:firebase_auth/firebase_auth.dart';

Future<User?> logInWithEmailAndPassword(String email, String password) async {
  FirebaseAuth authentication = FirebaseAuth.instance;
  try {
    User? user = (await authentication.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Login succesful");
      return user;
    } else {
      print("Login failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future<User?> logInWithEmailLink(String email, String emailLink) async {
  FirebaseAuth authentication = FirebaseAuth.instance;
  try {
    User? user = (await authentication.signInWithEmailLink(
            email: email, emailLink: emailLink))
        .user;
    if (user != null) {
      print("Login succesful");
      return user;
    } else {
      print("Login failed");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
