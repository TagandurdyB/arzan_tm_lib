// ignore_for_file: overridden_fields

import 'package:arzan/config/vars/formater.dart';

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
        avatarImg: json["avatarImg"],
        name: json["name"],
        role: Formater.strToRole(json["role"]),
      );
}
