// ignore_for_file: overridden_fields

import '../../../domanin/entities/chosens/chosen_detal_entity.dart';

class ChosenDetalModel extends ChosenDetalEntity {
  @override
  final int id;
  @override
  final List<String> images;
  @override
  final String title;
  @override
  final DateTime createdAt;
  @override
  final int viewed;
  @override
  final int liked;
  @override
  final String whom;
  @override
  final String message;
  @override
  final String phone;
  @override
  final String tags;
  @override
  final bool isEmpty;
  ChosenDetalModel({
    required this.id,
    required this.images,
    required this.title,
    required this.viewed,
    required this.liked,
    required this.whom,
    required this.message,
    required this.phone,
    required this.tags,
    required this.createdAt,
    this.isEmpty = true,
  }) : super(
          id: id,
          images: images,
          title: title,
          viewed: viewed,
          liked: liked,
          whom: whom,
          message: message,
          phone: phone,
          tags: tags,
          createdAt: createdAt,
          isEmpty: isEmpty,
        );

  static ChosenDetalModel get empty => ChosenDetalModel(
        id: 0,
        images: [],
        title: "",
        viewed: 0,
        liked: 0,
        whom: "",
        message: "",
        phone: "",
        tags: "",
        createdAt: DateTime.now(),
      );

  factory ChosenDetalModel.frowJson(Map<String, dynamic> json) {
    try {
      return ChosenDetalModel(
        id: json["id"],
        images: json["images"],
        title: json["title"],
        viewed: json["viewed"],
        liked: json["liked"],
        whom: json["whom"],
        message: json["message"],
        phone: json["phone"],
        tags: json["tags"],
        createdAt: json["createdAt"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ChosenEntity : $err");
    }
  }

  static List<ChosenDetalModel> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ChosenDetalModel.frowJson(json)).toList();
}
