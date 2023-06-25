// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:hive_flutter/hive_flutter.dart';

import '../../../config/vars/constants.dart';

abstract class HiveLocalDataSource {
  bool? getHiveBool(String tag);
  void saveHiveBool(bool? value, String tag);

  String? getHiveStr(String tag);
  void saveHiveStr(String? value, String tag);

  int? getHiveInt(String tag);
  void saveHiveInt(int? value, String tag);
}

class HiveLocalDataSourceImpl implements HiveLocalDataSource {
  final myBase = Hive.box(Tags.hiveBase);

  @override
  bool? getHiveBool(String tag) {
    try {
      final bool? _value = myBase.get(tag);
      print("$tag geted success!");
      return _value;
    } catch (err) {
      print("Error on Hive bool get!!! Tag:=$tag");
      print("Error :$err");
      return null;
    }
  }

  @override
  void saveHiveBool(bool? value, String tag) {
    try {
      myBase.put(tag, value);
      print("$tag savad success!");
    } catch (err) {
      print("Error on Hive bool save!!! Tag:=$tag");
      print("Error :$err");
    }
  }

  @override
  String? getHiveStr(String tag) {
    try {
      final String? _value = myBase.get(tag);
      print("$tag geted success!");
      return _value;
    } catch (err) {
      print("Error on Hive Str get!!! Tag:=$tag");
      print("Error :$err");
      return null;
    }
  }

  @override
  void saveHiveStr(String? value, String tag) {
    try {
      myBase.put(tag, value);
      print("$tag savad success!");
    } catch (err) {
      print("Error on Hive saveHiveStr save!!! Tag:=$tag");
      print("Error :$err");
    }
  }

  @override
  int? getHiveInt(String tag) {
    try {
      final int? _value = myBase.get(tag);
      print("$tag geted success!");
      return _value;
    } catch (err) {
      print("Error on Hive int get!!! Tag:=$tag");
      print("Error :$err");
      return null;
    }
  }

  @override
  void saveHiveInt(int? value, String tag) {
    try {
      myBase.put(tag, value);
      print("$tag savad success!");
    } catch (err) {
      print("Error on Hive saveHiveInt save!!! Tag:=$tag");
      print("Error :$err");
    }
  }
}
