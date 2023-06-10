import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class DiscountSections extends StatelessWidget {
  const DiscountSections({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        CategoryCard(),
        CategoryCard(),
      ]),
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
  CategoryCard({super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: arentir * 0.2,
      width: double.infinity,
    );
  }
}
