import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPageListProvider extends ChangeNotifier {
  int _limit = 20; // Initial limit value
  int _limitIncrement = 20;

  int get limit => _limit;
  ScrollController listScrollController = ScrollController();
  List<QueryDocumentSnapshot> listMessage = [];

  void increaseLimit() {
    _limit += _limitIncrement;
    notifyListeners();
  }

  scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      increaseLimit();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    super.addListener(listener);
    listScrollController.addListener(scrollListener);
  }
}
