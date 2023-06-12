abstract class HiveRepository {
  bool? getBool(String tag);
  void saveBool(bool? value, String tag);
  String? getStr(String tag);
  void saveStr(String? value, String tag);
  int? getInt(String tag);
  void saveInt(int? value, String tag);
}
