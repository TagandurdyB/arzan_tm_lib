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
  Future<List<DiscountEntity>> getDiscounts() async {
    return await discountsRemoteDataSource.getDiscounts();
  }

 @override
  Future<DiscountDetalEntity> getDetal(int id) async {
    return await discountsRemoteDataSource.getDetal(id);
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
}
