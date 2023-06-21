// ignore_for_file: overridden_fields

import 'dart:convert';

import '/domanin/entities/discounts/post_discount_entity.dart';

class PostDiscountModel extends PostDiscountEntity {
  @override
  final List<String> images;
  @override
  final String name;
  @override
  final String description;
  @override
  final List<String>? hashtags;
  @override
  final String? phone;
  @override
  final int price;
  @override
  final int? oldPrice;
  @override
  final DateTime? statedAt;
  @override
  final DateTime? endedAt;
  @override
  final int categoryId;
  @override
  final int subCategoryId;
  @override
  final bool isEmpty;
  PostDiscountModel({
    required this.images,
    required this.name,
    required this.description,
    required this.hashtags,
    required this.phone,
    required this.price,
    required this.oldPrice,
    required this.statedAt,
    required this.endedAt,
    this.subCategoryId = 0,
    this.categoryId = 0,
    this.isEmpty = true,
  }) : super(
          images: images,
          name: name,
          description: description,
          hashtags: hashtags,
          phone: phone,
          price: price,
          oldPrice: oldPrice,
          statedAt: DateTime.now(),
          endedAt: DateTime.now(),
          subCategoryId: subCategoryId,
          categoryId: categoryId,
        );

  static PostDiscountModel empty() => PostDiscountModel(
        isEmpty: true,
        description: '',
        endedAt: DateTime.now(),
        hashtags: [],
        images: [],
        name: '',
        phone: '',
        oldPrice: 0,
        price: 0,
        statedAt: DateTime.now(),
      );

  // factory PostDiscountEntity.frowJson(Map<String, dynamic> json) =>
  //     PostDiscountEntity(
  //        userId: json["id"],
  //       description: json["id"],
  //       endedAt: json["id"],
  //       hashtags: json["id"],
  //       image: json["id"],
  //       name: json["id"],
  //       phone: json["id"],
  //       oldPrice: json["id"],
  //       price: json["id"],
  //       statedAt: json["id"],
  //       isEmpty: false,
  //     );

  static PostDiscountModel fromEntity(PostDiscountEntity entity) {
    try {
      return PostDiscountModel(
        description: entity.description,
        endedAt: entity.endedAt,
        hashtags: entity.hashtags,
        images: entity.images,
        name: entity.name,
        oldPrice: entity.oldPrice,
        phone: entity.phone,
        price: entity.price,
        statedAt: entity.statedAt,
        categoryId: entity.categoryId,
        subCategoryId: entity.subCategoryId,
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in PostDiscountModel fromEntity: $err");
    }
  }

  Map<String, String> toJson() => {
        "description": description,
        "end_date": endedAt != null ? endedAt.toString() : '',
        "tags": hashtags != null ? jsonEncode(hashtags) : jsonEncode([]),
        "title": name,
        "phone": phone ?? "",
        "discount": oldPrice != null ? "$oldPrice" : "0",
        "price": price.toString(),
        "start_date": statedAt != null ? statedAt.toString() : '',
        "category_id": categoryId.toString(),
        "sub_category_id": subCategoryId.toString(),
      };
}
