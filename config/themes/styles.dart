// ignore_for_file: overridden_fields

import '../vars/constants.dart';
import '../vars/shadows.dart';
import 'package:flutter/material.dart';

class StylesLight {
  TextStyle appBar = const TextStyle(color: Colors.black,fontWeight: FontWeight.bold);
  TextStyle avatar = const TextStyle(color: Colors.orange);
  TextStyle input = const TextStyle(color: Colors.purple);

  TextStyle _site(double size) {
    return TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.bold,
        shadows: ShadowsLight.text);
  }

  TextStyle get site => _site(Nums.site);
  TextStyle get siteSub => _site(Nums.siteSub);
}

class StylesDark extends StylesLight {
  @override
  TextStyle appBar = const TextStyle(color: Colors.white,fontWeight: FontWeight.bold);
}
