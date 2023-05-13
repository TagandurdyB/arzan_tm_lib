// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/baner_entity.dart';

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
      final String jNote = json["note"] ?? "";
      final String jTitle = json["title"] ?? "";
      return BanerModel(
          id: json["id"],
          img: json["banner_img"],
          note: jNote,
          title: jTitle,
          isEmpty: false);
    } catch (err) {
      throw ("Error in BanerEntity : $err");
    }
  }

  static List<BanerModel> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => BanerModel.frowJson(json)).toList();
}