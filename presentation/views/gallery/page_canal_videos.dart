// ignore_for_file: must_be_immutable

import '../../providers/data/hive_provider.dart';
import '../widgets/galery/folder_cards/video_small_card.dart';
import '/config/vars/constants.dart';
import '/domanin/entities/galery/video_entity.dart';
import '/domanin/entities/user_entity.dart';

import '/domanin/entities/value_entity.dart';

import '../../providers/data/values_provider.dart';

import '../../../domanin/entities/galery/content_card_entity.dart';
import '../../providers/view/provider_discaunts.dart';
import '../widgets/card_title.dart';
import '../widgets/carusel_slider.dart';
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '../widgets/galery/folder_cards/midle_folder_card.dart';
import '../widgets/widget_btn.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import 'page_videos.dart';

class CanalVideosPage extends StatelessWidget {
  CanalVideosPage({super.key});

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
            near: true,
            counter: 23,
            title: "Wideo",
            txtSize: arentir * 0.05,
          ),
          actions: const [WidgetBtn(limit: 3)],
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: buildContent,
        )),
      ],
    ));
  }

  List<ValueEntity> categories = [
    ValueEntity(name: "Imit", id: 1, count: 1),
    ValueEntity(name: "Sport", id: 2, count: 1),
    ValueEntity(name: "Tehnalogiya", id: 3, count: 0),
    ValueEntity(name: "Imit", id: 4, count: 1),
    ValueEntity(name: "Sport", id: 5, count: 1),
    ValueEntity(name: "Tehnalogiya", id: 6, count: 1),
  ];

  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(2),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
                children: List.generate(
                    categories.length, (index) => buildCategoryCard(index))),
          ),
          buildBanner,
          Row(
            children: [
              Expanded(
                  child: buildBtnGroup(Icons.play_arrow, "Meşhurlar (65)")),
              Expanded(child: buildBtnGroup(Icons.star, "Resmiler (25)")),
            ],
          ),
          SizedBox(height: arentir * 0.02),
          buildCards(),
          SizedBox(height: arentir * 0.2),
        ],
      ),
    );
  }

  int selectCategory = 0;

  Widget buildCategoryCard(int index) {
    final bool isSelect = index == selectCategory;
    final count = categories[index].count;
    return Container(
        decoration: BoxDecoration(
            color: isSelect ? const Color(0xff00C53D) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: const Color(0xff00C53D))),
        height: arentir * 0.06,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: arentir * 0.05),
        margin: const EdgeInsets.all(8),
        child: Text(
          "${categories[index].name}${count > 0 ? " ($count)" : ""}",
          style: TextStyle(
              color: isSelect ? Colors.white : null,
              fontSize: arentir * 0.025,
              fontWeight: FontWeight.bold),
        ));
  }

  Widget get buildBanner {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyCarusel(
        items: ValuesP.of(context).banners,
      ),
    );
  }

  Widget buildBtnGroup(IconData iconD, String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff2D9A4C), width: 3),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconD, size: arentir * 0.045, color: const Color(0xff2D9A4C)),
          Text(
            " $text",
            style: TextStyle(
                fontSize: arentir * 0.035, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  final List<ContentCardEntity> objs = [
    ContentCardEntity(
      id: 1,
      user: UserEntity(
        avatarImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
        id: 1,
        name: "100haryt.com",
        role: Role.Official,
      ),
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",

      // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      allCount: 12,

      viewed: 14756,
      title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
    ContentCardEntity(
      id: 2,
      user: UserEntity(
        avatarImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        id: 2,
        name: "Mercedes-Benz",
        role: Role.Official,
      ),
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      allCount: 12,
      viewed: 14756,
      title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
    ContentCardEntity(
      id: 2,
      user: UserEntity(
        avatarImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        id: 2,
        name: "Mercedes-Benz",
        role: Role.Official,
      ),
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      allCount: 12,
      viewed: 14756,
      title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
    ContentCardEntity(
      id: 2,
      user: UserEntity(
        avatarImg:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
        id: 2,
        name: "Mercedes-Benz",
        role: Role.Official,
      ),
      banerImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      allCount: 12,
      viewed: 14756,
      title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
      isEmpty: false,
    ),
  ];

  Widget buildCards() {
    return Wrap(
        spacing: arentir * 0.03,
        children: objs.map((obj) {
          switch (HiveP.of(context).readInt(Tags.hiveVideoType) ?? 2) {
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
              return VideoSmallCard(
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

  List<VideoCardEntity> videos = [
    VideoCardEntity(
      user: UserEntity(
          avatarImg: "", id: 1, name: "100haryt", role: Role.Official),
      id: 1,
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",

      // videoUrl:
      //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      viewCount: 15,
      // likeCount: 1456,
      createdAt: DateTime.now(),
    ),
    VideoCardEntity(
      user: UserEntity(
          avatarImg: "", id: 1, name: "100haryt", role: Role.Official),
      id: 2,
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      viewCount: 15,
      createdAt: DateTime.now(),
    ),
    VideoCardEntity(
      user: UserEntity(
          avatarImg: "", id: 1, name: "100haryt", role: Role.Official),
      id: 3,
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      viewCount: 15,
      createdAt: DateTime.now(),
    ),
    VideoCardEntity(
      user: UserEntity(
          avatarImg: "", id: 1, name: "100haryt", role: Role.Official),
      id: 4,
      thumbinalImg:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
      title:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
      viewCount: 15,
      createdAt: DateTime.now(),
    ),
  ];

  void _goImgDetal(ContentCardEntity obj) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => VideosPage(objs: videos, obj: obj)));
  // MaterialPageRoute(builder: (context) => VideoPlayerPage(objs: objs)));
}
