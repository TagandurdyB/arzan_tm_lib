import '../../config/vars/formater.dart';

class ChosenEntity {
  final String name;
  final String imageUrl;
  final DateTime date;
  final bool isEmpty;
  ChosenEntity({
    required this.name,
    required this.imageUrl,
    required this.date,
    this.isEmpty = false,
  });

  static ChosenEntity empty() => ChosenEntity(
        name: "Name",
        date: DateTime.now(),
        imageUrl: "Url",
        isEmpty: true,
      );

  String get formatDate {
    return Formater.calendar(date);
  }

  factory ChosenEntity.frowJson(Map<String, dynamic> json) => ChosenEntity(
        name: json["name"],
        imageUrl: json["image"],
        date: json["create_time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": imageUrl,
        "create_time": date,
      };
}
