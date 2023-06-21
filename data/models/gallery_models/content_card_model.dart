// ignore_for_file: overridden_fields

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
  final int allCount;
  @override
  final bool pinnad;
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
    required this.title,
    required this.allCount,
    this.pinnad = false,
    this.isPicture = false,
    this.isEmpty = true,
  }) : super(
            id: 0, user: user, banerImg: '', allCount: 0, title: "", viewed: 0);

  static ContentCardEntity empty() => ContentCardEntity(
      id: 0,
      user: UserModel.empty,
      banerImg: "",
      viewed: 0,
      title: "",
      allCount: 0);

  factory ContentCardModel.frowJson(Map<String, dynamic> json) =>
      ContentCardModel(
        id: json["id"],
        user: UserModel.fromJson(json["user"]),
        banerImg: json["banerImg"],
        createdAt: DateTime.parse(json["created_at"]),
        viewed: json["viewed"],
        title: json["title"],
        allCount: json["allCount"] ?? 0,
        pinnad: json["pinnad"] ?? false,
        isEmpty: false,
      );

  set cardType(bool isPicture) {
    isPicture = isPicture;
  }

  static List<ContentCardModel> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ContentCardModel.frowJson(json)).toList();

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
