import '/domanin/entities/galery/img_card_entity.dart';

class BigCardEntity {
  final int id;
  final String userName;
  final String userImg;
  final String banerImg;
  final String thumbinalImg;
  final String? videoUrl;
  final String name;
  final int allViewed;
  final int allCount;
  final int allShaered;
  final bool isEmpty;
  final List<ImgCardEntity> contents;
  final BigCardEntity? secondCard;
  BigCardEntity({
    required this.id,
    this.userName = "",
    this.userImg = "",
    this.banerImg = "",
    this.thumbinalImg = "",
    this.videoUrl,
    this.name = "",
    this.allViewed = 0,
    this.allCount = 0,
    this.allShaered = 0,
    this.contents = const [],
    this.secondCard,
    this.isEmpty = true,
  });

  static BigCardEntity empty() => BigCardEntity(id: 0);

  factory BigCardEntity.frowJson(Map<String, dynamic> json) => BigCardEntity(
        id: json["id"],
        userName: json["name"],
        userImg: json["user_img"],
        banerImg: json["baner_img"],
        thumbinalImg: json["thumbinal_img"],
        videoUrl: json["video_url"],
        name: json["about"],
        allCount: json["all_count"],
        allViewed: json["all_viewed"],
        allShaered: json["all_shaered"],
        contents: ImgCardEntity.frowJsonList(json["contents"]),
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": userName,
        "userImg": userImg,
        "banerImg": banerImg,
        "thumbinalImg": thumbinalImg,
        "videoUrl": videoUrl,
        "about": userImg,
        "allCount": allCount,
        "allViewed": allViewed,
        "allShaered": allShaered,
        "cintents": contents,
        "isEmpty": isEmpty,
      };
}
