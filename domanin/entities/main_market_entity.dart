class MainMarketEntity {
  final String imageUrl;
  final String name;
  final int id;
  final int num;
  final bool isEmpty;
  MainMarketEntity({
    this.num = 0,
    this.name = "",
    this.id = 0,
    required this.imageUrl,
    this.isEmpty = false,
  });

  static MainMarketEntity empty() => MainMarketEntity(
        imageUrl: "Url",
        isEmpty: true,
      );

  factory MainMarketEntity.frowJson(Map<String, dynamic> json) =>
      MainMarketEntity(
        imageUrl: json["image"],
        name: json["name"],
        id: json["id"],
        num: json["num"],
      );

  Map<String, dynamic> toJson() => {
        "image": imageUrl,
        "id": id,
        "name": name,
        "num": num,
      };
}
