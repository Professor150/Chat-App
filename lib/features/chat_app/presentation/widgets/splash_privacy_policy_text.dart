import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyText extends StatelessWidget {
  final VoidCallback onPrivacyPolicyPressed;
  final VoidCallback onTermsOfServicePressed;

  const PrivacyPolicyText({
    super.key,
    required this.onPrivacyPolicyPressed,
    required this.onTermsOfServicePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: RichText(
            textScaleFactor: 1,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Read our ",
                  style: DefaultTextStyle.of(context).style,
                ),
                TextSpan(
                  text: "Privacy Policy. ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPrivacyPolicyPressed,
                ),
                TextSpan(
                  text: "Tap Agree and continue to",
                  style: DefaultTextStyle.of(context).style,
                ),
              ],
            ),
          ),
        ),
        RichText(
          textScaleFactor: 1,
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'accept the',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '  Terms of Service.',
                style: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = onTermsOfServicePressed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
