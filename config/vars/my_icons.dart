import 'package:flutter/material.dart';

class IconsLight {
  static const Icon main = Icon(Icons.home);
  Icon menu = const Icon(Icons.menu);
  Icon location = const Icon(Icons.location_on_outlined);
  Icon add = const Icon(Icons.add_box_outlined);
  Icon home = const Icon(Icons.home_filled);
  Icon profile = const Icon(Icons.assignment_ind_outlined);

  List<Icon> get navigationIcons => [menu, location, add, home, profile];
}

class IconsDark extends IconsLight {}
