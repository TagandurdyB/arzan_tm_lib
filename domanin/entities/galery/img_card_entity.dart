class ImgCardEntity {
  final int id;
  final String img;
  final int viewed;
  final int liked;
  final bool isEmpty;
  ImgCardEntity({
    required this.id,
    this.img = "",
    this.viewed = 0,
    this.liked = 0,
    this.isEmpty = true,
  });

  static ImgCardEntity empty() => ImgCardEntity(id: 0);

  factory ImgCardEntity.frowJson(Map<String, dynamic> json) => ImgCardEntity(
        id: json["id"],
        img: json["img"],
        viewed: json["viewed"],
        liked: json["liked"],
        isEmpty: false,
      );

  static List<ImgCardEntity> frowJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => ImgCardEntity.frowJson(json)).toList();

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "viewed": viewed,
        "liked": liked,
        "isEmpty": isEmpty,
      };
}
