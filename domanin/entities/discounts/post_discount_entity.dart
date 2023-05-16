class PostDiscountEntity {
  final List<String> images;
  final String name;
  final String description;
  final String hashtags;
  final String phone;
  final int price;
  final int oldPrice;
  final DateTime statedAt;
  final DateTime endedAt;
  final int categoryId;
  final int subCategoryId;
  final String welayat;
  final bool isEmpty;
  PostDiscountEntity({
    required this.images,
    required this.name,
    required this.description,
    required this.hashtags,
    required this.phone,
    required this.price,
    required this.oldPrice,
    required this.statedAt,
    required this.endedAt,
    this.subCategoryId = 0,
    this.categoryId = 0,
    this.welayat = "Balkan",
    this.isEmpty = true,
  });

  static PostDiscountEntity empty() => PostDiscountEntity(
        isEmpty: true,
        description: '',
        endedAt: DateTime.now(),
        hashtags: '',
        images: [],
        name: '',
        phone: '',
        oldPrice: 0,
        price: 0,
        statedAt: DateTime.now(),
      );

  // factory PostDiscountEntity.frowJson(Map<String, dynamic> json) =>
  //     PostDiscountEntity(
  //        userId: json["id"],
  //       description: json["id"],
  //       endedAt: json["id"],
  //       hashtags: json["id"],
  //       image: json["id"],
  //       name: json["id"],
  //       phone: json["id"],
  //       oldPrice: json["id"],
  //       price: json["id"],
  //       statedAt: json["id"],
  //       isEmpty: false,
  //     );

  Map<String, dynamic> toJson() => {
        "description": description,
        "endedAt": endedAt,
        "hashtags": hashtags,
        "name": name,
        "phone": phone,
        "oldPrice": oldPrice,
        "price": price,
        "statedAt": statedAt,
        "welayat": welayat,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
      };
}
