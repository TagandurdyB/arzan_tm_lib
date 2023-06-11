class DiscountSectionEntity {
  final int id;
  final String name;
  final int count;
  final List<DiscoutSubsectionEntity> subs;

  DiscountSectionEntity({
    required this.id,
    required this.name,
    required this.count,
    required this.subs,
  });
}

class DiscoutSubsectionEntity {
  final int id;
  final String name;

  DiscoutSubsectionEntity({
    required this.id,
    required this.name,
  });
}
