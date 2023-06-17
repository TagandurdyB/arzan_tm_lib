// ignore_for_file: overridden_fields

import '../../domanin/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool isEmpty;

  LocationModel({
    required this.id,
    required this.name,
    this.isEmpty = true,
  }) : super(id: 0, name: '', isEmpty: isEmpty);

  static LocationModel get empty => LocationModel(id: 0, name: "");

  factory LocationModel.frowJson(Map<String, dynamic> json) {
    try {
      return LocationModel(
        id: json["id"],
        name: json["name"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in BanerModel : $err");
    }
  }

  static List<LocationModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => LocationModel.frowJson(json)).toList();
}
