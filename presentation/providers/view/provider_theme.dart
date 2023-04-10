import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeP extends ChangeNotifier {
  bool _isSystem = true;
  bool get isSystem => _isSystem;

  bool _isLight = true;
  bool get isLight => _isLight;

  ThemeMode get mode => _isSystem
      ? ThemeMode.system
      : _isLight
          ? ThemeMode.light
          : ThemeMode.dark;

  static ThemeP of(BuildContext context, {listen = false}) =>
      Provider.of<ThemeP>(context, listen: listen);
}
