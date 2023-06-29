import '../../domanin/entities/discounts/discount_detal_entity.dart';
import '/domanin/entities/discounts/discount_category_entity.dart';

import '/domanin/entities/discounts/post_discount_entity.dart';
import '/domanin/entities/register/response_entity.dart';

import '../datasourses/remote/discounts_remote_datasource.dart';
import '../models/discount_models/post_discount_model.dart';
import '../../domanin/entities/discounts/discount_entity.dart';

import '../../domanin/repositories/discounts_reposotory.dart';

class DiscountsRepositoryImpl implements DiscountsRepository {
  final DiscountsRemoteDataSource discountsRemoteDataSource;
  DiscountsRepositoryImpl(this.discountsRemoteDataSource);
  @override
  Future<List<DiscountEntity>> getDiscounts(
      int limit, int offset, int categoryId, int subId) async {
    return await discountsRemoteDataSource.getDiscounts(
        limit, offset, categoryId, subId);
  }

  @override
  Future<List<DiscountEntity>> searchPost(String text) async {
    return await discountsRemoteDataSource.searchPost(text);
  }

  @override
  Future<List<DiscountEntity>> selfPost(int id) async {
    return await discountsRemoteDataSource.selfPost(id);
  }


  @override
  Future<List<DiscountEntity>> categoryPost(int id) async {
    return await discountsRemoteDataSource.categoryPost(id);
  }

  @override
  Future<List<DiscountEntity>> subCategoryPost(int id) async {
    return await discountsRemoteDataSource.subCategoryPost(id);
  }

  @override
  Future<DiscountDetalEntity> getDetal(int id) async {
    try {
      return await discountsRemoteDataSource.getDetal(id);
    } catch (err) {
      throw ("Error in getDetal($id):=$err");
    }
  }

  @override
  Future<ResponseEntity> postDiscount(PostDiscountEntity obj) async {
    final model = await discountsRemoteDataSource
        .postDiscount(PostDiscountModel.fromEntity(obj));
    return model;
  }

  @override
  Future<List<DiscountCategoryEntity>> discountCategories() async {
    try {
      return await discountsRemoteDataSource.discountCategories();
    } catch (err) {
      throw ("DiscountsRepositoryImpl>discountCategories Error :$err");
    }
  }

  // @override
  // Future<List<DiscountSubcategoryEntity>> discountSubs(int categoryID) async {
  //   try {
  //     return await discountsRemoteDataSource.discountSub(categoryID);
  //   } catch (err) {
  //     throw ("DiscountsRepositoryImpl>discountSub Error :$err");
  //   }
  // }

  @override
  Future<int> badgePost() async {
    return await discountsRemoteDataSource.badgePost();
  }
}
