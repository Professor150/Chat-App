import 'package:chat/core/app_route/app_route.dart';
import 'package:chat/features/chat_app/domain/repositories/chat_repository.dart';
import 'package:chat/features/chat_app/presentation/pages/chat_page.dart';
import 'package:chat/features/chat_app/presentation/pages/home_page.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';

import 'package:chat/features/chat_app/presentation/pages/login_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatListRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const ChatPage();
            } else {
              return const LoginPage();
            }
          },
        ),
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
