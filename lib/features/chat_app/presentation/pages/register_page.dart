// import 'package:find_a_mechanic/nav/constants.dart';
// import 'package:find_a_mechanic/nav/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/register_page_widget.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: size.height * 0.9,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: const Color(0xFF59B6B0),
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 100.0,
            ),
            child: Form(
              key: _formkey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Register Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: AppColors.background,
                    child: Image.network(

                      ImagePath.vurilo,

                      height: fullHeight(context) * 0.09,
                      width: fullWidth(context) * 0.5,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  RegisterPageWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
  // Future<void> createUserWithEmailAndPassword(BuildContext context) async{

  //   progressDialog = ProgressDialog(context,type: ProgressDialogType.Normal);
  //   progressDialog.style(
  //       message: 'Creating Account...',
  //   );
  //   if(_formkey1.currentState.validate()){
  //     _formkey1.currentState.save();
  //     if(_password == _confirmpwd){
  //     try{
  //       final currentUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password,);

  //       if(currentUser.user.uid != null){
  //         progressDialog.show();
  //         await currentUser.user.sendEmailVerification();

  //             progressDialog.hide();
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));

  //       }
  //     }catch(e){
  //       print(e.message);
  //     }
  //     }else{
  //       showAlertDialog(context,'Password Error','Password mismatched');
  //       print('Password not matched');
  //     }
  //   }

  // }
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
}
