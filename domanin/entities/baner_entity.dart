class BanerEntity {
  final int id;
  final String img;
  final String note;
  final String title;
  final bool isEmpty;
  BanerEntity({
    required this.id,
    required this.img,
    this.note = "",
    this.title = "",
    this.isEmpty = true,
  });

  static BanerEntity get empty => BanerEntity(id: 0, img: "");

  // factory BanerEntity.frowJson(Map<String, dynamic> json) {
  //   try {
  //     return BanerEntity(
  //         id: json["id"],
  //         img: json["img"],
  //         note: json["note"] ?? "",
  //         title: json["title"] ?? "",
  //         isEmpty: false);
  //   } catch (err) {
  //     throw ("Error in BanerEntity : $err");
  //   }
  // }

  // static List<BanerEntity> fromJsonList(List<Map<String, dynamic>> jsonList) =>
  //     jsonList.map((json) => BanerEntity.frowJson(json)).toList();
}
