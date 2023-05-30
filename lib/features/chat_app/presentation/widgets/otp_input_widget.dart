import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/otp_input_code_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInputWidget extends StatelessWidget {
  const OtpInputWidget(
      {super.key, required this.wrongNumber, required this.verficationCode});
  final VoidCallback wrongNumber;

  final String verficationCode;

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
                style: const TextStyle(
                  color: Color(0xFFF2796B),
                ),
                recognizer: TapGestureRecognizer()..onTap = wrongNumber,
              ),
            ],
          ),
        ),
        SizedBox(
          height: fullHeight(context) * 0.02,
        ),
        // OTPInputField(),
        Pinput(
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          showCursor: true,
          length: 6,
          onCompleted: (pin) async {
            FirebaseAuth auth = FirebaseAuth.instance;
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verficationCode, smsCode: pin);
            final user = await auth.signInWithCredential(credential);
            print(user);
          },
        ),
      ],
    );
  }
}
