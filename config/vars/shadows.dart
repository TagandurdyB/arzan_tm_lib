import 'package:flutter/material.dart';

class Shadows {
  static List<BoxShadow> appBar = [
    BoxShadow(
        color: Colors.grey[800]!,
        offset: const Offset(0, 5),
        blurRadius: 10,
        spreadRadius: 0.5)
  ];
  static List<BoxShadow> all = [
    BoxShadow(color: Colors.grey[800]!, blurRadius: 10, spreadRadius: 0.5)
  ];
  static List<BoxShadow> text = [
    const BoxShadow(
        color: Colors.black,
        offset: Offset(0, 3),
        blurRadius: 4,
        spreadRadius: 0.5)
  ];
}

class ShadowsDark extends Shadows {
  @override
  static List<BoxShadow> appBar = [
    BoxShadow(
        color: Colors.grey[600]!,
        offset: const Offset(0, 5),
        blurRadius: 10,
        spreadRadius: 0.5)
  ];
  @override
  static List<BoxShadow> all = [
    BoxShadow(color: Colors.grey[600]!, blurRadius: 10, spreadRadius: 0.5)
  ];
}
