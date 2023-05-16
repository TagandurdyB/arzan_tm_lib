import '/domanin/entities/galery/img_card_entity.dart';

class ImgCardModel extends ImgCardEntity {
  final int id;
  final String img;
  final int viewed;
  final int liked;
  final bool isEmpty;
  ImgCardModel({
    required this.id,
    this.img = "",
    this.viewed = 0,
    this.liked = 0,
    this.isEmpty = true,
  }) : super(id: id);

  static ImgCardModel empty() => ImgCardModel(id: 0);

  factory ImgCardModel.frowJson(Map<String, dynamic> json) => ImgCardModel(
        id: json["id"],
        img: json["img"],
        viewed: json["viewed"],
        liked: json["liked"],
        isEmpty: false,
      );

  static List<ImgCardModel> frowJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ImgCardModel.frowJson(json)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "viewed": viewed,
        "liked": liked,
        "isEmpty": isEmpty,
      };
}
