class MainPageCardEntity {
  final int count;
  final String img;
  final bool isEmpty;
  MainPageCardEntity({this.count = 0, required this.img, this.isEmpty=true});

  static MainPageCardEntity get empty => MainPageCardEntity(
        count: 0,
        img: "",
        isEmpty: false,
      );

  factory MainPageCardEntity.frowJson(Map<String, dynamic> json) {
    try {
      return MainPageCardEntity(
        count: json["count"],
        img: json["img"],
      );
    } catch (err) {
      throw("Error in MainPageCardEntity : $err");
    }
  }
}