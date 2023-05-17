// ignore_for_file: overridden_fields

import '../../../domanin/entities/discounts/discount_detal_entity.dart';

class DiscountDetalModel extends DiscountDetalEntity {
  @override
  final String userImg;
  @override
  final String userName;
  @override
  final List<String> pictures;
  @override
  final int id;
  @override
  final DateTime createdAt;
  @override
  final int viewed;
  @override
  final int liked;
  @override
  final int chated;
  @override
  final String title;
  @override
  final int oldPrice;
  @override
  final int newPrice;
  @override
  final int mod;
  @override
  final int userId;
  @override
  final bool isOfficial;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  @override
  final String about;
  @override
  final List<String> tags;
  @override
  final String phone;

  @override
  final bool isEmpty;
  DiscountDetalModel({
    required this.userImg,
    required this.userName,
    required this.pictures,
    required this.id,
    required this.createdAt,
    required this.viewed,
    required this.liked,
    required this.chated,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
    required this.mod,
    required this.userId,
    required this.isOfficial,
    required this.startedAt,
    required this.endedAt,
    required this.about,
    required this.tags,
    required this.phone,
    this.isEmpty = false,
  }) : super(
            userImg: userImg,
            userName: userName,
            pictures: pictures,
            id: id,
            createdAt: createdAt,
            viewed: viewed,
            liked: liked,
            chated: chated,
            title: title,
            oldPrice: oldPrice,
            newPrice: newPrice,
            mod: mod,
            userId: userId,
            isOfficial: isOfficial,
            startedAt: startedAt,
            endedAt: endedAt,
            about: about,
            tags: tags,
            phone: phone);

  static DiscountDetalModel empty() => DiscountDetalModel(
        userImg: "",
        userName: "",
        pictures: [],
        id: 0,
        createdAt: DateTime.now(),
        viewed: 0,
        liked: 0,
        chated: 0,
        title: "",
        oldPrice: 0,
        newPrice: 0,
        mod: 0,
        userId: 0,
        isOfficial: false,
        startedAt: DateTime.now(),
        endedAt: DateTime.now(),
        about: "",
        tags: [],
        phone: "",
        isEmpty: true,
      );

  factory DiscountDetalModel.frowJson(Map<String, dynamic> json) =>
      DiscountDetalModel(
        userImg: json["userImg"],
        userName: json["userName"],
        pictures: json["pictures"],
        id: json["id"],
        createdAt: json["createdAt"],
        viewed: json["viewed"],
        liked: json["liked"],
        chated: json["chated"],
        title: json["title"],
        oldPrice: json["oldPrice"],
        newPrice: json["newPrice"],
        mod: json["mod"],
        userId: json["userId"],
        isOfficial: json["isOfficial"],
        startedAt: json["startedAt"],
        endedAt: json["endedAt"],
        about: json["about"],
        tags: json["tags"],
        phone: json["phone"],
      );

  // Map<String, dynamic> toJson() => {
  //       "image": imageUrl,
  //       "id": id,
  //     };
}
