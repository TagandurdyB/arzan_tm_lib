import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoveryP extends ChangeNotifier {
  int _selectedTabBatIndex = 0;
  int get index => _selectedTabBatIndex;
  void get nextPage {
    if (_selectedTabBatIndex < 2) _selectedTabBatIndex++;
    notifyListeners();
  }

  void get backPage {
    if (_selectedTabBatIndex > 0) _selectedTabBatIndex++;
    notifyListeners();
  }

  void get resetPage {
    _selectedTabBatIndex = 0;
    notifyListeners();
  }

  static RecoveryP of(BuildContext context, {bool listen = true}) =>
      Provider.of<RecoveryP>(context, listen: listen);
}
