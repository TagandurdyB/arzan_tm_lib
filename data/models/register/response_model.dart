// ignore_for_file: overridden_fields

import '/domanin/entities/register/response_entity.dart';

class ResponseModel extends ResponseEntity {
  @override
  final String message;
  @override
  final bool succsess;
  @override
  final String? token;
  @override
  final bool isEmpty;

  ResponseModel({
    required this.message,
    required this.succsess,
    this.token,
    this.isEmpty = true,
  }) : super(message: message, succsess: succsess, token: token);

  static ResponseModel get empty => ResponseModel(message: "", succsess: false);

  factory ResponseModel.frowJson(Map<String, dynamic> json) {
    try {
      return ResponseModel(
        message: json["message"],
        succsess: json["success"],
        token: json["token"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ResponseEntity : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "succsess": succsess,
        "token": token,
      };
}
