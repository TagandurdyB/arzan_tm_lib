// ignore_for_file: overridden_fields

import '../../../config/vars/formater.dart';
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
  @override
  final String description;
  final bool isEmpty;
  DiscountModel({
    required this.id,
    required this.mod,
    required this.viewed,
    required this.img,
    required this.createdAt,
    required this.title,
    required this.description,
    this.isEmpty = true,
  }) : super(
          id: id,
          mod: mod,
          viewed: viewed,
          img: img,
          createdAt: createdAt,
          title: title,
          description: description,
        );

  static DiscountModel get empty => DiscountModel(
        id: 0,
        mod: 0,
        viewed: 0,
        img: "",
        createdAt: DateTime.now(),
        title: "",
        description: "",
        isEmpty: false,
      );

  factory DiscountModel.frowJson(Map<String, dynamic> json) {
    try {
      final int modPrice =
          Formater.modFinder(json["price"] as int, json["discount"] as int);
      return DiscountModel(
        id: json["id"],
        mod: modPrice,
        viewed: json["viewed_count"], //json["viewed"],
        img: json["image"],
        createdAt: DateTime.parse(json["created_at"]), //json["createdAt"],
        title: json["title"],
        description: json["description"] ?? "",
      );
    } catch (err) {
      throw ("Error in DiscountModel : $err");
    }
  }

  static List<DiscountModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => DiscountModel.frowJson(json)).toList();
}
