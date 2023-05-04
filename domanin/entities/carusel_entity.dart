class CaruselEntity {
  final String node;
  final String imageUrl;
  final String title;
  final int id;
  final bool isEmpty;
  CaruselEntity({
    this.node = "",
    this.title = "",
    this.id = 0,
    required this.imageUrl,
    this.isEmpty = false,
  });

  static CaruselEntity empty() => CaruselEntity(
        imageUrl: "Url",
        isEmpty: true,
      );

  factory CaruselEntity.frowJson(Map<String, dynamic> json) => CaruselEntity(
        imageUrl: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": imageUrl,
        "id": id,
      };
}
