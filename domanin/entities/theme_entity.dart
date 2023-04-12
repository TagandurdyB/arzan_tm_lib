class ThemeEntity {
  final bool isLight;
  final bool isDark;
  final bool isSystem;
  ThemeEntity({
    required this.isDark,
    required this.isSystem,
    required this.isLight,
  });

  static ThemeEntity empty() =>
      ThemeEntity(isDark: false, isLight: false, isSystem: false);
}
