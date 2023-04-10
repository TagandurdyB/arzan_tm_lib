// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class StylesLight {
  TextStyle appBar = const TextStyle(color: Colors.black);
}

class StylesDark extends StylesLight {
  @override
  TextStyle appBar = const TextStyle(color: Colors.white);
}
