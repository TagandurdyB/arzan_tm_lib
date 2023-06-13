import '/domanin/entities/discounts/post_discount_entity.dart';

import '/domanin/entities/register/response_entity.dart';

import '../repositories/discounts_reposotory.dart';
import '../entities/discounts/discount_entity.dart';

class DiscountsCase {
  final DiscountsRepository repository;
  DiscountsCase(this.repository);

  Future<List<DiscountEntity>> get() async => await repository.getDiscounts();
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj) async =>
      await repository.postDiscount(obj);
  Future<List> categories() async => await repository.discountCategories();
  Future<List> subs(int categoryID) async =>
      await repository.discountSubs(categoryID);
}
