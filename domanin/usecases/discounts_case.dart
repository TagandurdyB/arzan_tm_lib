import '../entities/discounts/discount_detal_entity.dart';
import '/domanin/entities/discounts/post_discount_entity.dart';

import '/domanin/entities/register/response_entity.dart';

import '../repositories/discounts_reposotory.dart';
import '../entities/discounts/discount_entity.dart';

class DiscountsCase {
  final DiscountsRepository repository;
  DiscountsCase(this.repository);

  Future<List<DiscountEntity>> get(
          int limit, int offset, int categoryId, int subId) async =>
      await repository.getDiscounts(limit, offset, categoryId, subId);
  Future<DiscountDetalEntity> detal(int id) async =>
      await repository.getDetal(id);
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj) async =>
      await repository.postDiscount(obj);
  Future<List> categories() async => await repository.discountCategories();

  Future<List<DiscountEntity>> searchPost(String text) async =>
      await repository.searchPost(text);

        Future<List<DiscountEntity>> selfPost(int id) async =>
      await repository.selfPost(id);

  Future<List<DiscountEntity>> categoryPost(int id) async =>
      await repository.categoryPost(id);
  Future<List<DiscountEntity>> subCategoryPost(int id) async =>
      await repository.subCategoryPost(id);

  Future<int> badgePost() async => await repository.badgePost();
  // Future<List> subs(int categoryID) async =>
  //     await repository.discountSubs(categoryID);
}
