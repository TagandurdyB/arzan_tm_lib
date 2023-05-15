import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostP extends ChangeNotifier {
  final List<String> _images = [];
  List<String> get imgPaths => _images;

  void addImgPath(String path) {
    _images.add(path);
    notifyListeners();
  }

  void deleteImgPath(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  int get imgsLength => _images.length;

  File imgFileAt(index) => File(_images[index]);
  String imgPathAt(index) => _images[index];

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  void changeStart(DateTime date) {
    _startDate = date;
    _dateSorter;
    notifyListeners();
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  void changeEnd(DateTime date) {
    _endDate = date;
    _dateSorter;
    notifyListeners();
  }

  void get _dateSorter {
    if (_startDate != null && _endDate != null) {
      if (_endDate!.difference(_startDate!).inDays < 1) {
        _endDate = _startDate!.add(const Duration(days: 1));
      }
    }
    notifyListeners();
  }

  static PostP of(BuildContext context, {bool listen = true}) =>
      Provider.of<PostP>(context, listen: listen);
}