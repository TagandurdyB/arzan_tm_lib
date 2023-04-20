class ChosenEntity {
  final String name;
  final String imageUrl;
  final DateTime date;
  ChosenEntity({
    required this.name,
    required this.imageUrl,
    required this.date,
  });

  static ChosenEntity empty() =>
      ChosenEntity(name: "Name", date: DateTime.now(), imageUrl: "Url");

  String get formatDate {
    return "${date.day}.${date.month}.${date.year}";
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
