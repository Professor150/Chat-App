import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/page_not_found.dart';
import 'package:chat/features/chat_app/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/registerPage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/phoneNumberLoginPage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/emailLinkLoginPage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/otpPage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/chatPage':
        return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return MaterialPageRoute(builder: (_) => PageNotFound());
    }
  }
}
