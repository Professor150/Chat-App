import 'package:chat/features/chat_app/presentation/widgets/login_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/utils/constants.dart';
// import 'package:vurilo_chat/pages/authentication/register.dart';

class LoginScreen extends StatefulWidget {
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

  bool _obscureText = true;
  bool _isLogged = false;

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
            // validator: (value) {
            //   if (value.isEmpty) {
            //     String a = 'Email is required';
            //     return a;
            //   }
            //   return null;
            // },
            // onSaved: (input) => _email = input,
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
            // validator: (value) {
            //   if (value.isEmpty) {
            //     String a = 'Password is required';
            //     return a;
            //   }
            //   return null;
            // },
            // onSaved: (input) => _password = input,
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
        onPressed: () {},
        child: const Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
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
          const Text("Don't have an account?"),
          TextButton(
            onPressed: () {},
            // onPressed: () => Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => const RegisterPage())),
            child: const Text("Sign up",
                style: TextStyle(
                  color: Color(0xFFF2796B),
                  fontSize: 20,
                )),
          ),
        ],
      ),
    );
  }

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
                    vertical: 120.0,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(
                            //   width: 3,
                            // ),
                            Image.asset(
                              'assets/images/User.png',
                              height: size.height * 0.001,
                              width: size.width * 0.001,
                            ),
                          ],
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
