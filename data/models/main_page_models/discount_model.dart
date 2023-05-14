// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/discount_entity.dart';

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
  @override
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
        mod: json["mod"],
        viewed: json["viewed"],
        img: json["img"],
        createdAt: json["created_at"],
        title: json["title"],
      );
    } catch (err) {
      throw ("Error in DiscountEntity : $err");
    }
  }

  static List<DiscountModel> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => DiscountModel.frowJson(json)).toList();
}
