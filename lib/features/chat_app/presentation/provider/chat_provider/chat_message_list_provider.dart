import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessageListProvider extends ChangeNotifier {
  List<QueryDocumentSnapshot> listMessage = [];

  Future<void> setMessageList(List<QueryDocumentSnapshot> messageList) async {
    listMessage = messageList;
  }
}
