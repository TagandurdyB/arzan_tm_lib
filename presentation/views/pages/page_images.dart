// ignore_for_file: must_be_immutable

import '/presentation/views/widgets/galery/folder_cards/midle_folder_card.dart';
import '/presentation/views/widgets/galery/folder_cards/small_folder_card.dart';

import '/presentation/providers/data/main_page_provider.dart';
import '/presentation/views/widgets/card_title.dart';

import '../../providers/view/provider_discaunts.dart';
import '../widgets/carusel_slider.dart';
import '/presentation/views/pages/page_image_detal.dart';

import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  ImagesPage({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  late DiscountProvid providD, providDdo;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
          // title: "Surat",
          titleW: CardTitle(
            counter: 23,
            title: "Surat",
            txtSize: arentir * 0.05,
          ),
          actions: [
            GestureDetector(
                onTap: () => providDdo.tongleColumn,
                child: Icon(buildWidgetIconD(providD.cloumnCount)))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        )),
      ],
    ));
  }

  IconData buildWidgetIconD(int cloumnCount) {
    switch (cloumnCount) {
      case 1:
        return Icons.list;
      case 2:
        return Icons.widgets_outlined;
      case 3:
        return Icons.apps_sharp;

      default:
        return Icons.list;
    }
  }

  Widget get buildBanner {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCarusel(
        items: MainPageP.of(context).entity.baners.map((e) => e).toList(),
      ),
    );
  }

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          buildBanner,
          SizedBox(height: arentir * 0.02),
          buildCards(),
          SizedBox(height: arentir * 0.2),
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
      isEmpty: false,
    ),
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
      isEmpty: false,
    ),
  ];

  Widget buildCards() {
    return Wrap(
        spacing: arentir * 0.03,
        children: objs.map((obj) {
          switch (providDdo.cloumnCount) {
            case 1:
              return BigContentCard(
                onTap: () => _goImgDetal(obj),
                obj: obj,
              );
            case 2:
              return MidleFolderCard(
                onTap: () => _goImgDetal(obj),
                obj: obj,
              );
            case 3:
              return SmallFolderCard(
                onTap: () => _goImgDetal(obj),
                obj: obj,
              );

            default:
              return BigContentCard(
                onTap: () => _goImgDetal(obj),
                obj: obj,
              );
          }
        }).toList());
  }

  void _goImgDetal(obj) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => ImageDetalPage(obj: obj)));
}
