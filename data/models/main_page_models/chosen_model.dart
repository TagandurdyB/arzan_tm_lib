// ignore_for_file: overridden_fields

import '/domanin/entities/main_page/chosen_entity.dart';

class ChosenModel extends ChosenEntity {
  @override
  final int id;
  @override
  final String img;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final bool isEmpty;
  ChosenModel({
    required this.id,
    required this.img,
    required this.name,
    required this.createdAt,
    this.isEmpty = true,
  }) : super(
          id: id,
          img: img,
          name: name,
          createdAt: createdAt,
          isEmpty: isEmpty,
        );

  static ChosenModel get empty => ChosenModel(
        id: 0,
        img: "",
        name: "",
        createdAt: DateTime.now(),
      );

  factory ChosenModel.frowJson(Map<String, dynamic> json) {
    try {
      return ChosenModel(
        id: json["id"],
        img: json["saylanan_img"],
        name: json["title"],
        createdAt: json["created_at"] ?? DateTime.now(),
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ChosenEntity : $err");
    }
  }

  static List<ChosenModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => ChosenModel.frowJson(json)).toList();
}
