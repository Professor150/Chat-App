import 'package:chat/core/app_route/app_route.dart';
import 'package:chat/features/chat_app/domain/repositories/chat_repository.dart';
import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';

import 'package:chat/features/chat_app/presentation/pages/login_page.dart';

import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/splash_page.dart';

import 'package:chat/features/chat_app/presentation/widgets/otp_input_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatListRepository()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
