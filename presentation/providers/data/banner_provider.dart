import 'package:arzan_tm/data/datasourses/remote/api_banner.dart';

import '/domanin/entities/main_page/baner_entity.dart';
import '/domanin/usecases/banner_case.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class BannerP extends ChangeNotifier {
  final BannerCase bannerCase;
  BannerP({required this.bannerCase});

  // // MainPageEntity entity = MainPageEntity.empty;
  // MainPageEntity entity = MainPageEntity.frowJson(api);

  List<BanerEntity> baners =
      apiBanner.map((e) => BanerEntity.frowJson(e)).toList();

  Future<void> fillBanner(String welayat, String page) async {
    try {
      // baners = await bannerCase.get(welayat, page);
      print("+*+*${baners[1].img}");
      notifyListeners();
    } catch (err) {
      throw ("Error BannerP fillBanner: $err");
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
