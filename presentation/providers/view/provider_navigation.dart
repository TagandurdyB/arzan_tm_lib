import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderNav extends ChangeNotifier {
  int _selectScreen = 0;
  int get selectScreen => _selectScreen;
  void changeScreen(int index) {
    _selectScreen = index;
    notifyListeners();
  }

  bool _isSearch = false;
  bool get isSearch => _isSearch;
  void changeSearch(bool isS) {
    _isSearch = isS;
    notifyListeners();
  }

  Color _searchBg = Colors.black87;
  Color get searchBg => _searchBg;
  void changeSearchBg(Color col) {
    _searchBg = col;
    notifyListeners();
  }

  bool _isSaved = false;
  bool get isSaved => _isSaved;
  void changeSaved(bool isS) {
    _isSaved = isS;
    notifyListeners();
  }

  static ProviderNav of(BuildContext context, {bool listen = true}) =>
      Provider.of<ProviderNav>(context, listen: listen);
}
