// ignore_for_file: avoid_print

import 'package:arzan_tm/domanin/entities/theme_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domanin/usecases/theme_case.dart';

class DataThemeProvider extends ChangeNotifier {
  final ThemeCase getThemeModeCase;
  DataThemeProvider({required this.getThemeModeCase});

  ThemeEntity _themeMode = ThemeEntity.empty();
  ThemeEntity get entity => _themeMode;

  void getTheme() {
    try {
      var mode = getThemeModeCase.read();
      print("Erro : $mode");
      _themeMode = mode!;
      notifyListeners();
    } catch (err) {
      print("Error on presentation provider Theme get!!!");
      print("Error :$err");
      notifyListeners();
    }
  }

  void save(ThemeEntity entity) {
    _themeMode = entity;
    getThemeModeCase.save(entity);
    notifyListeners();
  }

  static DataThemeProvider of(BuildContext context, {listen = true}) =>
      Provider.of<DataThemeProvider>(context, listen: listen);
}
