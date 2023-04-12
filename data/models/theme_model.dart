// ignore_for_file: overridden_fields, annotate_overrides

import 'package:arzan_tm/domanin/entities/theme_entity.dart';

class ThemeModel extends ThemeEntity {
  final bool isLight;
  final bool isDark;
  final bool isSystem;
  ThemeModel({
    required this.isDark,
    required this.isSystem,
    required this.isLight,
  }) : super(
          isDark: isDark,
          isLight: isLight,
          isSystem: isSystem,
        );

  static ThemeModel empty() =>
      ThemeModel(isDark: false, isLight: false, isSystem: false);

  static ThemeModel fromEntety(ThemeEntity entity) => ThemeModel(
      isDark: entity.isDark,
      isLight: entity.isLight,
      isSystem: entity.isSystem);

  factory ThemeModel.frowJson(Map<String, dynamic> json) => ThemeModel(
        isDark: json["isDark"],
        isLight: json["isLight"],
        isSystem: json["isSystem"],
      );

  Map<String, dynamic> toJson() => {
        "isDark": isDark,
        "isLight": isLight,
        "isSystem": isSystem,
      };
}
