import 'package:chat/features/chat_app/presentation/widgets/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int i = 0;

  // late String _email, _password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Map userProfile;
  bool _isLogged = false;

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
        (_isLogged)
            ? Center(
                child: Column(
                  children: [
                    Padding(
                      padding: edgeInsetsAll20(),
                      child: const Text(
                        "Already Logged In",
                        style:
                            TextStyle(fontSize: 32, color: AppColors.lightGrey),
                      ),
                    ),
                    Padding(
                      padding: edgeInsetsAll20(),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () {},
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
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Log In',
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
                            ImagePath.splashImage,
                            height: fullHeight(context) * 0.09,
                            width: fullWidth(context) * 0.5,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        const LoginPageWidget(),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    ));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
