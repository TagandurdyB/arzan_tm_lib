// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/main_page_entity.dart';

import 'discount_model.dart';
import 'baner_model.dart';
import 'chosen_model.dart';
import 'main_page_card_model.dart';
import 'market_model.dart';

class MainPageModel extends MainPageEntity {
  @override
  final List<BanerModel> baners;
  @override
  final List<MarketModel> markets;
  @override
  final MainPageCardModel konkurs;
  @override
  final int saylanlarCount;
  @override
  final List<ChosenModel> saylananlarDatas;
  @override
  final MainPageCardModel top;
  @override
  final MainPageCardModel pictures;
  @override
  final MainPageCardModel videos;
  @override
  final MainPageCardModel resmiler;
  @override
  final int discountsCount;
  @override
  final List<DiscountModel> discountDatas;

  MainPageModel({
    required this.baners,
    required this.markets,
    required this.konkurs,
    required this.saylanlarCount,
    required this.saylananlarDatas,
    required this.top,
    required this.pictures,
    required this.videos,
    required this.resmiler,
    required this.discountsCount,
    required this.discountDatas,
  }) : super(
          baners: baners,
          markets: markets,
          konkurs: konkurs,
          saylanlarCount: saylanlarCount,
          saylananlarDatas: saylananlarDatas,
          top: top,
          pictures: pictures,
          videos: videos,
          resmiler: resmiler,
          discountsCount: discountsCount,
          discountDatas: discountDatas,
        );

  static MainPageModel get empty => MainPageModel(
        baners: [BanerModel.empty],
        markets: [MarketModel.empty],
        konkurs: MainPageCardModel.empty,
        saylanlarCount: 0,
        saylananlarDatas: [ChosenModel.empty],
        top: MainPageCardModel.empty,
        pictures: MainPageCardModel.empty,
        videos: MainPageCardModel.empty,
        resmiler: MainPageCardModel.empty,
        discountsCount: 0,
        discountDatas: [DiscountModel.empty],
      );

  factory MainPageModel.frowJson(Map<String, dynamic> json) {
    try {
      return MainPageModel(
        baners: BanerModel.fromJsonList(json["baners"]),
        markets: MarketModel.fromJsonList(json["markets"]),
        konkurs: MainPageCardModel.frowJson(json["kunkurs"]),
        saylanlarCount: json["saylananlar"]["count"],
        saylananlarDatas:
            ChosenModel.fromJsonList(json["saylananlar"]["datas"]),
        top: MainPageCardModel.frowJson(json["top"]),
        pictures: MainPageCardModel.frowJson(json["pictures"]),
        videos: MainPageCardModel.frowJson(json["videos"]),
        resmiler: MainPageCardModel.frowJson(json["resmiler"]),
        discountsCount: json["discounts"]["count"],
        discountDatas: DiscountModel.fromJsonList(json["discounts"]["datas"]),
      );
    } catch (err) {
      throw ("Error in MainPageModel : $err");
    }
  }
}
