// ignore_for_file: overridden_fields

import 'package:arzan/config/vars/formater.dart';

import '../datasourses/remote/http_vars.dart';
import '/domanin/entities/user_entity.dart';

import '../../../config/vars/constants.dart';

class UserModel extends UserEntity {
  @override
  final int id;
  @override
  final String avatarImg;
  @override
  final String name;
  @override
  final Role role;

  UserModel(
      {required this.id,
      required this.avatarImg,
      required this.name,
      this.role = Role.Gost})
      : super(id: 0, avatarImg: '', name: '');

  static UserModel get empty => UserModel(id: 0, avatarImg: "", name: "");

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        avatarImg: json["avatar_image"]["url"] ?? "",
        name: json["name"],
        role: Formater.strToRole(json["role"] ?? "USER"),
      );

  factory UserModel.fromJsonForPostDetal(Map<String, dynamic> json) {
    try {
      return UserModel(
        id: json["id"],
        avatarImg:
            "https://${Uris.domain}/${json["image"]["url"] ?? ""}",
        name: json["name"],
        role: Formater.strToRole(json["role"] ?? "USER"),
      );
    } catch (err) {
      throw ("Error in fromJsonForPostDetal :=$err");
    }
  }
}
