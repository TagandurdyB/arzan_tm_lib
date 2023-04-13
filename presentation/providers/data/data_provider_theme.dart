// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:arzan_tm/config/vars/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domanin/usecases/theme_case.dart';

class DataThemeProvider extends ChangeNotifier {
  final ThemeCase getThemeModeCase;
  DataThemeProvider({required this.getThemeModeCase});

  bool _isSystem = true;
  bool get isSystem => _isSystem;
  void get getIsSystem {
    bool? read = _read(Tags.themeSystem);
    if (read == null) {
      changeSystem(true);
    } else {
      _isSystem = read;
    }
    notifyListeners();
  }

  bool _isLight = true;
  bool get isLight => _isLight;
  void get getIsLight {
    bool? read = _read(Tags.themeLight);
    if (read == null) {
      changeLight(true);
    } else {
      _isLight = read;
    }
    notifyListeners();
  }

  ThemeMode get mode => _isSystem
      ? ThemeMode.system
      : _isLight
          ? ThemeMode.light
          : ThemeMode.dark;

  void changeSystem(bool val) {
    _save(val, Tags.themeSystem);
    _isSystem = val;
    notifyListeners();
  }

  void changeLight(bool val) {
    _save(val, Tags.themeLight);
    _isLight = val;
    notifyListeners();
  }

  void get tongleSystem {
    try {
      _isSystem = !_isSystem;
      _save(_isSystem, Tags.themeSystem);
      notifyListeners();
    } catch (err) {
      print("Error on data Theme Provider tongleSystem:$err");
      notifyListeners();
    }
  }

  void get tongleLight {
    try {
      _isLight = !_isLight;
      _save(_isLight, Tags.themeLight);
      notifyListeners();
    } catch (err) {
      print("Error on data Theme Provider tongleMode:$err");
      notifyListeners();
    }
  }

  void _save(bool val, String tag) {
    getThemeModeCase.save(val, tag);
    notifyListeners();
  }

  bool? _read(String tag) => getThemeModeCase.read(tag);

  // void getTheme() {
  //   try {
  //     var mode = getThemeModeCase.read();
  //     print("Erro : $mode");
  //     _themeMode = mode!;
  //     notifyListeners();
  //   } catch (err) {
  //     print("Error on presentation provider Theme get!!!");
  //     print("Error :$err");
  //     notifyListeners();
  //   }
  // }

  // void save(ThemeEntity entity) {
  //   _themeMode = entity;
  //   getThemeModeCase.save(entity);
  //   notifyListeners();
  // }

  static DataThemeProvider of(BuildContext context, {listen = true}) =>
      Provider.of<DataThemeProvider>(context, listen: listen);
}
