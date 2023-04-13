import 'package:flutter/material.dart';

class IconsLight {
  Icon menu = const Icon(Icons.menu);
  Icon location = const Icon(Icons.location_on_outlined);

  Icon home = const Icon(Icons.home_filled);
  Icon widget = const Icon(Icons.widgets_outlined);
  Icon add = const Icon(Icons.add_box_outlined);
  Icon wallet = const Icon(Icons.wallet);
  Icon profile = const Icon(Icons.assignment_ind_outlined);

  List<Icon> get navigationIcons => [home, widget, add, wallet, profile];
}

class IconsDark extends IconsLight {}
