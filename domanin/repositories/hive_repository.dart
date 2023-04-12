import 'package:arzan_tm/domanin/entities/theme_entity.dart';

abstract class HiveThemeRepository {
  ThemeEntity? getThemeMod();
  void saveThemeMod(ThemeEntity entity);
}
