import '/domanin/entities/discounts/post_discount_entity.dart';

import '/domanin/entities/register/response_entity.dart';

import '../repositories/discounts_reposotory.dart';
import '/domanin/entities/main_page/discount_entity.dart';

class DiscountsCase {
  final DiscountsRepository repository;
  DiscountsCase(this.repository);

  Future<List<DiscountEntity>> get() async => await repository.getDiscounts();
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj) async =>
      await repository.postDiscount(obj);
}
