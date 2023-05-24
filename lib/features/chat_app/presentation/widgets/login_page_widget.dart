import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/utils/constants.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  int i = 0;

  // ignore: unused_field
  late String _email, _password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Map userProfile;

  bool _obscureText = true;
  bool isEmpty = true;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: labelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            onSaved: (input) => _email = input!,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.iconColor,
              ),
              hintText: 'Enter your Email',
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: labelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            onSaved: (input) => _password = input!,
            obscureText: _obscureText,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.iconColor,
              ),
              hintText: 'Enter your Password',
              hintStyle: hintTextStyle,
              suffixIcon: IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        // onPressed: () => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => ForgetPwdScreen())),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Color(0xFFF2796B),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 211, 159, 153);
              }
              return const Color(0xFFF2796B);
            },
          ),
        ),
        // onPressed: () {},
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage())),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            // color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          const Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Sign up",
                style: TextStyle(
                  color: Color(0xFFF2796B),
                  fontSize: 18,
                )),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildEmailTF(),
        const SizedBox(
          height: 30.0,
        ),
        _buildPasswordTF(),
        _buildForgotPasswordBtn(context),
        _buildLoginBtn(context),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: _buildSignupBtn(context),
        ),
      ],
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
