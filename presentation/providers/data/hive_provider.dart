import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domanin/usecases/hive_case.dart';

class HiveP extends ChangeNotifier {
  final HiveCase getHiveCase;
  HiveP({required this.getHiveCase});

  void saveStr(String val, String tag) {
    getHiveCase.saveStr(val, tag);
    notifyListeners();
  }

  String? readStr(String tag) => getHiveCase.readStr(tag);

  void saveBool(bool val, String tag) {
    getHiveCase.saveBool(val, tag);
    notifyListeners();
  }

  bool? readBool(String tag) => getHiveCase.readBool(tag);

  static HiveP of(BuildContext context, {bool listen = true}) =>
      Provider.of<HiveP>(context, listen: listen);
}
