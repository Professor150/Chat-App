import 'package:chat/features/chat_app/presentation/provider/chat_provider/chat_provider.dart';
import 'package:chat/features/chat_app/presentation/widgets/chat_page_widget/item_widget.dart';
import 'package:chat/features/chat_app/presentation/widgets/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageListWidget extends StatefulWidget {
  final ScrollController listScrollController;
  final String groupChatId;
  final int limit;

  final String currentUserId;
  final Function(int) isLastMessageLeft;
  final Function(int) isLastMessageRight;
  final Function(List<QueryDocumentSnapshot>) listMessage;
  final String peerAvatar;
  MessageListWidget({
    super.key,
    required this.listScrollController,
    required this.groupChatId,
    required this.limit,
    required this.currentUserId,
    required this.isLastMessageLeft,
    required this.isLastMessageRight,
    required this.listMessage,
    required this.peerAvatar,
  });

  @override
  State<MessageListWidget> createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  late List<QueryDocumentSnapshot>? listMessage = [];
  late ChatProvider chatProvider =
      Provider.of<ChatProvider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: widget.groupChatId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream:
                  chatProvider.getChatStream(widget.groupChatId, widget.limit),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  listMessage = snapshot.data!.docs;
                  print("Messages are ${listMessage}");
                  print("${snapshot.data}");
                  if (listMessage!.isNotEmpty) {
                    print("List length is ${listMessage!.length}");
                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) => ItemWidget(
                          index: index,
                          document: snapshot.data?.docs[index],
                          currentUserId: widget.currentUserId,
                          isLastMessageLeft: widget.isLastMessageLeft,
                          isLastMessageRight: widget.isLastMessageRight,
                          peerAvatar: widget.peerAvatar,
                          listMessage: listMessage),
                      itemCount: snapshot.data?.docs.length,
                      reverse: true,
                      controller: widget.listScrollController,
                    );
                  } else {
                    return const Center(child: Text("No message here yet..."));
                  }
                } else {
                  return const LoadingViewCenter();
                }
              },
            )
          : const LoadingViewCenter(),
    );
  }
}
