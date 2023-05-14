class LogInEntity {
  final String id;
  final String userName;
  final String userPassword;
  final bool isEmpty;

  LogInEntity({
    required this.id,
    required this.userName,
    required this.userPassword,
    this.isEmpty = true,
  });

  static LogInEntity get empty =>
      LogInEntity(id: "", userName: "", userPassword: "");

  factory LogInEntity.frowJson(Map<String, dynamic> json) {
    try {
      return LogInEntity(
        id: json["id"],
        userName: json["userName"],
        userPassword: json["userPassword"],
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
      };
}
