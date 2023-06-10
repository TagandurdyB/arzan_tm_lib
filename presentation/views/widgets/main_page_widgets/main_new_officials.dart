import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';

import '../../../../domanin/entities/main_page/main_new_officials_entity.dart';
import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import '../card_title.dart';

class MainNewOfficials extends StatelessWidget {
  final List<NewOfficialsEntity> objs;
  MainNewOfficials({required this.objs, super.key});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardTitle(counter: 65, title: "Täze resmiler "),
        SizedBox(
          // color: Colors.red,
          width: double.infinity,
          height: arentir * 0.3,
          child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: objs.map((obj) => buildCards(obj)).toList()),
        ),
      ],
    );
  }

  Widget buildCards(NewOfficialsEntity obj) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(right: arentir * 0.02),
      width: arentir * 0.29,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ShimmerImg(imageUrl: obj.officialImg),
    );
  }
}
