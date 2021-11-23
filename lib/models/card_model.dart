import 'package:flutter/material.dart';

class CardModel {
  String weekday;
  String date;
  int max;
  int min;
  IconData? icon;
  String description;

  CardModel({
    Key? key,
    required this.weekday,
    required this.date,
    required this.max,
    required this.min,
    required this.icon,
    required this.description,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return Text();
  // }
}
