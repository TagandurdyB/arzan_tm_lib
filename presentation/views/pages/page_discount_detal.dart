// ignore_for_file: must_be_immutable

import 'package:arzan_tm/presentation/views/widgets/shimmer_img.dart';

import '../../../config/services/my_size.dart';
import '../widgets/custom_avatar.dart';
import '/domanin/entities/discount_detal_entity.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';

class DiscountDetal extends StatelessWidget {
  final DiscountDetalEntity obj;
  DiscountDetal({required this.obj, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
      body: Column(children: [
        CustomAppBar(
          titleW: buildTitle(obj.userImg, obj.userName),
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        ))
      ]),
    );
  }

  Widget buildTitle(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.08,
            borderWidth: 2,
          ),
          buildStar,
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Expanded(child: SizedBox()),
          // AllBtn(onTap: () {
          //   if (onTap != null) onTap!();
          // })
        ],
      ),
    );
  }

  Container get buildStar {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 15,
      ),
    );
  }

  Widget get buildContent {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: arentir * 0.9,
          width: double.infinity,
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              ShimmerImg(imageUrl: obj.pictures.first),
              ShimmerImg(imageUrl: obj.pictures.first),
            ],
          ),
        )
      ],
    );
  }
}
