import '../../../domanin/entities/value_entity.dart';

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

  List<BanerEntity> mainBanners = [];
  List<BanerEntity> imgBanners = [];
  List<BanerEntity> videoBanners = [];

  // Future<bool> fillBanner(int welayat, int page) async {
  //   try {
  //     banners = await valuesCase.getBanners(welayat, page);
  //     notifyListeners();
  //     return true;
  //   } catch (err) {
  //     throw ("Error ValuesP>fillBanner: $err");
  //   }
  // }

  Future<List<BanerEntity>> getBanner(int welayat, int page) async {
    try {
      // banners = await valuesCase.getBanners(welayat, page);
      // return banners;
      final banner = await valuesCase.getBanners(welayat, page);
      switch (page) {
        case 1:
          mainBanners = banner;
          break;
        case 2:
          imgBanners = banner;
          break;
        case 3:
          videoBanners = banner;
          break;
        default:
      }
      return banner;
    } catch (err) {
      throw ("Error ValuesP>getBanner: $err");
    }
  }



  List<ValueEntity> videoCategories = [];

  Future<void> fillVideoCategories() async {
    try {
      videoCategories = await valuesCase.getVideoCategories();
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error VideoDataP>fillVideoCategories(): $err");
    }
  }

    List<ValueEntity> imgCategories = [];

  void fillImgCategories() async {
    try {
      imgCategories = await valuesCase.getImgCategories();
      // fillSubs();
      notifyListeners();
    } catch (err) {
      throw ("Error VideoDataP>fillImgCategories(): $err");
    }
  }
  // void changeBanner(List<BanerEntity> banner) {
  //   banners = banner;
  //   notifyListeners();
  // }

  List<ValueEntity> locations = [];

  Future<void> fillLocations() async {
    try {
      print("here 0902390");
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
