import 'package:provider/provider.dart';

import '/domanin/entities/main_page/main_page_entity.dart';
import 'package:flutter/material.dart';

import '../../../domanin/usecases/main_page_case.dart';

class MainPageP extends ChangeNotifier {
  final MainPageCase mainPageCase;
  MainPageP({required this.mainPageCase});

  MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  Future<void> fillEntity() async {
    try {
      entity = await mainPageCase.get();
      notifyListeners();
    } catch (err) {
      throw ("Error MainPageP: $err");
    }
  }

  static MainPageP of(BuildContext context, {bool listen = true}) =>
      Provider.of<MainPageP>(context, listen: listen);
}
