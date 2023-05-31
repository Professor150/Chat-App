import 'package:flutter/material.dart';

class ChatListProvider extends ChangeNotifier {
  int _limit = 20; // Initial limit value
  int _limitIncrement = 20;

  int get limit => _limit;
  ScrollController listScrollController = ScrollController();

  void increaseLimit() {
    _limit += _limitIncrement;
    notifyListeners();
  }

  scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      increaseLimit();
      notifyListeners();
    }
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
    super.addListener(listener);
    listScrollController.addListener(scrollListener);
  }
}
