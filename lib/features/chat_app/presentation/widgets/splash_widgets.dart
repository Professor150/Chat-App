import 'package:chat/core/utils/constants.dart';
import 'package:chat/features/chat_app/presentation/widgets/splash_privvacy_policy_text.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: fullWidth(context) * 0.1),
        normalText(
            text: 'Welcome to VuriloChat',
            fontWeight: FontWeight.bold,
            size: 30),
        SizedBox(
          height: fullHeight(context) * 0.10,
        ),
        Center(
          child: Container(
            height: fullHeight(context) * 0.4,
            width: fullWidth(context) * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              shape: BoxShape.circle,
            ),
            child: Image.asset(ImagePath.splashImage),
          ),
        ),
        SizedBox(
          height: fullHeight(context) * 0.03,
        ),
        PrivacyPolicyText(
          onPrivacyPolicyPressed: () {},
          onTermsOfServicePressed: () {},
        ),
        SizedBox(
          height: fullHeight(context) * 0.05,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Color(0xFFF2796B),
            fixedSize: Size(
              fullWidth(context) * 0.9,
              fullHeight(context) * 0.06,
            ),
          ),
          onPressed: () {},
          child: const Text(
            'AGREE AND CONTINUE',
          ),
        ),
        SizedBox(
          height: fullHeight(context) * 0.053,
        ),
        normalText(
          text: 'from',
          size: 17,
        ),
        SizedBox(
          height: fullHeight(context) * 0.001,
        ),
        normalText(
            text: 'VURILO',
            size: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.3),
      ],
    );
  }
}
