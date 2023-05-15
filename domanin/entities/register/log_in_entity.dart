class LogInEntity {
  final String uniqueId;
  final String userName;
  final String userPassword;
  final bool isEmpty;

  LogInEntity({
    required this.uniqueId,
    required this.userName,
    required this.userPassword,
    this.isEmpty = true,
  });

  static LogInEntity get empty =>
      LogInEntity(uniqueId: "", userName: "", userPassword: "");

  factory LogInEntity.frowJson(Map<String, dynamic> json) {
    try {
      return LogInEntity(
        uniqueId: json["uniqueId"],
        userName: json["name"],
        userPassword: json["password"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in LogInEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "uniqueId": uniqueId,
        "name": userName,
        "password": userPassword,
      };
}
