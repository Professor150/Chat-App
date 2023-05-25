import 'package:chat/core/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatPageWidget extends StatefulWidget {
  const ChatPageWidget({super.key});

  @override
  State<ChatPageWidget> createState() => _ChatPageWidgetState();
}

class _ChatPageWidgetState extends State<ChatPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparentBackgroundColor,
      child: Column(children: [
        Container(
          height: fullHeight(context) * 0.1,
          width: fullWidth(context),
          color: AppColors.backgroundColor,
          child: Padding(
            padding: edgeInsetsAll(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  ImagePath.vurilo,
                ),
                Spacer(),
                Text(
                  'Name',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.info),
              ],
            ),
          ),
        ),
        Container(
          height: fullHeight(context) * .75,
          width: fullWidth(context),
          color: AppColors.darkgrey,
          child: Text('AA'),
        ),
        Container(
          color: AppColors.lightBlue,
          height: fullHeight(context) * .1,
        )
      ]),
    );
  }
}
