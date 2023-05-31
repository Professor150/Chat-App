import 'package:chat/features/chat_app/presentation/pages/register_page.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/constants/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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
  bool _isloading = false;
  bool _obscureText = true;

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
            decoration: InputDecoration(
              border: InputBorder.none,
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
        onPressed: () {
          String email = emailController.text;
          String password = passwordController.text;
          authProvider.handleSignIn(email, password).then((isSuccess) {
            if (isSuccess) {
              Navigator.pushNamed(context, '/homePage');
            }
          });

          // FirebaseAuth.instance
          //     .signInWithEmailAndPassword(
          //   email: email,
          //   password: password,
          // )
          //     .then((UserCredential userCredential) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (_) => const HomePage(),
          //     ),
          //   );
          //   print('Login successful');
          // }).catchError((error) {
          //   print('Login error: $error');
          // });
        },
        child: const Text(
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
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RegisterPage())),
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

  Future<void> _login() async {
    setState(() {
      _isloading = true; // Set loading indicator state to true
    });
  }
}
