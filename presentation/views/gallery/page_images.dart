// ignore_for_file: must_be_immutable

import 'package:arzan/presentation/providers/data/hive_provider.dart';
import 'package:arzan/presentation/views/widgets/custom_future.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/vars/constants.dart';
import '../../../domanin/entities/baner_entity.dart';
import '../../../domanin/entities/value_entity.dart';
import '../../providers/data/values_provider.dart';
import '../../providers/view/provider_theme.dart';
import '../widgets/shimmer_img.dart';
import '../widgets/widget_btn.dart';
import '/presentation/providers/data/provider_gallery.dart';

import '/presentation/views/widgets/galery/folder_cards/midle_folder_card.dart';

import '/presentation/views/widgets/card_title.dart';

import '../../providers/view/provider_discaunts.dart';
import '../widgets/carusel_slider.dart';
import 'page_image_detal.dart';

import '../../../domanin/entities/galery/content_card_entity.dart';
import '../widgets/galery/folder_cards/big_content_card.dart';

import '../../../config/services/my_size.dart';
import '/presentation/views/scaffold/custom_app_bar.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final double arentir = MySize.arentir;

// ValuesP? _value;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ValuesP.of(context, listen: false).fillImgCategories();
      GalleryP.of(context, listen: false).chageSelectedImgCategoryIndex(0);
      GalleryP.of(context, listen: false).fillImgFolders(0);
    });
    // _value=ValuesP.of(context, listen: false);
    // _value?.fillBanner(HiveP.of(context, listen: false).readInt(Tags.hiveLocationId)!, 2);
    super.initState();
  }

  final iteamControl = ItemScrollController();

  void scrollToIndex(int index) => iteamControl.scrollTo(
      duration: const Duration(milliseconds: 500), index: index);

  @override
  late BuildContext context;

  late DiscountProvid providD, providDdo;

  late GalleryP providG, providGdo;
  late List<ContentCardEntity> objs;

  late ValuesP valueP;

  List<ValueEntity> categories = [];

  @override
  Widget build(BuildContext context) {
    categories = [ValueEntity(id: 0, name: "Hemmesi")] +
        ValuesP.of(context).imgCategories;
    this.context = context;
    valueP = ValuesP.of(context);
    providG = GalleryP.of(context);
    providGdo = GalleryP.of(context, listen: false);
    objs = providG.folders ?? [];
    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    return ScaffoldNo(
        body: CustomFuture(
            future: valueP.getBanner(
                HiveP.of(context).readInt(Tags.hiveLocationId)!, 2),
            builder: (context, data) {
              banners = data;
              return Column(
                children: [
                  CustomAppBar(
                    // title: "Surat",
                    titleW: CardTitle(
                      near: true,
                      counter: 23,
                      title: "Surat",
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
              );
            }));
  }

  // child: ScrollablePositionedList.builder(
  //           // controller: _controller,
  //           itemScrollController: iteamControl,
  //           itemCount: categories.length,
  //           itemBuilder: (context, index) => buildCategoryCard(index),
  //           padding: const EdgeInsets.symmetric(horizontal: 2),
  //           scrollDirection: Axis.horizontal,
  //           physics: const BouncingScrollPhysics(),
  //           // children: List.generate(
  //           //     categories.length, (index) => buildCategoryCard(index)),
  //         ),

  Widget buildCategories() {
    return SizedBox(
      height: arentir * 0.13,
      child: ScrollablePositionedList.builder(
        // controller: _controller,
        itemScrollController: iteamControl,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategoryCard(index),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        // children: List.generate(
        //     categories.length, (index) => buildCategoryCard(index)),
      ),
    );
  }

  Widget buildCategoryCard(int index) {
    final bool isSelect = index == GalleryP.of(context).selectImgCategoryIndex;
    final count = categories[index].count;
    return GestureDetector(
      onTap: () {
        scrollToIndex(index);
        providGdo.chageSelectedImgCategoryIndex(index);
        providGdo.fillImgFolders(categories[index].id);
        // VideoDataP.of(context, listen: false).fillVideos(categories[index].id);
      },
      child: Container(
          decoration: BoxDecoration(
              color: isSelect ? const Color(0xff00C53D) : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xff00C53D))),
          height: arentir * 0.07,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: arentir * 0.05),
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

  List<BanerEntity> banners = [];



  Widget get buildContent {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCategories(),
           GalleryP.of(context).selectImgCategoryIndex != 0
              ? buildBanner2
              : buildBanner1,
          // buildBanner,
          SizedBox(height: arentir * 0.02),
          Align(
            alignment: Alignment.center,
            child: GalleryP.of(context).folders != null
                ? buildCards()
                : buildLoading(),
          ),
          SizedBox(height: arentir * 0.2),
        ],
      ),
    );
  }

    Widget get buildBanner2 {
    final int index = GalleryP.of(context).selectImgCategoryIndex;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          // color:Colors.red,
          borderRadius: BorderRadius.circular(arentir * 0.02)),
      width: double.infinity,
      height: arentir * 0.5,
      child: ShimmerImg(imageUrl: categories[index].img ?? "", fit: BoxFit.fitWidth,),
    );
  }

  Widget get buildBanner1 {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MyCarusel(
        items: ValuesP.of(context).imgBanners,
      ),
    );
  }

  // Widget get buildBanner {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: MyCarusel(
  //       items: banners,
  //     ),
  //   );
  // }

  Widget buildLoading() {
    return Wrap(
        spacing: arentir * 0.03,
        children: List.generate(12, (index) {
          switch (HiveP.of(context).readInt(Tags.hiveTypeOfYou) ?? 2) {
            case 1:
              return buildLoadCard(0.9, 0.68);
            case 2:
              return buildLoadCard(0.44, 0.6);
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
    objs = GalleryP.of(context).folders ?? [];
    final typeOfYou = HiveP.of(context).readInt(Tags.hiveTypeOfYou) ?? 2;
    return Wrap(
        spacing: arentir * 0.03,
        children: List.generate(objs.length, (index) {
          switch (typeOfYou) {
            case 1:
              return BigContentCard(
                onTap: () => _goImgDetal(index),
                obj: objs[index],
              );
            case 2:
              return MidleFolderCard(
                onTap: () => _goImgDetal(index),
                obj: objs[index],
              );
            // case 3:
            //   return SmallFolderCard(
            //     onTap: () => _goImgDetal(index),
            //     obj: objs[index],
            //   );

            default:
              return BigContentCard(
                onTap: () => _goImgDetal(index),
                obj: objs[index],
              );
          }
        }));
  }

  void _goImgDetal(int index) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ImageDetalPage(
                // obj: const [],
                obj: objs[index],
              )));
}
