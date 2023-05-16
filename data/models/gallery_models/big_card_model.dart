// ignore_for_file: overridden_fields

import '/domanin/entities/galery/big_content_card_entity.dart';

class BigCardModel extends BigCardEntity {
  @override
  final int id;
  @override
  final String userName;
  @override
  final String userImg;
  @override
  final String banerImg;
  @override
  final String thumbinalImg;
  @override
  final String? videoUrl;
  @override
  final String name;
  @override
  final int allViewed;
  @override
  final int allCount;
  @override
  final int allShaered;
  @override
  final bool isEmpty;
  @override
  final BigCardModel? secondCard;
  BigCardModel({
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
    this.secondCard,
    this.isEmpty = true,
  }) : super(id: id);

  static BigCardModel empty() => BigCardModel(id: 0);

  factory BigCardModel.frowJson(Map<String, dynamic> json) => BigCardModel(
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
        isEmpty: false,
      );

  static List<BigCardModel> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => BigCardModel.frowJson(json)).toList();

  @override
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
        "isEmpty": isEmpty,
      };
}
