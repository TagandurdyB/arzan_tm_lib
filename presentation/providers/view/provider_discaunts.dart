import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountProvid extends ChangeNotifier {
  int _cloumnCount = 2;
  int get cloumnCount => _cloumnCount;
  void get tongleColumn {
    if (_cloumnCount < 3) {
      _cloumnCount++;
    } else {
      _cloumnCount = 1;
    }
    notifyListeners();
  }

  static DiscountProvid of(BuildContext context, {bool listen = true}) =>
      Provider.of<DiscountProvid>(context, listen: listen);
}
