// ignore_for_file: must_be_immutable

import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../../providers/data/main_page_provider.dart';
import '../../providers/data/provider_video.dart';
import '../../providers/view/provider_discaunts.dart';
import '../widgets/card_title.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import 'page_video_player.dart';

class VideosPage extends StatelessWidget {
  VideosPage({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
          titleW: CardTitle(
            counter: 23,
            title: "Wideo",
            txtSize: arentir * 0.05,
          ),
          actions: [
            GestureDetector(
                onTap: () =>
                    DiscountProvid.of(context, listen: false).tongleColumn,
                child: Icon(
                    buildWidgetIconD(DiscountProvid.of(context).cloumnCount)))
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
    {
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
      id: 1,
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
  ];

  Widget buildCards() {
    return Column(
        children: objs
            .map((obj) => BigContentCard(
                  onTap: () {
                    // VideoService(videoUrl: obj.videoUrl).create;
                    VideoP.of(context, listen: false).cleanVideo;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoPlayerPage(objs: [
                                BigCardEntity(
                                    id: 2,
                                    banerImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    thumbinalImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    videoUrl: "assets/video0.mp4",
                                    allCount: 12,
                                    allShaered: 720,
                                    allViewed: 14756,
                                    name:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                    isEmpty: false),
                                BigCardEntity(
                                    id: 2,
                                    banerImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    thumbinalImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    videoUrl: "assets/video1.mp4",
                                    allCount: 12,
                                    allShaered: 720,
                                    allViewed: 14756,
                                    name:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                    isEmpty: false),
                                BigCardEntity(
                                    id: 2,
                                    banerImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    thumbinalImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    videoUrl: "assets/video2.mp4",
                                    allCount: 12,
                                    allShaered: 720,
                                    allViewed: 14756,
                                    name:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                    isEmpty: false),
                                BigCardEntity(
                                    id: 2,
                                    banerImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    thumbinalImg:
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",
                                    videoUrl: "assets/video3.mp4",
                                    allCount: 12,
                                    allShaered: 720,
                                    allViewed: 14756,
                                    name:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                    isEmpty: false),
                              ])),
                    );
                  },
                  obj: obj,
                ))
            .toList());
  }
}
