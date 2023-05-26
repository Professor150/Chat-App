import 'package:chat/core/app_route/app_route.dart';
import 'package:chat/features/chat_app/domain/repositories/chat_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;

  // Check if the user is already signed in
  if (auth.currentUser != null) {
    // User is signed in
    print('User is signed in: ${auth.currentUser?.uid}');
  } else {
    // User is not signed in
    print('User is not signed in');
  }
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
      child: const MaterialApp(
        title: 'Chat App',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
