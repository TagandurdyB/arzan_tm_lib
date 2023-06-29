class UserProfileEntity {
  final int id;
  final String name;
  final String phone;
  final String? avatarImg;
  final int expected;
  final int notAccepted;
  final int confirmed;
  final int likeCont;
  final int postCount;
  final int? coin;
  final bool isEmpty;

  UserProfileEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.avatarImg,
    required this.expected,
    required this.notAccepted,
    required this.confirmed,
    this.likeCont=0, 
    this.postCount=0,
    required this.coin,
    this.isEmpty = true,
  });

  static UserProfileEntity get empty => UserProfileEntity(
    id:0,
        coin: 0,
        confirmed: 0,
        expected: 0,
        name: '*Arzan TM*',
        notAccepted: 0,
        phone: '+99360000000',
      );

  // factory UserProfileEntity.frowJson(Map<String, dynamic> json) =>
  //     UserProfileEntity(
  //       avatarImg: json["avatarImg"],
  //       name: json["name"],
  //       coin: json["coin"],
  //       confirmed: json["confirmed"],
  //       expected: json["expected"],
  //       notAccepted: json["notAccepted"],
  //       phone: json["phone"],
  //       isEmpty: false,
  //     );

  // Map<String, dynamic> toJson() => {
  //       "confirmed": confirmed,
  //       "expected": expected,
  //       "notAccepted": notAccepted,
  //       "phone": phone,
  //       "avatarImg": avatarImg,
  //       "name": name,
  //       "coin": coin,
  //       "isEmpty": isEmpty,
  //     };
}
