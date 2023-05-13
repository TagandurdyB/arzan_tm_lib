// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/main_page_card_entity.dart';

class MainPageCardModel extends MainPageCardEntity {
  @override
  final int count;
  @override
  final String img;
  @override
  final bool isEmpty;
  MainPageCardModel({
    this.count = 0,
    required this.img,
    this.isEmpty = true,
  }) : super(img: img);

  static MainPageCardModel get empty => MainPageCardModel(
        count: 0,
        img: "",
        isEmpty: false,
      );

  factory MainPageCardModel.frowJson(Map<String, dynamic> json) {
    try {
      return MainPageCardModel(
        count: json["count"],
        img: json["img"],
      );
    } catch (err) {
      throw ("Error in MainPageCardEntity : $err");
    }
  }
}
