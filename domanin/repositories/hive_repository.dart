abstract class HiveRepository {
  bool? getBool(String tag);
  void saveBool(bool value, String tag);
  String? getStr(String tag);
  void saveStr(String value, String tag);
}
