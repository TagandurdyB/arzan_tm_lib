// ignore_for_file: overridden_fields

import 'package:arzan/data/models/user_model.dart';

import '../../../config/vars/formater.dart';
import '../../../domanin/entities/discounts/discount_detal_entity.dart';
import '../../datasourses/remote/http_vars.dart';

class DiscountDetalModel extends DiscountDetalEntity {
  @override
  final UserModel user;
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
  final double oldPrice;
  @override
  final double newPrice;
  @override
  final int mod;
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
  final int? prevId;
  @override
  final int? nextId;
  @override
  final bool isEmpty;
  DiscountDetalModel({
    required this.user,
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
    this.nextId,
    this.prevId,
    this.isEmpty = false,
  }) : super(
            user: user,
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
            isOfficial: isOfficial,
            startedAt: startedAt,
            endedAt: endedAt,
            about: about,
            tags: tags,
            phone: phone);

  static DiscountDetalModel empty() => DiscountDetalModel(
        user: UserModel.empty,
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

  factory DiscountDetalModel.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountDetalModel(
        // userImg: json["userImg"] ?? "",
        // userName: json["userName"] ?? "100haryt",
        user: UserModel.fromJsonForPostDetal(json["user"]),
        pictures: json["images"] != null
            ? json["images"]
                .map((e) => "https://${Uris.domain}/${e["url"] ?? ""}")
                .toList()
                .cast<String>()
            : [],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        viewed: json["viewed_count"],
        liked: json["like_count"] ?? 0,
        chated: json["chated"] ?? 0,
        title: json["title"],
        oldPrice: json["price"]+0.0,
        newPrice: json["discount"]+0.0,
        mod: Formater.modFinder(
            json["price"] + 0.0, json["discount"] + 0.0), //json["mod"],
        isOfficial: json["isOfficial"] ?? false,
        startedAt: DateTime.parse(json["start_date"]),
        endedAt: DateTime.parse(json["end_date"]),
        about: json["description"] ?? "",
        tags: json["tags"] != null
            ? json["tags"].map((e) => e["name"]).toList().cast<String>()
            : [],
        phone: json["phone"],
        prevId: json["prev_id"],
        nextId: json["next_id"],
      );
    } catch (err) {
      throw ("Error in DiscountDetalModel : $err");
    }
  }
  // Map<String, dynamic> toJson() => {
  //       "image": imageUrl,
  //       "id": id,
  //     };
}
