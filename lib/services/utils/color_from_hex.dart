import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  final hexCode =
      hexColor.contains("#") ? hexColor.replaceAll('#', '') : hexColor;
  return Color(int.parse('FF$hexCode', radix: 16));
}
