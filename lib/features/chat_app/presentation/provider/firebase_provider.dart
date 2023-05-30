import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(
      BuildContext context, String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = userCredential.user!.uid;
      await _firestore
          .collection('users')
          .doc(userId)
          .set({"password": password, "email": email, "name": name});
      // ignore: use_build_context_synchronously
      _showSuccessMessage(context);
      Navigator.pushNamed(context, '/loginPage');
      print('User Registerd and data Stored succesfully');
    } catch (error) {
      print('Registration error :$error');
    }
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Signup successful')),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        Navigator.pushNamed(context, '/homePage');
        print('Login successful');
      } else {
        print('Login error ');
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<void> sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      if (email.isNotEmpty) {
        await _auth.sendPasswordResetEmail(email: email);

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Password Reset Email Sent'),
              content: Text(
                'A password reset email has been sent to $email. '
                'Please check your email and follow the instructions to reset your password.',
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginPage');
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Invalid Email'),
              content: const Text('Please enter a valid email address.'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Password Reset Failed'),
            content: const Text(
              'An error occurred while sending the password reset email. '
              'Please check your email address and try again.',
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}
