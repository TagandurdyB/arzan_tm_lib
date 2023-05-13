class DiscountEntity {
  final int id;
  final int viewed;
  final String img;
  final DateTime createdAt;
  final String title;
  final bool isEmpty;
  DiscountEntity({
    required this.id,
    required this.viewed,
    required this.img,
    required this.createdAt,
    required this.title,
     this.isEmpty=true,
  });

  static DiscountEntity get empty => DiscountEntity(
        id: 0,
        viewed: 0,
        img: "",
        createdAt: DateTime.now(),
        title: "",
        isEmpty: false,
      );

  factory DiscountEntity.frowJson(Map<String, dynamic> json) {
    try {
      return DiscountEntity(
        id: json["id"],
        viewed: json["viewed"],
        img: json["img"],
        createdAt: json["created_at"],
        title: json["title"],
      );
    } catch (err) {
      throw("Error in DiscountEntity : $err");
    }
  }

  static List<DiscountEntity> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => DiscountEntity.frowJson(json)).toList();
}