import '../repositories/hive_repository.dart';

class ThemeCase {
  final HiveThemeRepository repository;
  ThemeCase(this.repository);

  bool? read(String tag) => repository.getThemeMod(tag);

  void save(bool value,String tag) => repository.saveThemeMod(value,tag);
}
