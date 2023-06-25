class ValueEntity {
  final int id;
  final String name;
  final int count;
  final String? img;
  final bool isEmpty;

  ValueEntity({
    required this.id,
    required this.name,
    this.count = 0,
    this.img,
    this.isEmpty = true,
  });

  static ValueEntity get empty => ValueEntity(id: 0, name: "");
}
