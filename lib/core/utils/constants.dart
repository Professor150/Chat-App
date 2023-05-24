import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color(0xAA59B6B0);
  static const transparentBackgroundColor = Color(0xFF59B6B0);
}

class ImagePath {
  static const String vurilo = 'assets/images/vurilo.png';
}

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double headerHeight(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.1;
}

EdgeInsets edgeInsetsAll() {
  return const EdgeInsets.all(12);
}
