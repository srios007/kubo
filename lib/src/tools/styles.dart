import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static const TextStyle welcomeTitleStyle = TextStyle(
    color: Palette.kuboColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle welcomeSubtitleStyle = TextStyle(
    color: Palette.kuboColor,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    color: Palette.kuboColor,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle activeButtonStyle = TextStyle(
    fontSize: 16,
    color: Palette.white,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle normalLabelStyle = TextStyle(
    color: Palette.black,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle hintStyle = TextStyle(
    color: Color(0xFFB1B1B1),
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );


  static const TextStyle laterTitleStyle = TextStyle(
    color: Palette.laterColor,
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle homeTitleStyle = TextStyle(
    color: Palette.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle gridViewStyle1 = TextStyle(
    color: Palette.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle gridViewStyle2 = TextStyle(
    color: Colors.red,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.lineThrough,
    decorationColor: Colors.red,
  );
  static const TextStyle gridViewStyle3 = TextStyle(
    color: Palette.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
    static const TextStyle discountStyle = TextStyle(
    color: Palette.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
      static const TextStyle roResultTitleStyle = TextStyle(
    color: Palette.black,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
      static const TextStyle noResultLabelStyle = TextStyle(
    color: Palette.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
}
