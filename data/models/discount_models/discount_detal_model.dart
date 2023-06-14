// ignore_for_file: overridden_fields

import '../../../config/vars/formater.dart';
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
        userImg: json["userImg"] ?? "",
        userName: json["userName"] ?? "100haryt",
        pictures: json["pictures"] ?? [json["discount_img"]],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        viewed: int.parse(json["viewed"]),
        liked: json["liked"] ?? 0,
        chated: json["chated"] ?? 0,
        title: json["title"],
        oldPrice: int.parse(json["price"]) ,
        newPrice: int.parse(json["discount_price"]) ,
        mod: 23, //json["mod"],
        userId: json["userId"] ?? 0,
        isOfficial: json["isOfficial"] ?? false,
        startedAt: DateTime.parse(json["start_date"]),
        endedAt: DateTime.parse(json["end_date"]),
        about: json["about"] ?? "",
        tags: Formater.tagSeperator(json["hashtags"]),
        phone: "+993${json["phone_num"]}",
      );

  // Map<String, dynamic> toJson() => {
  //       "image": imageUrl,
  //       "id": id,
  //     };
}
