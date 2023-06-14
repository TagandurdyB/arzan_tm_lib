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

}
