import 'package:chat/core/constants/validator_constants.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final _formKey = GlobalKey<FormState>();
  int i = 0;
  late String email, password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  final FocusNode _field1FocusNode = FocusNode();
  final FocusNode _field2FocusNode = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();

  Widget _buildEmailTF() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Email',
            style: labelStyle,
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field1FocusNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_field2FocusNode);
                // Request focus for the next field
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!validateEmail(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (input) => email = input!,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                fillColor: AppColors.transparentBackgroundColor,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.only(top: 14.0),
                prefixIcon: const Icon(
                  Icons.email,
                  color: AppColors.iconColor,
                ),
                hintText: 'Enter your Email',
                hintStyle: hintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Password',
            style: labelStyle,
          ),
          const SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field2FocusNode,
              onEditingComplete: () {
                _field2FocusNode.unfocus();
              },
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                if (!validatePassword(value)) {
                  return 'Password should be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit';
                }
                return null;
              },
              onSaved: (input) => password = input!,
              obscureText: _obscureText,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                fillColor: AppColors.transparentBackgroundColor,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.only(top: 14.0),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppColors.iconColor,
                ),
                hintText: 'Enter your Password',
                hintStyle: hintTextStyle,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: _obscureText ? Colors.grey : AppColors.primaryColor,
                  ),
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
      ),
    );
  }

  Widget _buildForgotPasswordBtn(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forgot');
        },
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in failed.");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in Successful.");
        break;
      default:
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      height: fullHeight(context) * 0.13,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          String email = emailController.text;
          String password = passwordController.text;
          if (_formKey.currentState!.validate()) {
            (_formKey.currentState!.save());
            try {
              bool success = await authProvider.handleSignIn(email, password);
              if (success) {
                // Login successful, navigate to the next screen or perform any desired action
                Navigator.pushNamed(context, '/homePage');
              } else {
                // Login failed, display a message or perform any other desired action
              }
            } catch (e) {
              if (e is FirebaseAuthException) {
                // Handle FirebaseAuthException
                showAlertDialog(context, e.code, '${e.message}');
              } else {
                // Handle other types of exceptions or errors

                showAlertDialog(context, 'ERROR', '$e');
              }
            }
          }
        },
        child: _isLoading
            ? const CircularProgressIndicator(
                color: AppColors.backgroundColor,
              ) // Show circular progress indicator if Loading
            : const Text(
                'LOGIN',
                style: TextStyle(
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
            // onPressed: () {},
            onPressed: () => Navigator.pushNamed(context, '/registerPage'),
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailTF(),
          const SizedBox(
            height: 30.0,
          ),
          _buildPasswordTF(),
          _buildForgotPasswordBtn(context),
          _buildLoginBtn(context),
          SizedBox(
            width: fullWidth(context) * 0.75,
            child: _buildSignupBtn(context),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String txt1, String txt2) {
    // set up the button
    Widget okButton = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
      child: const Text(
        "OK",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _isLoading = false;
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(txt1),
      icon: const Icon(Icons.error_outlined),
      iconColor: Colors.red,
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
