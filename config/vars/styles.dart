// ignore_for_file: overridden_fields

import 'constants.dart';
import 'shadows.dart';
import 'package:flutter/material.dart';

class StylesLight {
  TextStyle appBar = const TextStyle(color: Colors.black);
  TextStyle avatar = const TextStyle(color: Colors.orange);

  TextStyle _site(double size) {
    return TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
        shadows: Shadows.text);
  }

  TextStyle get site => _site(Nums.site);
  TextStyle get siteSub => _site(Nums.siteSub);

}

class StylesDark extends StylesLight {
  @override
  TextStyle appBar = const TextStyle(color: Colors.white);
}
