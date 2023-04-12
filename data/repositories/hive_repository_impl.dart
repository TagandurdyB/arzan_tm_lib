// ignore_for_file: avoid_print

import 'package:arzan_tm/data/models/theme_model.dart';

import '../../domanin/entities/theme_entity.dart';
import '../../domanin/repositories/hive_repository.dart';
import '../datasourses/local/hive_local_datacource.dart';

class HiveThemeRepositoryImpl implements HiveThemeRepository {
  final HiveThemeLocalDataSource hiveThemeLocalDataSource;

  HiveThemeRepositoryImpl(this.hiveThemeLocalDataSource);

  @override
  ThemeEntity? getThemeMod() {
    try {
      final themeMode = hiveThemeLocalDataSource.getHiveThemeMode();
      return themeMode;
    } catch (err) {
      print("Error on data repository Theme get!!!");
      print("Error :$err");
    }
    return null;
  }

  @override
  void saveThemeMod(ThemeEntity entity) {
    try {
      final model = ThemeModel.fromEntety(entity);
      hiveThemeLocalDataSource.saveHiveThemeMode(model);
    } catch (err) {
      print("Error on data repository Theme save!!!");
      print("Error :$err");
    }
  }
}
