// ignore_for_file: overridden_fields

import '../../datasourses/remote/http_vars.dart';
import '/data/models/user_model.dart';

import '../../../domanin/entities/galery/content_card_entity.dart';

class ContentCardModel extends ContentCardEntity {
  @override
  final int id;
  @override
  final UserModel user;
  @override
  final String banerImg;
  @override
  final DateTime? createdAt;
  @override
  final int viewed;
  @override
  final String title;
  @override
  final String videoUrl;
  @override
  final int allCount;
  @override
  final int likeCount;
  @override
  final bool pinnad;
  @override
  final bool isLiked;
  @override
  final bool isPicture;
  @override
  final bool isEmpty;
  ContentCardModel({
    required this.id,
    required this.user,
    required this.banerImg,
    this.createdAt,
    required this.viewed,
    required this.videoUrl,
    required this.title,
    required this.allCount,
    required this.likeCount,
    this.isLiked = false,
    this.pinnad = false,
    this.isPicture = false,
    this.isEmpty = true,
  }) : super(
            id: 0,
            user: user,
            videoUrl: videoUrl,
            likeCount: 0,
            banerImg: '',
            allCount: 0,
            title: "",
            viewed: 0);

  static ContentCardEntity empty() => ContentCardEntity(
      id: 0,
      user: UserModel.empty,
      banerImg: "",
      videoUrl: "",
      likeCount: 0,
      viewed: 0,
      title: "",
      allCount: 0);

  factory ContentCardModel.frowJsonV(Map<String, dynamic> json) =>
      ContentCardModel(
        id: json["id"],
        user: UserModel.fromJson(json["user"]),
        banerImg: "http://${Uris.ip}:${Uris.port}/${json["thumbnail"]["url"]}",
        videoUrl: "http://${Uris.ip}:${Uris.port}/${json["video"]["url"]}",
        createdAt: DateTime.parse(json["created_at"]),
        viewed: json["viewed_count"],
        likeCount: json["likes_count"],
        isLiked: json["is_liked"] != null
            ? json["is_liked"] == 0
                ? false
                : true
            : false,
        title: json["title"],
        allCount: json["allCount"] ?? 0,
        pinnad: json["pinnad"] ?? false,
        isEmpty: false,
      );

  factory ContentCardModel.frowJsonI(Map<String, dynamic> json) =>
      ContentCardModel(
        id: json["id"],
        user: UserModel.fromJson(json["user"]),
        banerImg:
            "http://${Uris.ip}:${Uris.port}/${json["avatar_image"]["url"]}",
        videoUrl: "",
        createdAt: DateTime.parse(json["created_at"]),
        viewed: json["view_count"],
        likeCount: json["likes_count"] ?? 0,
        isLiked: json["is_liked"] != null
            ? json["is_liked"] == 0
                ? false
                : true
            : false,
        title: json["title"],
        allCount: json["image_count"] ?? 0,
        pinnad: json["pinnad"] ?? false,
        isEmpty: false,
        isPicture: true,
      );

  set cardType(bool isPicture) {
    isPicture = isPicture;
  }

  static List<ContentCardModel> fromJsonListV(List jsonList) =>
      jsonList.map((json) => ContentCardModel.frowJsonV(json)).toList();
  // jsonList.length > 11
  //     ? List.generate(
  //         12, (index) => ContentCardModel.frowJsonV(jsonList[index]))
  //     : jsonList.map((json) => ContentCardModel.frowJsonV(json)).toList();

  static List<ContentCardModel> fromJsonListI(List jsonList) =>
      jsonList.map((json) => ContentCardModel.frowJsonI(json)).toList();

  // @override
  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": userName,
  //       "userImg": userImg,
  //       "banerImg": banerImg,
  //       "thumbinalImg": thumbinalImg,
  //       "videoUrl": videoUrl,
  //       "about": userImg,
  //       "allCount": allCount,
  //       "allViewed": allViewed,
  //       "allShaered": allShaered,
  //       "isEmpty": isEmpty,
  //     };
}
