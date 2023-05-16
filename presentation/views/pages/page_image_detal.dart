// ignore_for_file: must_be_immutable

import '/presentation/providers/view/provider_theme.dart';

import '../../../config/services/my_size.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';
import '../../providers/data/provider_gallery.dart';
import '/presentation/views/widgets/custom_avatar.dart';
import '/presentation/views/widgets/my_pop_widget.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';
import '../widgets/galery/image_card.dart';
import 'zoom/page_multi_img_zoom.dart';

class ImageDetalPage extends StatefulWidget {
  final String userImg;
  final String userName;
  final int userId;
  const ImageDetalPage(
      {required this.userImg,
      required this.userName,
      required this.userId,
      super.key});

  @override
  State<ImageDetalPage> createState() => _ImageDetalPageState();
}

class _ImageDetalPageState extends State<ImageDetalPage> {
  final double arentir = MySize.arentir;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GalleryP.of(context, listen: false).fillImagesEntity();
    });
    super.initState();
  }

  late GalleryP providG;
  late GalleryP providGdo;

  @override
  Widget build(BuildContext context) {
    providG = GalleryP.of(context);
    providGdo = GalleryP.of(context, listen: false);
    return ScaffoldNo(
        body: Column(
      children: [
        CustomAppBar(
            titleW: Row(children: [
          CustomAvatar(
            imgUrl: widget.userImg,
            radius: arentir * 0.1,
          ),
          Text(widget.userName, style: TextStyle(fontSize: arentir * 0.04)),
        ])),
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
          SizedBox(height: arentir * 0.02),
          Wrap(
            // runSpacing: arentir * 0,
            spacing: arentir * 0.01,
            children:
                List.generate(GalleryP.of(context).imgEntity.length, (index) {
              return ImageCard(
                onTab: (ImgCardEntity obj) => _goZoom(index),
                obj: providGdo.imgEntity[index],
                width: arentir * 0.43,
                height: arentir * 0.43,
              );
            }),
          )
        ],
      ),
    );
  }

  void _goZoom(int index) {
    final imgs = GalleryP.of(context, listen: false).imgEntity;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MultiImgZoomPage(
                  images: imgs,
                  startIndex: index,
                )));
  }

  void _popImg(ImgCardEntity obj) {
    MyPopUpp(
      width: arentir * 0.9,
      height: arentir * 0.9,
      borderRadius: arentir * 0.03,
      padding: const EdgeInsets.all(0),
      barrierDismissible: true,
      content: Container(
        width: arentir * 0.9,
        height: arentir * 0.9,
        decoration: BoxDecoration(
            color: ThemeP.of(context, listen: false).colors.shimmerBg,
            borderRadius: BorderRadius.circular(arentir * 0.03)),
        child: ShimmerImg(imageUrl: obj.img),
      ),
    ).pop(context);
  }
}
