import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_provider.dart';
import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String, int) onSendMessage;
  final Function() getSticker;
  final Function() getImage;
  final FocusNode focusNode;

  ChatInputWidget(
      {super.key,
      required this.textEditingController,
      required this.onSendMessage,
      required this.getSticker,
      required this.getImage,
      required this.focusNode});

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.grey, width: 0.5)),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.image),
                onPressed: () => widget.getImage(),
                color: AppColors.backgroundColor,
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.face),
                onPressed: () => widget.getSticker(),
                color: AppColors.backgroundColor,
              ),
            ),
          ),

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                onSubmitted: (value) {
                  widget.onSendMessage(
                      widget.textEditingController.text, TypeMessage.text);
                },
                style: const TextStyle(
                    color: AppColors.backgroundColor, fontSize: 15),
                controller: widget.textEditingController,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: AppColors.backgroundColor),
                ),
                focusNode: widget.focusNode,
                autofocus: true,
              ),
            ),
          ),

          // Button send message
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => widget.onSendMessage(
                    widget.textEditingController.text, TypeMessage.text),
                color: AppColors.backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
