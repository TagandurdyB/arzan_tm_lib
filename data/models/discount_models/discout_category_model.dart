// ignore_for_file: overridden_fields

import '../../../domanin/entities/discounts/discount_category_entity.dart';

class DiscountCategoryModel extends DiscountCategoryEntity {
  @override
  final int id;
  @override
  final String? imgUrl;
  @override
  final String name;
  @override
  final int count;
  @override
  final List<DiscountSubcategoryEntity> subs;

  @override
  final bool isEmpty;

  DiscountCategoryModel({
    required this.id,
    this.imgUrl,
    required this.name,
    required this.count,
    this.subs = const [],
    this.isEmpty = true,
  }) : super(id: id, count: count, name: name);

  static DiscountCategoryModel get empty => DiscountCategoryModel(
        count: 0,
        id: 0,
        name: '',
      );

  factory DiscountCategoryModel.frowJson(Map<String, dynamic> json, List subs) {
    try {
      return DiscountCategoryModel(
        id: json["id"],
        imgUrl: json["imgUrl"],
        name: json["name"],
        count: json["count"] ?? 0,
        subs: json["subs"] ?? subs,
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in DiscountCategoryModel : $err");
    }
  }

  static List<DiscountCategoryModel> fromJsonList(List jsonList, List subs) =>
      List.generate(
          jsonList.length,
          (index) =>
              DiscountCategoryModel.frowJson(jsonList[index], subs[index]));
}

class DiscountSubcategoryModel extends DiscountSubcategoryEntity {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool isEmpty;

  DiscountSubcategoryModel({
    required this.id,
    required this.name,
    this.isEmpty = true,
  }) : super(id: 0, name: '');

  static DiscountSubcategoryModel get empty => DiscountSubcategoryModel(
        id: 0,
        name: '',
      );

  factory DiscountSubcategoryModel.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountSubcategoryModel(
        id: json["id"],
        name: json["name"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in DiscountSubcategoryModel : $err");
    }
  }

  static List<DiscountSubcategoryModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => DiscountSubcategoryModel.frowJson(json)).toList();
}
