class SignUpEntity {
  final String uniqueId;
  final String userName;
  final String userPassword;
  final String userPhone;
  final String inviterLink;
  final bool isEmpty;

  SignUpEntity({
    required this.uniqueId,
    required this.userName,
    required this.userPassword,
    required this.userPhone,
    this.inviterLink = "",
    this.isEmpty = true,
  });

  static SignUpEntity get empty => SignUpEntity(
      uniqueId: "",
      userName: "",
      userPassword: "",
      userPhone: "",
      inviterLink: "");

  // factory SignUpEntity.frowJson(Map<String, dynamic> json) {
  //   try {
  //     return SignUpEntity(
  //       uniqueId: json["uniqueId"],
  //       userName: json["name"],
  //       userPassword: json["password"],
  //       userPhone: json["phone_num"],
  //       inviterLink: json["inviterLink"],
  //       isEmpty: false,
  //     );
  //   } catch (err) {
  //     throw ("Error in LogInEntity : $err");
  //   }
  // }

  // Map<String, dynamic> toJson() => {
  //       "uniqueId": uniqueId,
  //       "name": userName,
  //       "password": userPassword,
  //       "phone_num": userPhone,
  //       "inviterLink": inviterLink,
  //     };
}
