// ignore_for_file: must_be_immutable

import '../../providers/data/values_provider.dart';
import '../widgets/widget_btn.dart';
import '/presentation/providers/data/provider_gallery.dart';

import '/presentation/views/widgets/galery/folder_cards/midle_folder_card.dart';
import '/presentation/views/widgets/galery/folder_cards/small_folder_card.dart';

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

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final double arentir = MySize.arentir;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GalleryP.of(context, listen: false).fillImgFolders();
    });
    super.initState();
  }

  @override
  late BuildContext context;

  late DiscountProvid providD, providDdo;

  late GalleryP providG, providGdo;
  late List<BigCardEntity> objs;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    providG = GalleryP.of(context);
    objs = providG.imgGallery.folders;

    providD = DiscountProvid.of(context);
    providDdo = DiscountProvid.of(context, listen: false);
    return ScaffoldNo(
        body: Column(
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

  Widget buildCards() {
    return Wrap(
        spacing: arentir * 0.03,
        children: List.generate(objs.length, (index) {
          switch (providDdo.cloumnCount) {
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
            case 3:
              return SmallFolderCard(
                onTap: () => _goImgDetal(index),
                obj: objs[index],
              );

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
                userImg: objs[index].userImg,
                userName: objs[index].userName,
                userId: objs[index].id,
              )));
}
