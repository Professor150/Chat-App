import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/otp_input_widget.dart';
import 'package:flutter/material.dart';

class OptInputPage extends StatelessWidget {
  const OptInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF59B6B0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: normalText(text: 'Verifiying number', color: Colors.black),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: const OtpInputWidget(),
    );
  }
}
