// ignore_for_file: overridden_fields

import 'big_content_card_entity.dart';

class VideoCardEntity extends BigCardEntity {
  @override
  final int id;
  @override
  final String userName;
  @override
  final String userImg;
  final String videoURL;
  final String thumbinalUrl;
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
  final bool isVideo;
  // final List<ImgCardEntity> contents;
  VideoCardEntity({
    required this.id,
    this.userName = "",
    this.userImg = "",
    this.videoURL = "",
    this.thumbinalUrl = "",
    this.name = "",
    this.allViewed = 0,
    this.allCount = 0,
    this.allShaered = 0,
    // this.contents = const [],
    this.isEmpty = true,
    this.isVideo = true,
  }) : super(id: 0);

  static VideoCardEntity empty() => VideoCardEntity(id: 0);

  factory VideoCardEntity.frowJson(Map<String, dynamic> json) =>
      VideoCardEntity(
        id: json["id"],
        userName: json["name"],
        userImg: json["user_img"],
        videoURL: json["video_url"],
        thumbinalUrl: json["thumbinal_img"],
        name: json["vide_name"],
        allCount: json["all_count"],
        allViewed: json["all_viewed"],
        allShaered: json["all_shaered"],
        // contents: ImgCardEntity.frowJsonList(json["contents"]),
        isEmpty: false,
      );

  // static List<VideoCardEntity> frowJsonList(List<Map<String, dynamic>> json) =>
  //     json
  //         .map((e) => VideoCardEntity(
  //               id: e["id"],
  //               img: e["img"],
  //               viewed: e["viewed"],
  //               liked: e["liked"],
  //               isEmpty: false,
  //             ))
  //         .toList();

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": userName,
        "userImg": userImg,
        "videoURL": videoURL,
        "thumbinalUrl": thumbinalUrl,
        "about": name,
        "allCount": allCount,
        "allViewed": allViewed,
        "allShaered": allShaered,
        "cintents": contents,
        "isEmpty": isEmpty,
      };
}
