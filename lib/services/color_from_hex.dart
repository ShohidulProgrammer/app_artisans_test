import 'package:flutter/material.dart';

Color colorFromHex(String hexColor) {
  final hexCode =
      hexColor.contains("#") ? hexColor.replaceAll('#', '') : hexColor;
  return Color(int.parse('FF$hexCode', radix: 16));
}


extension ColorX on Color {
  String toHexTriplet() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}