import '/config/vars/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeP extends ChangeNotifier {
  bool _isSystem = true;
  bool get isSystem => _isSystem;
  void tongleThemeMode(BuildContext context) {
    _isSystem = !_isSystem;
    if (_isSystem) {
      Brightness brightness = MediaQuery.of(context).platformBrightness;
      _isLight = brightness == Brightness.light;
    }
    notifyListeners();
  }

  bool _isLight = true;
  bool get isLight => _isLight;
  void tongleTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }

  ThemeMode get mode => _isSystem
      ? ThemeMode.system
      : _isLight
          ? ThemeMode.light
          : ThemeMode.dark;

  StylesLight get styles => _isLight ? StylesLight() : StylesLight();

  static ThemeP of(BuildContext context, {listen = false}) =>
      Provider.of<ThemeP>(context, listen: listen);
}
