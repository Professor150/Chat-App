import 'package:chat/features/chat_app/presentation/widgets/splash_widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF59B6B0),
      body: SafeArea(
        child: SplashWidget(),
      ),
    );
  }
}
