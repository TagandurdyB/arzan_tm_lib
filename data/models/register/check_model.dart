// ignore_for_file: overridden_fields

import '/domanin/entities/register/check_entity.dart';

class CheckModel extends CheckEntity {
  @override
  final String uniqueId;
  @override
  final String phone;
  @override
  final bool isEmpty;

  CheckModel({
    required this.uniqueId,
    required this.phone,
    this.isEmpty = true,
  }) : super(phone: phone, uniqueId: uniqueId);

  static CheckModel get empty => CheckModel(uniqueId: "", phone: "");

  factory CheckModel.frowJson(Map<String, dynamic> json) {
    try {
      return CheckModel(
        uniqueId: json["uniqueId"],
        phone: json["phone"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in CheckEntity : $err");
    }
  }

  static CheckModel fromEntity(CheckEntity entity) {
    try {
      return CheckModel(
        uniqueId: entity.uniqueId,
        phone: entity.phone,
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in CheckEntity fromEntity: $err");
    }
  }

  @override
  Map<String, dynamic> toJson() => {
        "device_id": uniqueId,
        "phone": phone,
      };
}
