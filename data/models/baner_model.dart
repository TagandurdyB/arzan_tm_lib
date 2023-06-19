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
  final String link;
  @override
  final String title;
  @override
  final bool isEmpty;
  BanerModel({
    required this.id,
    required this.img,
    this.note = "",
    this.link = "",
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
          id: json["id"],
          img: json["image"],
          note: json["note"] ?? "",
          title: json["title"] ?? "",
          link: json["link"] ?? "",
          isEmpty: false);
    } catch (err) {
      throw ("Error in BanerModel : $err");
    }
  }

  static List<BanerModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => BanerModel.frowJson(json)).toList();
}
