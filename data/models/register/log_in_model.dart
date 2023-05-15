// ignore_for_file: overridden_fields

import '../../../domanin/entities/register/log_in_entity.dart';

class LogInModel extends LogInEntity {
  @override
  final String uniqueId;
  @override
  final String userName;
  @override
  final String userPassword;
  @override
  final bool isEmpty;

  LogInModel({
    required this.uniqueId,
    required this.userName,
    required this.userPassword,
    this.isEmpty = true,
  }) : super(
          uniqueId: '',
          userName: '',
          userPassword: '',
        );

  static LogInModel get empty =>
      LogInModel(uniqueId: "", userName: "", userPassword: "");

  static LogInModel fromEntity(LogInEntity entity) {
    try {
      return LogInModel(
        uniqueId: entity.uniqueId,
        userName: entity.userName,
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
        userName: json["name"],
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
        "name": userName,
        "password": userPassword,
      };
}
