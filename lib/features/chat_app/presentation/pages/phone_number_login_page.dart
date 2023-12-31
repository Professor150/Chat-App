import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/otp_widgets.dart';
import 'package:flutter/material.dart';

class PhoneNumberLoginPage extends StatelessWidget {
  const PhoneNumberLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF59B6B0),
        title: normalText(
          text: 'Enter your phone number',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      backgroundColor: const Color(0xFF59B6B0),
      body: OptWidget(
        whatisMyNumber: () {},
      ),
    );
  }
}
