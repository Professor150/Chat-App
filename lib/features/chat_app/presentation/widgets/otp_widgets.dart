import 'package:chat/core/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OptWidget extends StatelessWidget {
  final VoidCallback whatisMyNumber;
  OptWidget({required this.whatisMyNumber});

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
        // SizedBox(
        //   height: fullHeight(context) * 0.5,
        // ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize:
                Size(fullHeight(context) * 0.2, fullHeight(context) * 0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: const Color(0xFFF2796B),
          ),
          onPressed: () {},
          child: normalText(
            text: 'Next',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
   // body: Column(
      //   children: [
      //     Flexible(
      //       child: ListView.builder(
      //         itemCount: 10,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             child: ListTile(
      //               title: normalText(text: 'Name'),
      //               leading: Image.asset(
      //                 ImagePath.vurilo,
      //               ),
      //               trailing: normalText(text: '${DateTime.now()}'),
      //             ),
      //           );
      //         },
      //       ),
      //     )
      //   ],
      // ),