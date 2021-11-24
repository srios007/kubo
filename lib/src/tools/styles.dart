import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static TextStyle welcomeTitleStyle = TextStyle(
    color: Palette.kuboColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle welcomeSubtitleStyle = TextStyle(
    color: Palette.kuboColor,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: Palette.kuboColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle activeButtonStyle = TextStyle(
    fontSize: 16,
    color: Palette.white,
    fontWeight: FontWeight.w600,
  );
  static TextStyle normalLabelStyle = TextStyle(
    color: Palette.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  static TextStyle hintStyle = TextStyle(
    color: Color(0xFFB1B1B1),
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );


  static TextStyle laterTitleStyle = TextStyle(
    color: Palette.laterColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle homeTitleStyle = TextStyle(
    color: Palette.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle gridViewStyle1 = TextStyle(
    color: Palette.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle gridViewStyle2 = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.red,
  );
  static TextStyle gridViewStyle3 = TextStyle(
    color: Palette.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
    static TextStyle discountStyle = TextStyle(
    color: Palette.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
