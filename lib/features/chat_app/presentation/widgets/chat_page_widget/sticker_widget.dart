import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_provider.dart';
import 'package:flutter/material.dart';

class StickerWidget extends StatefulWidget {
  final Function(String, int) onSendMessage;
  const StickerWidget({super.key, required this.onSendMessage});

  @override
  State<StickerWidget> createState() => _StickerWidgetState();
}

class _StickerWidgetState extends State<StickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.grey, width: 0.5)),
            color: Colors.white),
        padding: const EdgeInsets.all(5),
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('a', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/a.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('b', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/b.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('c', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/c.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('d', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/d.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('e', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/e.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('f', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/f.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('g', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/g.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('h', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/h.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      widget.onSendMessage('i', TypeMessage.sticker),
                  child: Image.asset(
                    'assets/images/gif/i.gif',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
