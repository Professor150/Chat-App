import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/otp_input_code_widget.dart';
import 'package:flutter/material.dart';

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: 'Waiting to automatically detect an SMS sent to ',
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                  text: 'Input Number. ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: 'Wrong Number',
                  style: TextStyle(color: Colors.blue.shade900)),
            ],
          ),
        ),
        SizedBox(
          height: fullHeight(context) * 0.02,
        ),
        OTPInputField(),
      ],
    );
  }
}
