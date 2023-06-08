class ResponseEntity {
  final String result;
  final bool status;
  final String? token;
  final bool isEmpty;

  ResponseEntity({
    required this.result,
    required this.status,
    this.token,
    this.isEmpty = true,
  });

  static ResponseEntity get empty => ResponseEntity(result: "", status: false);

  factory ResponseEntity.frowJson(Map<String, dynamic> json) {
    try {
      return ResponseEntity(
        result: json["message"],
        status: json["succsess"],
        token: json["token"],
        isEmpty: false,
      );
    } catch (err) {
      throw ("Error in ResponseEntity : $err");
    }
  }

  Map<String, dynamic> toJson() => {
        "message": result,
        "succsess": status,
        "token": token,
      };
}
