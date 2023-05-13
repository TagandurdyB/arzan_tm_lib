// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/market_entity.dart';

class MarketModel extends MarketEntity {
  @override
  final int id;
  @override
  final int mod;
  @override
  final String logo;
  @override
  final String name;
  @override
  final bool isEmpty;
  MarketModel({
    required this.id,
    required this.mod,
    required this.logo,
    required this.name,
    this.isEmpty = true,
  }) : super(
          id: id,
          mod: mod,
          logo: logo,
          name: name,
        );

  static MarketModel get empty => MarketModel(
        id: 0,
        mod: 0,
        logo: "",
        name: "",
      );

  factory MarketModel.frowJson(Map<String, dynamic> json) {
    try {
      return MarketModel(
        id: json["id"],
        mod: json["mod"]??0,
        logo: json["market_img"],
        name: json["title"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in MarketEntity : $err");
    }
  }

  static List<MarketModel> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => MarketModel.frowJson(json)).toList();
}
