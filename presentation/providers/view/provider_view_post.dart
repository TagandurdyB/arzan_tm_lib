import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostP extends ChangeNotifier {
  List<String> _images = [];
  List<String> get imgPaths => _images;

  void addImgPath(String path) {
    _images.add(path);
    notifyListeners();
  }

  void addImgsPath(List<String> paths) {
    final int fullLength = _images.length + paths.length;
    if (fullLength <= 8) {
      _images.addAll(paths);
    } else {
      _images = List.generate(8, (index) => (_images + paths)[index]);
    }
    // if(_images.length<=8){
    // _images.addAll(paths);
    // }else{

    // }
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

  int _categoryId = 0;
  int get categoryId => _categoryId;
  void changeCategory(int id) {
    _categoryId = id;
    notifyListeners();
  }

  int _subCategoryId = 0;
  int get subCategoryId => _subCategoryId;
  void changeSubId(int id) {
    _subCategoryId = id;
    notifyListeners();
  }

  List<String> tags = [];
  void addTag(String tag) {
    tags.add(tag);
    notifyListeners();
  }

  void removeTag(int index) {
    tags.removeAt(index);
    notifyListeners();
  }

  bool _isPhone = true;
  bool get isPhone => _isPhone;
  void changePhone(bool phone) {
    _isPhone = phone;
    notifyListeners();
  }

  bool _isDate = false;
  bool get isDate => _isDate;
  void changeIsDate(bool isDate) {
    _isDate = isDate;
    notifyListeners();
  }

  bool _isReaded = false;
  bool get isReaded => _isReaded;
  void changeReader(bool reader) {
    _isReaded = reader;
    notifyListeners();
  }

  static PostP of(BuildContext context, {bool listen = true}) =>
      Provider.of<PostP>(context, listen: listen);
}
