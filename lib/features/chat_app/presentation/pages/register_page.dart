// import 'package:find_a_mechanic/nav/constants.dart';
// import 'package:find_a_mechanic/nav/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/register_page_widget.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 100.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Register',
                      style: TextStyle(
                        color: AppColors.whiteTextColor,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: fullWidth(context) * 0.5,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    const SizedBox(height: 30.0),
                    const RegisterPageWidget(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
