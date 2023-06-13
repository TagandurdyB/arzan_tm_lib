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
  List<DiscountSubcategoryEntity> subs;

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

  factory DiscountCategoryModel.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountCategoryModel(
        id: int.parse(json["id"]),
        imgUrl: json["imgUrl"],
        name: json["name"],
        count: json["count"] ?? 0,
        subs: json["subs"] ?? [],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in DiscountCategoryModel : $err");
    }
  }

  static List<DiscountCategoryModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => DiscountCategoryModel.frowJson(json)).toList();

  // void forSubList(List<DiscountSubcategoryModel> csubs) => subs = csubs;

  // static List<DiscountCategoryModel> fromJsonList(List jsonList) {
  //   final categories =
  //       jsonList.map((json) => DiscountCategoryModel.frowJson(json)).toList();
  //   final categoriesSub = forSubList(categories);
  //   return categoriesSub;
  // }

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
        id: int.parse(json["id"]),
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
