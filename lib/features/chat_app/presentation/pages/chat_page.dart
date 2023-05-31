import 'dart:io';

import 'package:chat/core/constants/constants.dart';
import 'package:chat/features/chat_app/data/models/chat_message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chat/core/constants/firestore_constants.dart';
import 'package:chat/features/chat_app/data/models/chat_page_arguments_model.dart';
import 'package:chat/features/chat_app/presentation/provider/auth_provider.dart';
import 'package:chat/features/chat_app/presentation/provider/chat_provider.dart';
import 'package:chat/features/chat_app/presentation/widgets/chat_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final AuthProvider authProvider = context.read<AuthProvider>();
  late final String currentUserId;
  UserChat? userChat;
  DocumentSnapshot? document;
  @override
  void initState() {
    super.initState();
    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
      userChat = UserChat.fromDocument(document!);
      if (userChat!.id == currentUserId) {}
    } else {
      Navigator.pushNamed(context, 'loginPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChatPageWidget(
        arguments: ChatPageArguments(
            peerId: userChat!.id,
            peerAvatar: userChat!.photoUrl,
            peerName: userChat!.name));
  }
}
