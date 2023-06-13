import '../discounts/discount_entity.dart';
import '../baner_entity.dart';
import '../chosens/chosen_entity.dart';
import 'main_page_card_entity.dart';
import 'market_entity.dart';

class MainPageEntity {
  final List<BanerEntity> baners;
  final List<MarketEntity> markets;
  final MainPageCardEntity konkurs;
  final int saylananlarCount;
  final List<ChosenEntity> saylananlarDatas;
  final MainPageCardEntity top;
  final MainPageCardEntity pictures;
  final MainPageCardEntity videos;
  final MainPageCardEntity resmiler;
  final int discountsCount;
  final List<DiscountEntity> discountDatas;

  MainPageEntity({
    required this.baners,
    required this.markets,
    required this.konkurs,
    required this.saylananlarCount,
    required this.saylananlarDatas,
    required this.top,
    required this.pictures,
    required this.videos,
    required this.resmiler,
    required this.discountsCount,
    required this.discountDatas,
  });

  static MainPageEntity get empty => MainPageEntity(
        baners: [BanerEntity.empty],
        markets: [MarketEntity.empty],
        konkurs: MainPageCardEntity.empty,
        saylananlarCount: 0,
        saylananlarDatas: [ChosenEntity.empty],
        top: MainPageCardEntity.empty,
        pictures: MainPageCardEntity.empty,
        videos: MainPageCardEntity.empty,
        resmiler: MainPageCardEntity.empty,
        discountsCount: 0,
        discountDatas: [DiscountEntity.empty],
      );

  // factory MainPageEntity.frowJson(Map<String, dynamic> json) {
  //   try {
  //     return MainPageEntity(
  //       baners: BanerEntity.fromJsonList(json["baners"]),
  //       markets: MarketEntity.fromJsonList(json["markets"]),
  //       konkurs: MainPageCardEntity.frowJson(json["kunkurs"]),
  //       saylananlarCount: json["saylananlar"]["count"],
  //       saylananlarDatas:
  //           ChosenEntity.fromJsonList(json["saylananlar"]["datas"]),
  //       top: MainPageCardEntity.frowJson(json["top"]),
  //       pictures: MainPageCardEntity.frowJson(json["pictures"]),
  //       videos: MainPageCardEntity.frowJson(json["videos"]),
  //       resmiler: MainPageCardEntity.frowJson(json["resmiler"]),
  //       discountsCount: json["discounts"]["count"],
  //       discountDatas: DiscountEntity.fromJsonList(json["discounts"]["datas"]),
  //     );
  //   } catch (err) {
  //     throw ("Error in MainPageEntity : $err");
  //   }
  // }
}
