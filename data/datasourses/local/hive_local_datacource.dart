// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';

abstract class HiveThemeLocalDataSource {
  bool? getHiveTheme(String tag);
  void saveHiveTheme(bool value, String tag);
}

class HiveThemeLocalDataSourceImpl implements HiveThemeLocalDataSource {
  final myBase = Hive.box(Tags.hiveTheme);

  @override
  bool? getHiveTheme(String tag) {
    try {
      final bool _value = myBase.get(tag);
      print("$tag geted success!");
      return _value;
    } catch (err) {
      print("Error on Hive Theme get!!!");
      print("Error :$err");
      return null;
    }
  }

  @override
  void saveHiveTheme(bool value, String tag) {
    try {
      myBase.put(tag, value);
      print("$tag savad success!");
    } catch (err) {
      print("Error on Hive Theme save!!!");
      print("Error :$err");
    }
  }
}
