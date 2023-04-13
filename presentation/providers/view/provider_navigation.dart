import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderNavigation extends ChangeNotifier {
  int _selectScreen = 0;
  int get selectScreen => _selectScreen;
  void changeScreen(int index) {
    _selectScreen = index;
    notifyListeners();
  }

  static ProviderNavigation of(BuildContext context, {bool listen=true}) =>
      Provider.of<ProviderNavigation>(context, listen: listen);
}
