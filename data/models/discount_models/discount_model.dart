// ignore_for_file: overridden_fields

import '../../../domanin/entities/discounts/discount_entity.dart';

class DiscountModel extends DiscountEntity {
  @override
  final int id;
  @override
  final int mod;
  @override
  final int viewed;
  @override
  final String img;
  @override
  final DateTime createdAt;
  @override
  final String title;
  final bool isEmpty;
  DiscountModel({
    required this.id,
    required this.mod,
    required this.viewed,
    required this.img,
    required this.createdAt,
    required this.title,
    this.isEmpty = true,
  }) : super(
          id: id,
          mod: mod,
          viewed: viewed,
          img: img,
          createdAt: createdAt,
          title: title,
        );

  static DiscountModel get empty => DiscountModel(
        id: 0,
        mod: 0,
        viewed: 0,
        img: "",
        createdAt: DateTime.now(),
        title: "",
        isEmpty: false,
      );

  factory DiscountModel.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountModel(
        id: json["id"],
        mod: json["mod"] ?? 0,
        viewed: 0, //json["viewed"],
        img: json["discount_img"],
        createdAt: DateTime.now(), //json["createdAt"],
        title: json["title"],
      );
    } catch (err) {
      throw ("Error in DiscountModel : $err");
    }
  }

  static List<DiscountModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => DiscountModel.frowJson(json)).toList();
}
