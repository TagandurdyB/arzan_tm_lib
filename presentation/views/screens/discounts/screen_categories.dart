// ignore_for_file: must_be_immutable

import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';

import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discounts/category_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class DiscountCategories extends StatelessWidget {
  DiscountCategories({super.key});

  List<DiscoutCategoryEntity> objs = [
    DiscoutCategoryEntity(
        id: 1,
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
        name: "Telefonlar",
        count: 35977),
    DiscoutCategoryEntity(
        id: 2,
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
        name: "Kompýuterler we enjamlar",
        count: 9812),
    DiscoutCategoryEntity(
        id: 3,
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
        name: "Telefonlar",
        count: 35977),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
          objs.map((obj) => CategoryCard(obj: obj)).toList()),
    );
  }

  // SliverList(
  //             delegate: SliverChildListDelegate([
  //           buildSlider,
  //           // MainMarketsView(objs: objM.markets),
  //           buildSliverList(context),
  //         ]))
}

class CategoryCard extends StatelessWidget {
  final DiscoutCategoryEntity obj;
  CategoryCard({required this.obj, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: arentir * 0.02),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          // color: Colors.red,
          borderRadius: BorderRadius.circular(arentir * 0.02),
          boxShadow: ThemeP.of(context).shadows.discount),
      height: arentir * 0.3,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
                height: arentir * 0.1,
                width: double.infinity,
                child: ShimmerImg(fit: BoxFit.fitWidth, imageUrl: obj.imgUrl)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${obj.name} (${Formater.rounder(obj.count)})",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
