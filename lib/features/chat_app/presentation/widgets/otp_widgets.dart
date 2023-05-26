import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/pages/opt_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OptWidget extends StatelessWidget {
  final VoidCallback whatisMyNumber;
  OptWidget({super.key, required this.whatisMyNumber});
  final TextEditingController _phoneNumberController =
      TextEditingController(text: '+9779761666132');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: fullHeight(context) * 0.02,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'VuriloChat will send an SMS message to veify your',
                ),
              ],
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: '        phone number. ',
              ),
              TextSpan(
                text: '  what\'s my number ? ',
                style: TextStyle(
                  color: Colors.blue.shade900,
                ),
                recognizer: TapGestureRecognizer()..onTap = whatisMyNumber,
              ),
            ],
          ),
        ),
        SizedBox(
          height: fullHeight(context) * 0.07,
        ),
        Container(
            height: fullHeight(context) * 0.1,
            width: fullWidth(context) * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: IntlPhoneField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              initialCountryCode: 'NP',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize:
                Size(fullHeight(context) * 0.2, fullHeight(context) * 0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: const Color(0xFFF2796B),
          ),
          onPressed: () async {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: _phoneNumberController.text,
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OptPage(
                              phoneNumber: _phoneNumberController.text,
                              verficationCode: verificationId,
                            )));
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
          },
          child: normalText(
            text: 'Next',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
