import 'package:chat/features/chat_app/presentation/pages/chat_page.dart';
import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';
import 'package:chat/features/chat_app/presentation/pages/opt_page.dart';
import 'package:chat/features/chat_app/presentation/pages/page_not_found.dart';
import 'package:chat/features/chat_app/presentation/pages/phone_number_login_page.dart';
import 'package:chat/features/chat_app/presentation/pages/register_page.dart';
import 'package:chat/features/chat_app/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/registerPage':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/phoneNumberLoginPage':
        return MaterialPageRoute(builder: (_) => const PhoneNumberLoginPage());
      case '/emailLinkLoginPage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/otpPage':
        return MaterialPageRoute(builder: (_) => const OptPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/chatPage':
        return MaterialPageRoute(builder: (_) => const ChatPage());

      default:
        return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
  }
}
