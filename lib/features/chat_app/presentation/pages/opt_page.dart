import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/pages/phone_number_login_page.dart';
import 'package:chat/features/chat_app/presentation/widgets/otp_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptPage extends StatelessWidget {
  final String phoneNumber;
  final String verficationCode;
  const OptPage(
      {super.key, required this.phoneNumber, required this.verficationCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF59B6B0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: normalText(text: 'Verifiying number', color: Colors.black),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: OtpInputWidget(
        verficationCode: verficationCode,
        wrongNumber: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PhoneNumberLoginPage()),
        ),
      ),
    );
  }
}
