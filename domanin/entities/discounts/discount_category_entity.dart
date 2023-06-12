class DiscountCategoryEntity {
  final int id;
  final String? imgUrl;
  final String name;
  final int count;
  final List<DiscountSubcategoryEntity> subs;
  final bool isEmpty;

  DiscountCategoryEntity({
    required this.id,
    this.imgUrl,
    required this.name,
    required this.count,
    this.subs = const [],
    this.isEmpty = true,
  });
}

class DiscountSubcategoryEntity {
  final int id;
  final String name;
  final bool isEmpty;

  DiscountSubcategoryEntity({
    required this.id,
    required this.name,
    this.isEmpty = true,
  });
}
