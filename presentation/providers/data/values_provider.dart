import '/domanin/entities/location_entity.dart';

import '../../../domanin/entities/baner_entity.dart';
import '../../../domanin/usecases/values_case.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class ValuesP extends ChangeNotifier {
  final ValuesCase valuesCase;
  ValuesP({required this.valuesCase});

  // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  // List<BanerEntity> baners =
  //     apiBanner.map((e) => BanerEntity.frowJson(e)).toList();

  List<BanerEntity> banners = [];

  Future<void> fillBanner(String welayat, String page) async {
    try {
      banners = await valuesCase.getBanners(welayat, page);
      notifyListeners();
    } catch (err) {
      throw ("Error ValuesP>fillBanner: $err");
    }
  }

  List<LocationEntity> locations = [];

  Future<void> fillLocations() async {
    try {
      locations = await valuesCase.getLocation();
      notifyListeners();
    } catch (err) {
      throw ("Error ValuesP>fillLocations: $err");
    }
  }

  // Future<void> fillEntity() async {
  //   // try {
  //   //   entity = await mainPageCase.get();
  //   //   notifyListeners();
  //   // } catch (err) {
  //   //   throw ("Error MainPageP: $err");
  //   // }
  // }

  static ValuesP of(BuildContext context, {bool listen = true}) =>
      Provider.of<ValuesP>(context, listen: listen);
}
