// ignore_for_file: overridden_fields

import '../../domanin/entities/value_entity.dart';

class ValueModel extends ValueEntity {
  @override
  final int id;
  @override
  final String name;
    @override
  final int count;
  @override
  final bool isEmpty;

  ValueModel({
    required this.id,
    this.count=0,
    required this.name,
    this.isEmpty = true,
  }) : super(id: 0, name: '', isEmpty: isEmpty);

  static ValueModel get empty => ValueModel(id: 0, name: "");

  factory ValueModel.frowJson(Map<String, dynamic> json) {
    try {
      return ValueModel(
        id: json["id"],
        name: json["name"],
        count: json["count"]??0,
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in BanerModel : $err");
    }
  }

  static List<ValueModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => ValueModel.frowJson(json)).toList();
}
