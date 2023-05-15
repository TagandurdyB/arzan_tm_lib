import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscountProvid extends ChangeNotifier {
  // bool _scaleVisible = true;
  // bool get scaleVisible => _scaleVisible;

  int _cloumnCount = 2;
  int get cloumnCount => _cloumnCount;
  void get tongleColumn {
    // _minScale();
    // maxScale;
    if (_cloumnCount < 3) {
      _cloumnCount++;
    } else {
      _cloumnCount = 1;
    }
    notifyListeners();
  }

  // void _minScale() {
  //   _scaleVisible = false;
  //   notifyListeners();
  // }

  // void get maxScale {
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     _scaleVisible = true;
  //     if (_cloumnCount < 3) {
  //       _cloumnCount++;
  //     } else {
  //       _cloumnCount = 1;
  //     }
  //     notifyListeners();
  //   });
  // }

  static DiscountProvid of(BuildContext context, {bool listen = true}) =>
      Provider.of<DiscountProvid>(context, listen: listen);
}
