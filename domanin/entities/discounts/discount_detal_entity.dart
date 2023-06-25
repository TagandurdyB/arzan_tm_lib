import 'package:arzan/domanin/entities/user_entity.dart';

class DiscountDetalEntity {
  final UserEntity user;
  // final String userImg;
  // final String userName;
  final List<String> pictures;
  final int id;
  final DateTime createdAt;
  final int viewed;
  final int liked;
  final int chated;
  final String title;
  final int oldPrice;
  final int newPrice;
  final int mod;
  final bool isOfficial;
  final DateTime startedAt;
  final DateTime endedAt;
  final String about;
  final List<String> tags;
  final String phone;

  final bool isEmpty;
  DiscountDetalEntity({
    required this.user,
    // required this.userImg,
    // required this.userName,
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
    required this.isOfficial,
    required this.startedAt,
    required this.endedAt,
    required this.about,
    required this.tags,
    required this.phone,
    this.isEmpty = false,
  });

  static DiscountDetalEntity empty() => DiscountDetalEntity(
        // userImg: "",
        // userName: "",
        user: UserEntity.empty,
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
        isOfficial: false,
        startedAt: DateTime.now(),
        endedAt: DateTime.now(),
        about: "",
        tags: [],
        phone: "",
        isEmpty: true,
      );

  // factory DiscountyDetalEntity.frowJson(Map<String, dynamic> json) =>
  //     DiscountyDetalEntity(
  //       imageUrl: json["image"],
  //       id: json["id"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "image": imageUrl,
  //       "id": id,
  //     };
}
