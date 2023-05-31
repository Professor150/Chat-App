import 'package:chat/core/constants/validator_constants.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({super.key});

  @override
  State<RegisterPageWidget> createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  late String email, name, password, confirmPassword, phoneNumber;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText1 = true;
  final FocusNode _field1FocusNode = FocusNode();
  final FocusNode _field2FocusNode = FocusNode();
  final FocusNode _field3FocusNode = FocusNode();
  final FocusNode _field4FocusNode = FocusNode();
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Widget _buildUsername() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Username',
            style: labelStyle,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field1FocusNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_field2FocusNode);
                // Request focus for the next field
              },
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              onSaved: (value) => name = value!,
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
                  Icons.person_2_rounded,
                  color: AppColors.iconColor,
                ),
                hintText: 'Enter your Username',
                hintStyle: hintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Email',
            style: labelStyle,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field2FocusNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_field3FocusNode);
                // Request focus for the next field
              },
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (!validateEmail(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              onSaved: (value) => email = value!,
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

  Widget _buildPassword() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Password',
            style: labelStyle,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field3FocusNode,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(_field4FocusNode);
                // Request focus for the next field
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
              onSaved: (value) => password = value!,
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

  Widget _buildConfirmPassword() {
    return FocusScope(
      node: _focusScopeNode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Confirm Password',
            style: labelStyle,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              focusNode: _field4FocusNode,
              onEditingComplete: () {
                _field4FocusNode.unfocus();
              },
              controller: confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }

                return null;
              },
              onSaved: (input) => confirmPassword = input!,
              obscureText: _obscureText1,
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
                hintText: 'Confirm your Password',
                hintStyle: hintTextStyle,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText1 ? Icons.visibility : Icons.visibility_off,
                    color: _obscureText1 ? Colors.grey : AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Future.delayed(
                      const Duration(
                        milliseconds: 300,
                      ),
                    );
                    setState(() {
                      _obscureText1 = !_obscureText1;
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

  Widget _buildRegisterButton(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign up failed.");
        break;
      case Status.authenticated1:
        Fluttertoast.showToast(msg: "Sign up Successful.");
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
          //   bool isConnected =await checkInternetConnection();
          //   if (isConnected){       //Internet Connection is available

          //   }else {
          //     openDialog(context, 'No Internet Connection');//No internet connection
          //   }
          String name = nameController.text;
          String email = emailController.text;
          String password = passwordController.text;
          String confirmPassword = confirmPasswordController.text;

          if (_formKey.currentState!.validate()) {
            (_formKey.currentState!.save());

            if (password == confirmPassword) {
              try {
                bool success =
                    await authProvider.handleSignUp(name, email, password);
                if (success) {
                  // Login successful, navigate to the next screen or perform any desired action
                  Navigator.pushNamed(context, '/loginPage');
                } else {
                  // Login failed, display a message or perform any other desired action
                }
              } catch (e) {
                if (e is FirebaseAuthException) {
                  // Handle FirebaseAuthException
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(e.code),
                        content: Text('${e.message}'),
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
                } else {
                  // Handle other types of exceptions or errors
                  print('Error: $e');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('$e'),
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
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Error'),
                    content: Text('Passwords did not match'),
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
        },
        child: const Text(
          'REGISTER',
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

  Widget _buildSigninBtn(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          const Text(
            "Already have an account?",
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/loginPage"),
            child: const Text("Sign In",
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
          _buildUsername(),
          SizedBox(
            height: fullHeight(context) * 0.0075,
          ),
          _buildEmail(),
          SizedBox(
            height: fullHeight(context) * 0.0075,
          ),
          _buildPassword(),
          SizedBox(
            height: fullHeight(context) * 0.0075,
          ),
          _buildConfirmPassword(),
          _buildRegisterButton(context),
          SizedBox(
            width: fullWidth(context) * 0.8,
            child: _buildSigninBtn(context),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
