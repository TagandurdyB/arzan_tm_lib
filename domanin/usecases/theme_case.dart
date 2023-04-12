import 'package:arzan_tm/domanin/entities/theme_entity.dart';

import '../repositories/hive_repository.dart';

class ThemeCase {
  final HiveThemeRepository repository;
  ThemeCase(this.repository);

  ThemeEntity? read() => repository.getThemeMod();

  void save(ThemeEntity entity) => repository.saveThemeMod(entity);
}
