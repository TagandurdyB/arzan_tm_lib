class SignUpEntity {
  final String id;
  final String userName;
  final String userPassword;
  final String userPhone;
  final String inviterLink;
  final bool isEmpty;

  SignUpEntity({
    required this.id,
    required this.userName,
    required this.userPassword,
    required this.userPhone,
    this.inviterLink = "",
    this.isEmpty = true,
  });

  static SignUpEntity get empty => SignUpEntity(
      id: "", userName: "", userPassword: "", userPhone: "", inviterLink: "");

  factory SignUpEntity.frowJson(Map<String, dynamic> json) {
    try {
      return SignUpEntity(
        id: json["id"],
        userName: json["userName"],
        userPassword: json["userPassword"],
        userPhone: json["userPhone"],
        inviterLink: json["inviterLink"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userPassword": userPassword,
        "userPhone": userPhone,
        "inviterLink": inviterLink,
      };
}
