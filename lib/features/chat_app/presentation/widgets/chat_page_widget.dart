import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({super.key});

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparentBackgroundColor,
      child: Column(children: [
        Container(
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ));
                  },
                  child: const Text('Login Page'),
                ),
                const Spacer(),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                const Icon(Icons.info),
              ],
            ),
          ),
        ),
        Container(
          height: fullHeight(context) * .75,
          width: fullWidth(context),
          color: AppColors.transparentBackgroundColor,
          child: const Text('AA'),
        ),
        Container(
          color: AppColors.iconColor,
          height: fullHeight(context) * .1,
        ),
      ]),
    );
  }
}
