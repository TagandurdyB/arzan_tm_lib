import '../widgets/images/image_card_group.dart';
import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';
import '/presentation/views/widgets/images/big_content_card.dart';

import '/config/system_info/my_size.dart';
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

  final List<BigImgCardEntity> objs = [
    BigImgCardEntity(
      id: 1,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
      name: "100haryt.com",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      about:
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
    BigImgCardEntity(
      id: 1,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
      name: "Mercedes-Benz",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      about:
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
      children: List.generate(
          2,
          (index) => BigContentCard(
                obj: objs[index],
                child: ImageCardGroup(
                  height: arentir * 0.35,
                  objs: objs[index].contents,
                ),
              )),
      //     children: [
      //   BigImgCardEntity(
      //     id: 1,
      //     userImg:
      //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
      //     banerImg:
      //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
      //     allCount: 12,
      //     allShaered: 720,
      //     allViewed: 14756,
      //     about:
      //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      //     contents: [
      //       ImgCardEntity(
      //         id: 1,
      //         img:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
      //         viewed: 1251,
      //         liked: 151,
      //         isEmpty: false,
      //       ),
      //       ImgCardEntity(
      //         id: 1,
      //         img:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
      //         viewed: 1251,
      //         liked: 151,
      //         isEmpty: false,
      //       ),
      //       ImgCardEntity(
      //         id: 1,
      //         img:
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-IF0u5AYxHvFLMIBjUxqWGHgnH5x4Us8Pg&usqp=CAU",
      //         viewed: 1251,
      //         liked: 151,
      //         isEmpty: false,
      //       ),
      //     ],
      //     isEmpty: false,
      //   ),
      // ].map((obj) => ImageBigCard(obj: obj)).toList(),
    );
  }
}
