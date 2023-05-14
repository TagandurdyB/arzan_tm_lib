class DiscountEntity {
  final int id;
  final int mod;
  final int viewed;
  final String img;
  final DateTime createdAt;
  final String title;
  DiscountEntity({
    required this.id,
    required this.mod,
    required this.viewed,
    required this.img,
    required this.createdAt,
    required this.title,
  });

  static DiscountEntity get empty => DiscountEntity(
        id: 0,
        mod: 0,
        viewed: 0,
        img: "",
        createdAt: DateTime.now(),
        title: "",
      );

  factory DiscountEntity.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountEntity(
        id: json["id"],
        mod: json["mod"],
        viewed: json["viewed"],
        img: json["img"],
        createdAt: json["created_at"],
        title: json["title"],
      );
    } catch (err) {
      throw ("Error in DiscountEntity : $err");
    }
  }

  static List<DiscountEntity> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => DiscountEntity.frowJson(json)).toList();
}
