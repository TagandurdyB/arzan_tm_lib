import '../repositories/hive_repository.dart';

class HiveCase {
  final HiveRepository repository;
  HiveCase(this.repository);

  bool? readBool(String tag) => repository.getBool(tag);

  void saveBool(bool? value, String tag) => repository.saveBool(value, tag);

  String? readStr(String tag) => repository.getStr(tag);

  void saveStr(String? value, String tag) => repository.saveStr(value, tag);

  int? readInt(String tag) => repository.getInt(tag);

  void saveInt(int? value, String tag) => repository.saveInt(value, tag);
}
