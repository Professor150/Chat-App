import 'package:chat/features/chat_app/data/models/chat_message_model.dart';
import 'package:chat/features/chat_app/data/models/chat_page_arguments_model.dart';
import 'package:chat/features/chat_app/presentation/pages/forgot_button_page.dart';
import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';
import 'package:chat/features/chat_app/presentation/pages/opt_page.dart';
import 'package:chat/features/chat_app/presentation/pages/page_not_found.dart';
import 'package:chat/features/chat_app/presentation/pages/phone_number_login_page.dart';
import 'package:chat/features/chat_app/presentation/pages/register_page.dart';
import 'package:chat/features/chat_app/presentation/pages/settings_page.dart';
import 'package:chat/features/chat_app/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  UserChat? userChat;
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case '/registerPage':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/phoneNumberLoginPage':
        return MaterialPageRoute(builder: (_) => const PhoneNumberLoginPage());
      case '/emailLinkLoginPage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/otpPage':
        return MaterialPageRoute(
            builder: (_) => const OptPage(
                  phoneNumber: '',
                  verficationCode: '',
                ));

      case '/homePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/settingsPage':
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      // case '/chatPage':
      //   return MaterialPageRoute(
      //       builder: (_) => ChatPage(
      //             arguments: ChatPageArguments(
      //               peerAvatar: userChat!.photoUrl,
      //               peerId: userChat!.id,
      //               peerName: userChat!.name,
      //             ),
      //           ));
      case '/forgot':
        return MaterialPageRoute(
            builder: (_) => ForgotButton(
                  emailController: TextEditingController(),
                ));

      default:
        return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
  }
}
