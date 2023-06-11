// ignore_for_file: must_be_immutable

import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../../providers/data/main_page_provider.dart';
import '../../providers/view/provider_discaunts.dart';
import '../widgets/card_title.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '../widgets/galery/folder_cards/midle_folder_card.dart';
import '../widgets/galery/folder_cards/small_folder_card.dart';
import '../widgets/widget_btn.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import 'page_video_player.dart';

class VideosPage extends StatelessWidget {
  VideosPage({super.key});

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
          titleW: CardTitle(
            counter: 23,
            title: "Wideo",
            txtSize: arentir * 0.05,
          ),
          actions: const [WidgetBtn()],
        ),
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
          buildBanner,
          SizedBox(height: arentir * 0.02),
          buildCards(),
          SizedBox(height: arentir * 0.2),
        ],
      ),
    );
  }

  Widget get buildBanner {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCarusel(
        items: MainPageP.of(context).entity.baners.map((e) => e).toList(),
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
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
      videoUrl: "assets/video0.mp4",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      name: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
    BigCardEntity(
      id: 2,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
      userName: "Mercedes-Benz",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      videoUrl: "assets/video2.mp4",
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
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
      videoUrl: "assets/video1.mp4",
      allCount: 12,
      allShaered: 720,
      allViewed: 14756,
      name: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
    BigCardEntity(
      id: 2,
      userImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
      userName: "Mercedes-Benz",
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      videoUrl: "assets/video3.mp4",
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

  void _goImgDetal(BigCardEntity obj) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => VideoPlayerPage(objs: objs)));
}
