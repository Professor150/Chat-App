import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const backgroundColor = Color(0xAA59B6B0);
  static const transparentBackgroundColor = Color(0xFF59B6B0);
}

class ImagePath {
  static const String vurilo = 'assets/images/vurilo.png';
  final String splashImage =
      'https://uploads-ssl.webflow.com/642ba0e2773549a33b554a68/642bac2629d21641919eb836_vurilo_logo.png';
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

Widget normalText({
  String? text,
  Color? color,
  double? size,
  FontWeight? fontWeight,
  double? letterSpacing,
  String? fontFamily,
}) {
  return Text(
    text!,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      fontFamily: GoogleFonts.openSans().fontFamily,
    ),
  );
}
