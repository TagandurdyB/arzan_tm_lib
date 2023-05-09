import '/domanin/entities/images/img_card_entity.dart';

class BigImgCardEntity {
  final int id;
  final String name;
  final String userImg;
  final String banerImg;
  final String about;
  final int allViewed;
  final int allCount;
  final int allShaered;
  final bool isEmpty;
  final List<ImgCardEntity> contents;
  BigImgCardEntity({
    required this.id,
    this.name = "",
    this.userImg = "",
    this.banerImg = "",
    this.about = "",
    this.allViewed = 0,
    this.allCount = 0,
    this.allShaered = 0,
    this.contents = const [],
    this.isEmpty = true,
  });

  static BigImgCardEntity empty() => BigImgCardEntity(id: 0);

  factory BigImgCardEntity.frowJson(Map<String, dynamic> json) =>
      BigImgCardEntity(
        id: json["id"],
        name: json["name"],
        userImg: json["user_img"],
        banerImg: json["baner_img"],
        about: json["about"],
        allCount: json["all_count"],
        allViewed: json["all_viewed"],
        allShaered: json["all_shaered"],
        contents: ImgCardEntity.frowJsonList(json["contents"]),
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "userImg": userImg,
        "banerImg": banerImg,
        "about": userImg,
        "allCount": allCount,
        "allViewed": allViewed,
        "allShaered": allShaered,
        "cintents": contents,
        "isEmpty": isEmpty,
      };
}
