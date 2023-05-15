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
        userPhone: entity.userPhone,
        inviterLink: entity.inviterLink,
      );
    } catch (err) {
      throw ("Error in SignUpEntity fromEntity: $err");
    }
  }

  factory SignUpModel.frowJson(Map<String, dynamic> json) {
    try {
      return SignUpModel(
        uniqueId: json["uniqueId"],
        userName: json["name"],
        userPassword: json["password"],
        userPhone: json["phone_num"],
        inviterLink: json["inviterLink"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "uniqueId": uniqueId,
        "name": userName,
        "password": userPassword,
        "phone_num": userPhone,
        "inviterLink": inviterLink,
      };
}
