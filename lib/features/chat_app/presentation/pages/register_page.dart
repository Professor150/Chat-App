// import 'package:find_a_mechanic/nav/constants.dart';
// import 'package:find_a_mechanic/nav/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/register_page_widget.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

                    child: Image.asset("assets/images/logo.png"),
                  ),
                  const SizedBox(height: 30.0),
                  const RegisterPageWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
