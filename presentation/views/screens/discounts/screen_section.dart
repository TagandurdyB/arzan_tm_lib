// ignore_for_file: must_be_immutable

import 'package:provider/provider.dart';

import '/presentation/providers/data/discount_data_provider.dart';

import '../../../../domanin/entities/discounts/discount_category_entity.dart';

import '../../../../domanin/entities/discounts/discount_entity.dart';
import '../../pages/discount/page_discounts_in.dart';
import '/presentation/views/widgets/custom_dropdown.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class DiscountSections extends StatelessWidget {
  DiscountSections({super.key});

  // List<DiscountCategoryEntity> objs = [
  //   DiscountCategoryEntity(id: 1, name: "Telefonlar", count: 35977, subs: [
  //     DiscountSubcategoryEntity(id: 1, name: "Telefonlar"),
  //     DiscountSubcategoryEntity(id: 2, name: "Planşetlar"),
  //     DiscountSubcategoryEntity(id: 3, name: "Öý telefonlar"),
  //     DiscountSubcategoryEntity(id: 4, name: "Akylly sagatlar"),
  //   ]),
  //   DiscountCategoryEntity(id: 1, name: "Öý tehnikasy", count: 17519, subs: [
  //     DiscountSubcategoryEntity(id: 1, name: "Telefonlar"),
  //     DiscountSubcategoryEntity(id: 2, name: "Planşetlar"),
  //     DiscountSubcategoryEntity(id: 3, name: "Öý telefonlar"),
  //     DiscountSubcategoryEntity(id: 4, name: "Akylly sagatlar"),
  //   ]),
  //   DiscountCategoryEntity(id: 1, name: "Öý tehnikasy", count: 17519, subs: [
  //     DiscountSubcategoryEntity(id: 1, name: "Telefonlar"),
  //     DiscountSubcategoryEntity(id: 2, name: "Planşetlar"),
  //     DiscountSubcategoryEntity(id: 3, name: "Öý telefonlar"),
  //     DiscountSubcategoryEntity(id: 4, name: "Akylly sagatlar"),
  //   ]),
  // ];
  late List objs;

  @override
  Widget build(BuildContext context) {
    objs = context.watch<DiscountDataP>().categories;
    return SliverList(
      delegate: SliverChildListDelegate(
          objs.map((obj) => SectionCard(obj: obj)).toList()),
    );
  }
}

class SectionCard extends StatelessWidget {
  final DiscountCategoryEntity obj;
  SectionCard({required this.obj, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return buildConent(context, obj);
  }

  Column buildConent(BuildContext context, DiscountCategoryEntity obj) {
    return Column(
      children: [
        CustomDropDown(
          isBorder: false,
          isOpen: false,
          mainValue: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${obj.name} (${obj.subs.length})",
              style: TextStyle(
                  fontSize: arentir * 0.04, fontWeight: FontWeight.bold),
            ),
          ),
          onChange: (index) {
            print("index:=$index  id:=${obj.subs[index].id}");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DiscountsInPage(
                          title: "${obj.name} / ${obj.subs[index].name}",
                          count: obj.count,
                          id: obj.id,
                          isSub: true,
                          // objs: [
                          //   DiscountEntity(
                          //     id: 1,
                          //     createdAt: DateTime.now(),
                          //     img:
                          //         "https://img.freepik.com/free-photo/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643.jpg",
                          //     mod: 23,
                          //     title: "Mebel zakaz alyarys islendik gornusde",
                          //     description:
                          //         "Mebel zakaz alyarysasdasd islendik gornusde",
                          //     viewed: 121,
                          //   ),
                          // ],
                        )));
          },
          items: obj.subs
              .map((e) => Container(
                  // color: Colors.red,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    e.name,
                    style: TextStyle(
                        fontSize: arentir * 0.035, fontWeight: FontWeight.bold),
                  )))
              .toList(),
        ),
        const Divider(
          color: Color(0xffE5E5E5),
        ),
      ],
    );
  }
}
