import 'package:chat/core/app_route/app_route.dart';
import 'package:chat/core/utils/global_variables.dart';
import 'package:chat/features/chat_app/data/models/profile_model.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_list_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_message_list_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/home_page_provider.dart';

import 'package:chat/features/chat_app/presentation/widgets/homepage_bottom_nav_bar_widget.dart';

import 'package:chat/features/chat_app/presentation/provider/search_bar_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({super.key, required this.sharedPreferences});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
                firebaseAuth: fAuth,
                firebaseFirestore: firebaseFirestore,
                sharedPreferences: sharedPreferences)),
        ChangeNotifierProvider(create: (_) => SearchBarProvider()),
        ChangeNotifierProvider(create: (_) => ChatListProvider()),
        ChangeNotifierProvider(create: (_) => ChatMessageListProvider()),
        Provider<HomePageProvider>(
            create: (_) =>
                HomePageProvider(firebaseFirestore: firebaseFirestore)),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        Provider(
            create: (_) => ChatProvider(
                firebaseFirestore: firebaseFirestore,
                prefs: sharedPreferences,
                firebaseStorage: firebaseStorage)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (firebaseUser != null) {
              return CustomBottomNavigationBar();
            } else {
              return const LoginPage();
            }
          },
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
