import 'package:chat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPInputField extends StatefulWidget {
  @override
  _OTPInputFieldState createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];

  final int numberOfFields =
      6; // Change this value according to your requirement

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < numberOfFields; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < numberOfFields; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    if (value.length == 1 && index < numberOfFields - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numberOfFields, (index) {
            return SizedBox(
              width: 40.0,
              height: 40.0,
              child: TextField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _onTextChanged(index, value);
                },
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: fullHeight(context) * 0.04,
        ),
        normalText(text: 'Enter 6-digit code'),
        SizedBox(
          height: fullHeight(context) * 0.02,
        ),
        normalText(
          text: "Didn't receive code ? ",
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        normalText(
          text: "You may request a new code in 1:40 ",
          fontWeight: FontWeight.w500,
          size: 16,
        ),
      ],
    );
  }
}
