// ignore_for_file: must_be_immutable

import 'package:provider/provider.dart';

import '../../../providers/data/discount_data_provider.dart';
import '/domanin/entities/discounts/discount_entity.dart';

import '/presentation/views/pages/discount/page_discounts_in.dart';
import '/presentation/views/widgets/shimmer_img.dart';

import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discounts/discount_category_entity.dart';
import '../../../providers/view/provider_theme.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class DiscountCategories extends StatelessWidget {
  const DiscountCategories({super.key});

  // List<DiscountCategoryEntity> objs = [
  //   DiscountCategoryEntity(
  //       id: 1,
  //       imgUrl:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
  //       name: "Telefonlar",
  //       count: 35977),
  //   DiscountCategoryEntity(
  //       id: 2,
  //       imgUrl:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
  //       name: "Kompýuterler we enjamlar",
  //       count: 9812),
  //   DiscountCategoryEntity(
  //       id: 3,
  //       imgUrl:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRErhjxl_5_I-okYpJldhRQi10h1GKbWHboyQ&usqp=CAU",
  //       name: "Telefonlar",
  //       count: 35977),
  // ];
  @override
  Widget build(BuildContext context) {
    final objs = context.watch<DiscountDataP>().categories;
    return  SliverList(
        delegate: SliverChildListDelegate(
            objs.map((obj) => CategoryCard(objc: obj)).toList()),
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
  final Future objc;
  CategoryCard({required this.objc, super.key});

  final double arentir = MySize.arentir;

  Future fetchData() async => await objc;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, ss) {
          if (ss.hasError) {
            return const Text("Error get data");
          } else if (ss.hasData) {
            return buildContent(context, ss.data);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  GestureDetector buildContent(
      BuildContext context, DiscountCategoryEntity obj) {
    return GestureDetector(
      onTap: () {
        final List<DiscountEntity> objs = [
          DiscountEntity(
            id: 1,
            createdAt: DateTime.now(),
            img:
                "https://img.freepik.com/free-photo/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643.jpg",
            mod: 23,
            title: "Mebel zakaz alyarys islendik gornusde",
            viewed: 121,
          ),
        ];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DiscountsInPage(
                    title: obj.name, count: obj.count, objs: objs)));
      },
      child: Container(
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
                  child: ShimmerImg(
                      fit: BoxFit.fitWidth, imageUrl: obj.imgUrl ?? "")),
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
      ),
    );
  }
}
