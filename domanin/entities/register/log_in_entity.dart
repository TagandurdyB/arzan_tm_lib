class LoginEntity {
  final String uniqueId;
  final String phone;
  final String userPassword;
  final bool isEmpty;

  LoginEntity({
    required this.uniqueId,
    required this.phone,
    required this.userPassword,
    this.isEmpty = true,
  });

  static LoginEntity get empty =>
      LoginEntity(uniqueId: "", phone: "", userPassword: "");

  factory LoginEntity.frowJson(Map<String, dynamic> json) {
    try {
      return LoginEntity(
        uniqueId: json["uniqueId"],
        phone: json["phone"],
        userPassword: json["password"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "device_id": uniqueId,
        "phone": phone,
        // "password": userPassword,
      };
}
