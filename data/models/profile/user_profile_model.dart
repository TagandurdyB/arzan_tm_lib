// ignore_for_file: overridden_fields

import '/domanin/entities/profiles/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? avatarImg;
  @override
  final int expected;
  @override
  final int notAccepted;
  @override
  final int confirmed;
  @override
  final int coin;
  @override
  final int likeCont;
  @override
  final int postCount;
  @override
  final bool isEmpty;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    this.avatarImg,
    required this.expected,
    required this.notAccepted,
    required this.confirmed,
    required this.coin,
    this.likeCont = 0,
    this.postCount = 0,
    this.isEmpty = true,
  }) : super(
            id: id,
            name: "",
            phone: '',
            coin: 0,
            confirmed: 0,
            expected: 0,
            avatarImg: "",
            notAccepted: 0);

  static UserProfileModel empty() => UserProfileModel(
        id: 0,
        coin: 0,
        confirmed: 0,
        expected: 0,
        name: '*Arzan TM*',
        notAccepted: 0,
        phone: '+99360000000',
      );

  factory UserProfileModel.frowJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"] ?? 0,
        avatarImg:
            json["avatar_image"] != null ? json["avatar_image"]["url"] : null,
        name: json["name"],
        coin: json["coin_balance"] ?? 0,
        confirmed: json["post_approved_count"] ?? 0,
        expected: json["post_waiting_count"] ?? 0,
        notAccepted: json["post_un_approved"] ?? 0,
        phone: json["phone"] ?? "",
        likeCont: json["like_count"] ?? 0,
        postCount: json["post_count"] ?? 0,
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "expected": expected,
        "notAccepted": notAccepted,
        "phone": phone,
        "avatarImg": avatarImg,
        "name": name,
        "coin": coin,
        "isEmpty": isEmpty,
      };

  static List<UserProfileModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => UserProfileModel.frowJson(json)).toList();
}
