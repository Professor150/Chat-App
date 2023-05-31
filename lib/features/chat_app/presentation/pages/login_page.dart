import 'package:chat/features/chat_app/presentation/widgets/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int i = 0;
  late final AuthProvider authProvider = context.read<AuthProvider>();

  // Map userProfile;
  final bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: <Widget>[
            (_isLogged)
                ? Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: edgeInsetsAll20(),
                          child: const Text(
                            "Already Logged In",
                            style: TextStyle(
                                fontSize: 32, color: AppColors.lightGrey),
                          ),
                        ),
                        Padding(
                          padding: edgeInsetsAll20(),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {
                              authProvider.handleSignOut(context);
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
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
                            'Log In',
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
                          const LoginPageWidget(),
                        ],
                      ),
                    ),
                  ),
          ],
        ));
  }
}
