// ignore_for_file: overridden_fields

import '/domanin/entities/register/sign_up_entity.dart';

class SignUpModel extends SignUpEntity {
  @override
  final String uniqueId;
  @override
  final String userName;
  @override
  final String userPassword;
  @override
  final String userPhone;
  @override
  final String inviterLink;
  @override
  final bool isEmpty;

  SignUpModel({
    required this.uniqueId,
    required this.userName,
    required this.userPassword,
    required this.userPhone,
    this.inviterLink = "",
    this.isEmpty = true,
  }) : super(
          uniqueId: '',
          userName: '',
          userPassword: '',
          userPhone: '',
        );

  static SignUpModel get empty => SignUpModel(
      uniqueId: "",
      userName: "",
      userPassword: "",
      userPhone: "",
      inviterLink: "");

  static SignUpModel fromEntity(SignUpEntity entity) {
    try {
      return SignUpModel(
        uniqueId: entity.uniqueId,
        userName: entity.userName,
        userPassword: entity.userPassword,
        userPhone: "993${entity.userPhone}",
        inviterLink: entity.inviterLink,
      );
    } catch (err) {
      throw ("Error in SignUpEntity fromEntity: $err");
    }
  }

  factory SignUpModel.frowJson(Map<String, dynamic> json) {
    try {
      return SignUpModel(
        uniqueId: json["uniqe_id"],
        userName: json["name"],
        userPassword: json["pass"],
        userPhone: json["phone"],
        inviterLink: json["link"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "uniqe_id": uniqueId,
        "name": userName,
        "pass": userPassword,
        "phone": userPhone,
        "link": inviterLink,
      };
}
