// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/views/widgets/shimmer_img.dart';
import 'package:shimmer/shimmer.dart';

import '../../providers/data/video_data_provider.dart';
import '../../providers/view/provider_theme.dart';
import '../widgets/carusel_slider.dart';
import '/presentation/views/widgets/custom_future.dart';

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
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '../widgets/galery/folder_cards/midle_folder_card.dart';
import '../widgets/widget_btn.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

import 'page_video_player1.dart';

class CanalVideosPage extends StatefulWidget {
  const CanalVideosPage({super.key});

  @override
  State<CanalVideosPage> createState() => _CanalVideosPageState();
}

class _CanalVideosPageState extends State<CanalVideosPage> {
  final double arentir = MySize.arentir;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      VideoDataP.of(context, listen: false).fillVideos(0);
      ValuesP.of(context, listen: false).fillVideoCategories();
    });
  }

  late DiscountProvid providD, providDdo;

  @override
  Widget build(BuildContext context) {
    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    return ScaffoldNo(
        body: RefreshIndicator(
            edgeOffset: 50,
            color: Colors.green,
            backgroundColor: Colors.white10,
            onRefresh: () {
              // MainPageP.of(context, listen: false).fillEntity();
              // DiscountDataP.of(context, listen: false).fillDiscounts();
              // ValuesP.of(context, listen: false).fillVideoBanner(
              //     HiveP.of(context).readInt(Tags.hiveLocationId)!);
              setState(() {});
              return Future<void>.delayed(const Duration(seconds: 2));
            },
            child: CustomFuture(
                future: ValuesP.of(context, listen: false).getBanner(
                    HiveP.of(context).readInt(Tags.hiveLocationId)!, 3),
                builder: (context, banners) {
                  return Column(
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
                  );
                })));
  }

  // List<ValueEntity> categories = [
  //   ValueEntity(name: "Imit", id: 1, count: 1),
  //   ValueEntity(name: "Sport", id: 2, count: 1),
  //   ValueEntity(name: "Tehnalogiya", id: 3, count: 0),
  //   ValueEntity(name: "Imit", id: 4, count: 1),
  //   ValueEntity(name: "Sport", id: 5, count: 1),
  //   ValueEntity(name: "Tehnalogiya", id: 6, count: 1),
  // ];

  List<ValueEntity> categories = [];

  Widget get buildContent {
    categories = [ValueEntity(id: 0, name: "Hemmesi")] +
        ValuesP.of(context).videoCategories;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
                children: List.generate(
                    categories.length, (index) => buildCategoryCard(index))),
          ),
         VideoDataP.of(context).selectVideoCategoryIndex!=0?  buildBanner2:buildBanner1,
          Row(
            children: [
              Expanded(
                  child: buildBtnGroup(Icons.play_arrow, "Meşhurlar (65)")),
              Expanded(child: buildBtnGroup(Icons.star, "Resmiler (25)")),
            ],
          ),
          SizedBox(height: arentir * 0.02),
          Align(
            alignment: Alignment.center,
            // child: AnimatedCrossFade(
            //   duration: const Duration(milliseconds: 300),
            //   firstChild: buildCards(),
            //   secondChild: buildLoading(),
            //   crossFadeState: VideoDataP.of(context).videos != null
            //       ? CrossFadeState.showFirst
            //       : CrossFadeState.showSecond,
            // ),
            child: VideoDataP.of(context).videos != null
                ? buildCards()
                : buildLoading(),
          ),
          SizedBox(height: arentir * 0.2),
        ],
      ),
    );
  }



  Widget buildCategoryCard(int index) {
    final bool isSelect =
        index == VideoDataP.of(context).selectVideoCategoryIndex;
    final count = categories[index].count;
    return GestureDetector(
      onTap: () {
        VideoDataP.of(context, listen: false)
            .chageSelectedVideoCategoryIndex(index);
        VideoDataP.of(context, listen: false).fillVideos(categories[index].id);
      },
      child: Container(
          decoration: BoxDecoration(
              color: isSelect ? const Color(0xff00C53D) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xff00C53D))),
          height: arentir * 0.09,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: arentir * 0.07),
          margin: const EdgeInsets.all(8),
          child: Text(
            "${categories[index].name}${count > 0 ? " ($count)" : ""}",
            style: TextStyle(
                color: isSelect ? Colors.white : null,
                fontSize: arentir * 0.035,
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget get buildBanner2 {
    final int index=VideoDataP.of(context).selectVideoCategoryIndex;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color:Colors.red,
       borderRadius: BorderRadius.circular(arentir*0.02)
      ),
      width: double.infinity,
      height: arentir*0.5,
      child: ShimmerImg(imageUrl: categories[index].img??""),
    );
  }

  Widget get buildBanner1 {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MyCarusel(
        items: ValuesP.of(context).videoBanners,
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

  List<ContentCardEntity> objs = [];

  // final List<ContentCardEntity> objs = [
  //   ContentCardEntity(
  //     id: 1,
  //     user: UserEntity(
  //       avatarImg:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnTjWfJm21yqNcNxD_yQO3fI08q2OKIVN54g&usqp=CAU",
  //       id: 1,
  //       name: "100haryt.com",
  //       role: Role.Official,
  //     ),
  //     banerImg:
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgA2PcagAvTYNabGcNcrbs924tnZBrIbjwpQ&usqp=CAU",

  //     // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //     allCount: 12,

  //     viewed: 14756,
  //     title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
  //     isEmpty: false,
  //   ),
  //   ContentCardEntity(
  //     id: 2,
  //     user: UserEntity(
  //       avatarImg:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
  //       id: 2,
  //       name: "Mercedes-Benz",
  //       role: Role.Official,
  //     ),
  //     banerImg:
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
  //     // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //     allCount: 12,
  //     viewed: 14756,
  //     title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
  //     isEmpty: false,
  //   ),
  //   ContentCardEntity(
  //     id: 2,
  //     user: UserEntity(
  //       avatarImg:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
  //       id: 2,
  //       name: "Mercedes-Benz",
  //       role: Role.Official,
  //     ),
  //     banerImg:
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
  //     // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //     allCount: 12,
  //     viewed: 14756,
  //     title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
  //     isEmpty: false,
  //   ),
  //   ContentCardEntity(
  //     id: 2,
  //     user: UserEntity(
  //       avatarImg:
  //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvtyA_jv76ISEwn237GbPT--KbTNBIGyhVIQ&usqp=CAU",
  //       id: 2,
  //       name: "Mercedes-Benz",
  //       role: Role.Official,
  //     ),
  //     banerImg:
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZui21swzEVf2tksEznL2hLUe2259EdwUxIg&usqp=CAU",
  //     // "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  //     allCount: 12,
  //     viewed: 14756,
  //     title: "Lays çipsilerinde uly arzanlaşyk bardygyny ýatladýar!",
  //     isEmpty: false,
  //   ),
  // ];

  Widget buildLoading() {
    return Wrap(
        spacing: arentir * 0.03,
        runSpacing: arentir * 0.02 ,
        children: List.generate(12, (index) {
          switch (HiveP.of(context).readInt(Tags.hiveVideoType) ?? 2) {
            case 1:
              return buildLoadCard(0.9, 0.68);
            case 2:
              return buildLoadCard(0.44, 0.6);
            case 3:
              return buildLoadCard(0.29, 0.31);
            default:
              return Container(color: Colors.blue);
          }
        }));
  }

  Widget buildLoadCard(double width, double height) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: arentir * 0.01),
      width: arentir * width,
      height: arentir * height,
      child: shimmer(),
    );
  }

  Widget shimmer() {
    final themeColor = ThemeP.of(context).colors;
    return Shimmer.fromColors(
      baseColor: themeColor.shimmerBg,
      highlightColor: themeColor.shimmerLine,
      enabled: true,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 1),
      child: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget buildCards() {
    objs = VideoDataP.of(context).videos ?? [];
    return Wrap(
        spacing: arentir * 0.03,
        children: List.generate(objs.length, (index) {
          final obj = objs[index];
          switch (HiveP.of(context).readInt(Tags.hiveVideoType) ?? 2) {
            case 1:
              return BigContentCard(
                onTap: () => _goImgDetal(obj, index),
                obj: obj,
              );
            case 2:
              return MidleFolderCard(
                onTap: () => _goImgDetal(obj, index),
                obj: obj,
              );
            case 3:
              return VideoSmallCard(
                onTap: () => _goImgDetal(obj, index),
                obj: obj,
              );

            default:
              return BigContentCard(
                onTap: () => _goImgDetal(obj, index),
                obj: obj,
              );
          }
        }));
  }

  List<VideoCardEntity> videos1 = [
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

  void _goImgDetal(ContentCardEntity obj, int index) {
    VideoDataP.of(context, listen: false).changeIndex(index);
    VideoDataP.of(context, listen: false).startVideo(index);

    print("Video 123123  $index  ${obj.videoUrl}");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PageVidePlayer1()));

    // Navigator.push(
    //   context,
    //   // MaterialPageRoute(
    //   //     builder: (context) => VideosPage(objs: videos, obj: obj))

    //   // MaterialPageRoute(
    //   //     builder: (context) => VideoPlayerPage()),

    //   MaterialPageRoute(builder: (context) => PageVidePlayer1(initId: obj.id)),
    // );
  }
}
