class UserProfileEntity {
  final String name;
  final String phone;
  final String? avatarImg;
  final int expected;
  final int notAccepted;
  final int confirmed;
  final int coin;
  final bool isEmpty;

  UserProfileEntity({
    required this.name,
    required this.phone,
    this.avatarImg,
    required this.expected,
    required this.notAccepted,
    required this.confirmed,
    required this.coin,
    this.isEmpty = true,
  });

  static UserProfileEntity empty() => UserProfileEntity(
        coin: 0,
        confirmed: 0,
        expected: 0,
        name: '*Arzan TM*',
        notAccepted: 0,
        phone: '+99360000000',
      );

  factory UserProfileEntity.frowJson(Map<String, dynamic> json) =>
      UserProfileEntity(
        avatarImg: json["avatarImg"],
        name: json["name"],
        coin: json["coin"],
        confirmed: json["confirmed"],
        expected: json["expected"],
        notAccepted: json["notAccepted"],
        phone: json["phone"],
        isEmpty: false,
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "expected": expected,
        "notAccepted": notAccepted,
        "phone": phone,
        "avatarImg": avatarImg,
        "name": name,
        "coin": coin,
        "isEmpty": isEmpty,
      };
}
