// ignore_for_file: overridden_fields

import '../../../domanin/entities/register/log_in_entity.dart';

class LogInModel extends LoginEntity {
  @override
  final String uniqueId;
  @override
  final String phone;
  @override
  final String userPassword;
  @override
  final bool isEmpty;

  LogInModel({
    required this.uniqueId,
    required this.phone,
    required this.userPassword,
    this.isEmpty = true,
  }) : super(
          uniqueId: '',
          phone: '',
          userPassword: '',
        );

  static LogInModel get empty =>
      LogInModel(uniqueId: "", phone: "", userPassword: "");

  static LogInModel fromEntity(LoginEntity entity) {
    try {
      return LogInModel(
        uniqueId: entity.uniqueId,
        phone: entity.phone,
        userPassword: entity.userPassword,
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity fromEntity: $err");
    }
  }

  factory LogInModel.frowJson(Map<String, dynamic> json) {
    try {
      return LogInModel(
        uniqueId: json["uniqueId"],
        phone: json["name"],
        userPassword: json["password"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        // "uniqueId": uniqueId,
        "phone": phone,
        "password": userPassword,
      };
}
