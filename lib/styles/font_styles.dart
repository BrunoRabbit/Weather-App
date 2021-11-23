import 'package:flutter/material.dart';

class FontStyles {
  static TextStyle? defaultStyleBold(
      {double? fontSize = 16,
      Color? color = Colors.white,
      FontWeight? fontWeight = FontWeight.bold}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle? defaultStyleLight(
      {double? fontSize = 16,
      Color? color = Colors.white,
      FontWeight? fontWeight = FontWeight.w300}) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
    );
  }
}
