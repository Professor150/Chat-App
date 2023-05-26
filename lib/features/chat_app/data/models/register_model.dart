import 'package:chat/features/chat_app/presentation/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

late String _email, _password, _confirmpwd;
final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

Future<void> createUserWithEmailAndPassword(BuildContext context) async {
  ProgressDialog pd = ProgressDialog(context: context);
  pd.show(msg: 'Creating Account...', max: 20);
  if (_formkey1.currentState!.validate()) {
    _formkey1.currentState!.save();
    if (_password == _confirmpwd) {
      try {
        final currentUser =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        if (currentUser.user?.uid != null) {
          pd.show();
          await currentUser.user!.sendEmailVerification();

          pd.close();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      } catch (e) {
        print(e);
      }
    } else {
      showAlertDialog(context, 'Email Error', 'Email not matched');
      print('Password not matched');
    }
  }
}

showAlertDialog(BuildContext context, String txt1, String txt2) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(txt1),
    content: Text(txt2),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
