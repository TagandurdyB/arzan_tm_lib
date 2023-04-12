// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:arzan_tm/data/models/theme_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';

abstract class HiveThemeLocalDataSource {
  ThemeModel? getHiveThemeMode();
  void saveHiveThemeMode(ThemeModel model);
}

class HiveThemeLocalDataSourceImpl implements HiveThemeLocalDataSource {
  final myBase = Hive.box(Tags.hiveBase);

  @override
  ThemeModel? getHiveThemeMode() {
    try {
      final bool _isDark = myBase.get("isDark");
      final bool _isLight = myBase.get("isLight");
      final bool _isSystem = myBase.get("isSystem");
      return ThemeModel(
        isDark: _isDark,
        isLight: _isLight,
        isSystem: _isSystem,
      );
    } catch (err) {
      print("Error on Hive Theme get!!!");
      print("Error :$err");
      return null;
    }
  }

  @override
  void saveHiveThemeMode(ThemeModel model) {
    try {
      myBase.put("isDark", model.isDark);
      myBase.put("isLight", model.isLight);
      myBase.put("isSystem", model.isSystem);
    } catch (err) {
      print("Error on Hive Theme save!!!");
      print("Error :$err");
    }
  }
}
