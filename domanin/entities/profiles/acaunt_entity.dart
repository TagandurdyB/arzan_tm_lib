class AcauntEntity {
  final int id;
  final int num;
  final String avatarImg;
  final String name;
  final int coin;
  final bool isEmpty;
  AcauntEntity({
    required this.id,
    this.num = 0,
    this.avatarImg = "",
    this.name = "",
    this.coin = 0,
    this.isEmpty = true,
  });

  static AcauntEntity empty() => AcauntEntity(
        id: 0,
        isEmpty: true,
      );

  factory AcauntEntity.frowJson(Map<String, dynamic> json) => AcauntEntity(
        id: json["id"],
        num: json["num"],
        avatarImg: json["avatarImg"],
        name: json["name"],
        coin: json["coin"],
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "avatarImg": avatarImg,
        "name": name,
        "coin": coin,
        "isEmpty": isEmpty,
      };
}
