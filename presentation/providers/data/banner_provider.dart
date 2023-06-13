import '../../../domanin/entities/baner_entity.dart';
import '/domanin/usecases/banner_case.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class BannerP extends ChangeNotifier {
  final BannerCase bannerCase;
  BannerP({required this.bannerCase});

  // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  // List<BanerEntity> baners =
  //     apiBanner.map((e) => BanerEntity.frowJson(e)).toList();

  List<BanerEntity> banners = [];

  Future<void> fillBanner(String welayat, String page) async {
    try {
      banners = await bannerCase.get(welayat, page);
      notifyListeners();
    } catch (err) {
      throw ("Error BannerP>fillBanner: $err");
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

  static BannerP of(BuildContext context, {bool listen = true}) =>
      Provider.of<BannerP>(context, listen: listen);
}
