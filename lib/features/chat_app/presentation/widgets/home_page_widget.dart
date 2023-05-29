import 'package:chat/features/chat_app/data/models/logout_model.dart';
import 'package:flutter/material.dart';
import 'package:chat/core/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeight(context) * 0.1,
      width: fullWidth(context),
      color: AppColors.backgroundColor,
      child: Padding(
        padding: edgeInsetsAll(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.vurilo,
            ),
            const Spacer(),
            const Text(
              'Recent Chat',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            const SizedBox(
              width: 4,
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageChatBoxWidget extends StatelessWidget {
  const HomePageChatBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePageChatWidget extends StatelessWidget {
  final String name;
  final String time;
  const HomePageChatWidget({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight(context),
      width: fullWidth(context),
      color: AppColors.transparentBackgroundColor,
      child: Padding(
        padding: edgeInsetsAll(),
        child: Row(
          children: [
            Image.asset(
              ImagePath.vurilo,
            ),
            SizedBox(
              width: fullWidth(context) * .05,
            ),
            Text(
              '$name',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: fullWidth(context) * .50,
            ),
            Text(
              '$time',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
