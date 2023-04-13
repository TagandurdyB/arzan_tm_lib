// ignore_for_file: avoid_print

import '../../domanin/repositories/hive_repository.dart';
import '../datasourses/local/hive_local_datacource.dart';

class HiveThemeRepositoryImpl implements HiveThemeRepository {
  final HiveThemeLocalDataSource hiveThemeLocalDataSource;

  HiveThemeRepositoryImpl(this.hiveThemeLocalDataSource);

  @override
  bool? getThemeMod(String tag) {
    try {
      final bool? themeMode = hiveThemeLocalDataSource.getHiveTheme(tag);
      return themeMode;
    } catch (err) {
      print("Error on data repository Theme get!!!");
      print("Error :$err");
    }
    return null;
  }

  @override
  void saveThemeMod(bool value, String tag) {
    try {
      hiveThemeLocalDataSource.saveHiveTheme(value, tag);
    } catch (err) {
      print("Error on data repository Theme save!!!");
      print("Error :$err");
    }
  }
}
