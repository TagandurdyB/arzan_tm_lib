// ignore_for_file: overridden_fields

import '../../../domanin/entities/galery/img_entity.dart';

class ImgModel extends ImgEntity {
  @override
  final int id;
  @override
  final String img;
  @override
  final int viewed;
  @override
  final int liked;
  @override
  final bool isEmpty;
  ImgModel({
    required this.id,
    this.img = "",
    this.viewed = 0,
    this.liked = 0,
    this.isEmpty = true,
  }) : super(id: id);

  static ImgModel empty() => ImgModel(id: 0);

  factory ImgModel.frowJson(Map<String, dynamic> json) => ImgModel(
        id: json["id"],
        img: "http://95.85.126.113:8080/${json["url"]}",
        viewed: json["view_count"],
        liked: json["like_count"],
        isEmpty: false,
      );

  static List<ImgModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => ImgModel.frowJson(json)).toList();

  // @override
  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "img": img,
  //       "viewed": viewed,
  //       "liked": liked,
  //       "isEmpty": isEmpty,
  //     };
}
