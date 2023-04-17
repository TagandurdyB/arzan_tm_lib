import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcauntP extends ChangeNotifier {

  bool _isSign = false;
  bool get isSing => _isSign;

  void get logIn {
    _isSign = true;
    notifyListeners();
  }

  void get logOut {
    _isSign = false;
    notifyListeners();
  }

  static AcauntP of(BuildContext context, {bool listen = true}) =>
      Provider.of<AcauntP>(context, listen: listen);
}
