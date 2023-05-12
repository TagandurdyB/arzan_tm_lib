// ignore_for_file: must_be_immutable

import '/presentation/views/pages/page_image_detal.dart';

import '../widgets/galery/image_card_group.dart';
import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';
import '../widgets/galery/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  ImagesPage({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(title: "Surat"),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        )),
      ],
    ));
  }

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          buildTitle,
          buildCards(),
          SizedBox(height: arentir * 0.2),
        ],
      ),
    );
  }

  Widget get buildTitle {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Telefonlar",
            style: TextStyle(color: Color(0xff00C52B)),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xff00C52B),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: const Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  final List<BigCardEntity> objs = [
    BigCardEntity(
      id: 1,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
      userName: "100haryt.com",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      name:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      contents: [
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
      ],
      isEmpty: false,
    ),
    BigCardEntity(
      id: 1,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
      userName: "Mercedes-Benz",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      name:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      contents: [
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTV7SioPJXqa9qgZGpyCYywI92837qWq0ohg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
        ImgCardEntity(
          id: 1,
          img:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTV7SioPJXqa9qgZGpyCYywI92837qWq0ohg&usqp=CAU",
          viewed: 1251,
          liked: 151,
          isEmpty: false,
        ),
      ],
      isEmpty: false,
    ),
  ];

  Widget buildCards() {
    return Column(
        children: objs
            .map((obj) => BigContentCard(
                  allFunc: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageDetalPage(obj: obj))),
                  obj: obj,
                  child: ImageCardGroup(
                    height: arentir * 0.35,
                    objs: obj.contents,
                  ),
                ))
            .toList());
  }
}
