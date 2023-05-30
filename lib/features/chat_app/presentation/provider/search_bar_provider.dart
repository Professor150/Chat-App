import 'dart:async';

import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  bool _isClearButtonVisible = false;

  bool get isClearButtonVisible => _isClearButtonVisible;

  Stream<bool> get btnClearStream => _btnClearController.stream;

  final _btnClearController = StreamController<bool>.broadcast();

  void showClearButton() {
    if (!_isClearButtonVisible) {
      _isClearButtonVisible = true;
      _btnClearController.add(true);
      notifyListeners();
    }
  }

  void hideClearButton() {
    if (_isClearButtonVisible) {
      _isClearButtonVisible = false;
      _btnClearController.add(false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _btnClearController.close();
    super.dispose();
  }
}
