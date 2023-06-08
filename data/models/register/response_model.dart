// ignore_for_file: overridden_fields

import '/domanin/entities/register/response_entity.dart';

class ResponseModel extends ResponseEntity {
  @override
  final String result;
  @override
  final bool status;
  @override
  final String? token;
  @override
  final bool isEmpty;

  ResponseModel({
    required this.result,
    required this.status,
    this.token,
    this.isEmpty = true,
  }) : super(result: result, status: status, token: token);

  static ResponseModel get empty => ResponseModel(result: "", status: false);

  factory ResponseModel.frowJson(Map<String, dynamic> json) {
    try {
      return ResponseModel(
        result: json["result"],
        status: json["status"]=="true",
        token: json["token"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ResponseEntity : $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "message": result,
        "succsess": status,
        "token": token,
      };
}
