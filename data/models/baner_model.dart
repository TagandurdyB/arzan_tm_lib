// ignore_for_file: overridden_fields

import '../../domanin/entities/baner_entity.dart';

class BanerModel extends BanerEntity {
  @override
  final int id;
  @override
  final String img;
  @override
  final String note;
  @override
  final String title;
  @override
  final bool isEmpty;
  BanerModel({
    required this.id,
    required this.img,
    this.note = "",
    this.title = "",
    this.isEmpty = true,
  }) : super(
          id: id,
          img: img,
        );

  static BanerModel get empty => BanerModel(id: 0, img: "");

  factory BanerModel.frowJson(Map<String, dynamic> json) {
    try {
      return BanerModel(
          id: int.parse(json["id"]),
          img: json["banner_img"],
          note: json["note"] ?? "",
          title: json["title"] ?? "",
          isEmpty: false);
    } catch (err) {
      throw ("Error in BanerModel : $err");
    }
  }

  static List<BanerModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => BanerModel.frowJson(json)).toList();
}
