class ResponseEntity {
  final String message;
  final bool succsess;
  final String? token;
  final bool isEmpty;

  ResponseEntity({
    required this.message,
    required this.succsess,
    this.token,
    this.isEmpty = true,
  });

  static ResponseEntity get empty =>
      ResponseEntity(message: "", succsess: false);

  factory ResponseEntity.frowJson(Map<String, dynamic> json) {
    try {
      return ResponseEntity(
        message: json["message"],
        succsess: json["succsess"],
        token: json["token"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ResponseEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "succsess": succsess,
        "token": token,
      };
}
