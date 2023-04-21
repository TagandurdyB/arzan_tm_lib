class DiscountEntity {
  final String name;
  final String imageUrl;
  final String about;
  final DateTime date;
  final int viewNum;
  final bool isEmpty;
  DiscountEntity({
    required this.name,
    required this.imageUrl,
    required this.viewNum,
    required this.date,
    this.about = "",
    this.isEmpty = false,
  });

  static DiscountEntity empty() => DiscountEntity(
        name: "Name",
        imageUrl: "Url",
        viewNum: 0,
        date: DateTime.now(),
        isEmpty: true,
      );

  factory DiscountEntity.frowJson(Map<String, dynamic> json) => DiscountEntity(
        name: json["name"],
        imageUrl: json["image"],
        viewNum: json["view_num"],
        about: json["about"],
        date: json["create_time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": imageUrl,
        "view_num": viewNum,
        "about": about,
        "create_time": date,
      };
}
