class LocationEntity {
  final int id;
  final String name;
  final bool isEmpty;

  LocationEntity({
    required this.id,
    required this.name,
    this.isEmpty = true,
  });

  static LocationEntity get empty => LocationEntity(id: 0, name: "");
}
