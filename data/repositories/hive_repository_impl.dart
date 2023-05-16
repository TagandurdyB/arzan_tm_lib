// ignore_for_file: avoid_print

import '../../domanin/repositories/hive_repository.dart';
import '../datasourses/local/hive_local_datacource.dart';

class HiveRepositoryImpl implements HiveRepository {
  final HiveLocalDataSource hiveThemeLocalDataSource;

  HiveRepositoryImpl(this.hiveThemeLocalDataSource);

  @override
  bool? getBool(String tag) {
    try {
      final bool? themeMode = hiveThemeLocalDataSource.getHiveBool(tag);
      return themeMode;
    } catch (err) {
      print("Error on data repository Theme get!!!");
      print("Error :$err");
    }
    return null;
  }

  @override
  void saveBool(bool value, String tag) {
    try {
      hiveThemeLocalDataSource.saveHiveBool(value, tag);
    } catch (err) {
      print("Error on data repository Theme save!!!");
      print("Error :$err");
    }
  }

  @override
  String? getStr(String tag) {
    try {
      final String? localVar = hiveThemeLocalDataSource.getHiveStr(tag);
      return localVar;
    } catch (err) {
      print("Error on data repository Hive getStr!!!");
      print("Error :$err");
    }
    return null;
  }

  @override
  void saveStr(String value, String tag) {
    try {
      hiveThemeLocalDataSource.saveHiveStr(value, tag);
    } catch (err) {
      print("Error on data repository Hive saveStr!!!");
      print("Error :$err");
    }
  }
}
