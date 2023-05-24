import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const backgroundColor = Color(0xAA59B6B0);
  static const transparentBackgroundColor = Color(0xFF59B6B0);

  static const Color mainColor = Color(0xff2470c7);
  // static const Color primaryColor = Color(0xFF0D47A1);
  static const Color primaryColor = Color(0xffE65829);

  static const Color textColor = Color(0xFF3C4046);
  static const Color textLightColor = Color(0xFFACACAC);

  static const Color background = Color(0xFFF9F8FD);

  static const Color titleTextColor = Color(0xff1d2635);
  static const Color subTitleTextColor = Color(0xff797878);

  static const Color skyBlue = Color(0xff64b5f6);
  static const Color lightBlue = Color(0xFF6CA8F1);

  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);

  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellow = Color(0xfffbba01);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}

class ImagePath {
  static const String vurilo = 'assets/images/vurilo.png';
  static const String splashImage = 'assets/images/logo.png';
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

EdgeInsets edgeInsetsAll20() {
  return const EdgeInsets.all(20);
}

const labelStyle = TextStyle(
  color: AppColors.background,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
const hintTextStyle = TextStyle(
  color: AppColors.textColor,
  fontFamily: 'OpenSans',
);

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
