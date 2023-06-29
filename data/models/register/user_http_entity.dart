// ignore_for_file: overridden_fields

import '../../../domanin/entities/register/user_http_entity.dart';

class UserRequestModel extends UserRequestEntity {
  @override
  final String phone;
  @override
  final String? pass;
  @override
  final String? token;

  UserRequestModel({
    required this.phone,
    this.pass,
    this.token,
  }) : super(phone: phone, pass: pass, token: token);

  static UserRequestModel get empty => UserRequestModel(
        phone: '',
        token: '',
      );

  static UserRequestModel fromEntity(UserRequestEntity entity) {
    try {
      return UserRequestModel(
        phone: entity.phone,
        pass: entity.pass,
        token: entity.token,
      );
    } catch (err) {
      throw ("Error in UserRequestModel fromEntity: $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": pass,
        "token": token,
      };
}

class UserResponseModel extends UserResponseEntity {
  @override
  final int id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? uniqueId;
  @override
  final String role;
  @override
  final String? phone;
  @override
  final String? token;
  @override
  final String? profilePhoto;
  @override
  final bool isEmpty;

  UserResponseModel({
    required this.uniqueId,
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.token,
    required this.profilePhoto,
    this.isEmpty = true,
  }) : super(
            uniqueId: uniqueId,
            id: id,
            name: name,
            email: email,
            role: role,
            phone: phone,
            token: token,
            profilePhoto: profilePhoto);

  static UserResponseModel get empty => UserResponseModel(
      email: '',
      id: 0,
      name: '',
      profilePhoto: '',
      phone: null,
      role: '',
      token: '',
      uniqueId: '');

  factory UserResponseModel.frowJson(Map<String, dynamic> json) {
    try {
      return UserResponseModel(
        uniqueId: json["uniqueId"] ?? "",
        id: int.parse(json["id"] ?? "0"),
        name: json["name"],
        email: json["email"],
        phone: json["phone"] ?? "no",
        role: json["role"].toLowerCase(),
        token: json["token"],
        profilePhoto: json["profile_photo"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LoginResponseModel : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "uniqueId": uniqueId,
        "role": role,
        "phone": phone ?? "no",
        "token": token,
        "profile_photo": profilePhoto,
      };
}
