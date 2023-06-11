import '../../../../config/vars/formater.dart';
import '../../../../domanin/entities/discounts/discount_entity.dart';
import '../../pages/discount/page_discounts_in.dart';
import '/presentation/views/widgets/custom_dropdown.dart';

import '../../../../domanin/entities/discounts/section_entity.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class DiscountSections extends StatelessWidget {
  DiscountSections({super.key});

  List<DiscountSectionEntity> objs = [
    DiscountSectionEntity(id: 1, name: "Telefonlar", count: 35977, subs: [
      DiscoutSubsectionEntity(id: 1, name: "Telefonlar"),
      DiscoutSubsectionEntity(id: 2, name: "Planşetlar"),
      DiscoutSubsectionEntity(id: 3, name: "Öý telefonlar"),
      DiscoutSubsectionEntity(id: 4, name: "Akylly sagatlar"),
    ]),
    DiscountSectionEntity(id: 1, name: "Öý tehnikasy", count: 17519, subs: [
      DiscoutSubsectionEntity(id: 1, name: "Telefonlar"),
      DiscoutSubsectionEntity(id: 2, name: "Planşetlar"),
      DiscoutSubsectionEntity(id: 3, name: "Öý telefonlar"),
      DiscoutSubsectionEntity(id: 4, name: "Akylly sagatlar"),
    ]),
    DiscountSectionEntity(id: 1, name: "Öý tehnikasy", count: 17519, subs: [
      DiscoutSubsectionEntity(id: 1, name: "Telefonlar"),
      DiscoutSubsectionEntity(id: 2, name: "Planşetlar"),
      DiscoutSubsectionEntity(id: 3, name: "Öý telefonlar"),
      DiscoutSubsectionEntity(id: 4, name: "Akylly sagatlar"),
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
          objs.map((obj) => SectionCard(obj: obj)).toList()),
    );
  }
}

class SectionCard extends StatelessWidget {
  final DiscountSectionEntity obj;
  SectionCard({required this.obj, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDown(
          isBorder: false,
          isOpen: false,
          mainValue: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${obj.name} (${Formater.rounder(obj.count)})",
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
                          objs: [
                            DiscountEntity(
                              id: 1,
                              createdAt: DateTime.now(),
                              img:
                                  "https://img.freepik.com/free-photo/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy_1258-154643.jpg",
                              mod: 23,
                              title: "Mebel zakaz alyarys islendik gornusde",
                              viewed: 121,
                            ),
                          ],
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
