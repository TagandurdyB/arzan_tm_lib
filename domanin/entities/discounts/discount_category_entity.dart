class DiscountCategoryEntity {
  final int id;
  final String? imgUrl;
  final String name;
  final int count;
  List<DiscountSubcategoryEntity> subs;
  final bool isEmpty;

  DiscountCategoryEntity({
    required this.id,
    this.imgUrl,
    required this.name,
    required this.count,
    this.subs = const [],
    this.isEmpty = true,
  });

  DiscountCategoryEntity forSubList(List<DiscountSubcategoryEntity> csubs) =>
      DiscountCategoryEntity(
        id: id,
        count: count,
        name: name,
        imgUrl: imgUrl,
        isEmpty: isEmpty,
        subs: csubs,
      );
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
