import '/config/vars/shadows.dart';

import '../../../config/themes/colors.dart';
import '../../../config/vars/my_icons.dart';
import '../../../config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeP extends ChangeNotifier {
  bool _isSystem = true;
  bool get isSystem => _isSystem;
  // void tongleThemeMode(BuildContext context) {
  //   _isSystem = !_isSystem;
  //   if (_isSystem) {
  //     Brightness brightness = MediaQuery.of(context).platformBrightness;
  //     _isLight = brightness == Brightness.light;
  //   }
  //   MyOrientation.systemNavigationBarMode(_isLight);
  //   notifyListeners();
  // }

  bool _isLight = true;
  bool get isLight => _isLight;

  // void tongleTheme() {
  //   _isLight = !_isLight;
  //   MyOrientation.systemNavigationBarMode(_isLight);
  //   notifyListeners();
  // }

  // void changeTheme(bool isLight) {
  //   _isLight = isLight;
  //   MyOrientation.systemNavigationBarMode(_isLight);
  //   notifyListeners();
  // }



  StylesLight get styles => _isLight ? StylesLight() : StylesLight();
  ColorsLight get colors => _isLight ? ColorsLight() : ColorsDark();
  IconsLight get icons => _isLight ? IconsLight() : IconsDark();
  ShadowsLight get shadows => _isLight ? ShadowsLight() : ShadowsDark();

  static ThemeP of(BuildContext context, {listen = false}) =>
      Provider.of<ThemeP>(context, listen: listen);
}
