// ignore_for_file: must_be_immutable

import '../../../config/services/my_size.dart';
import '../../../domanin/entities/galery/big_content_card_entity.dart';
import '../../../domanin/entities/galery/img_card_entity.dart';
import '/presentation/views/widgets/custom_avatar.dart';
import '/presentation/views/widgets/my_pop_widget.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../scaffold/custom_app_bar.dart';
import '../scaffold/no_app_bar_scaffold.dart';
import '../widgets/galery/image_card.dart';

class ImageDetalPage extends StatelessWidget {
  final BigCardEntity obj;
  ImageDetalPage({required this.obj, super.key});

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
          CustomAvatar(
            imgUrl: obj.userImg,
            radius: arentir * 0.12,
          ),
          Text(obj.userName, style: TextStyle(fontSize: arentir * 0.04)),
          SizedBox(height: arentir * 0.02),
          Wrap(
              // runSpacing: arentir * 0,
              spacing: arentir * 0.01,
              children: obj.contents
                  .map((e) => ImageCard(
                        onTab: _popImg,
                        obj: e,
                        width: arentir * 0.43,
                        height: arentir * 0.43,
                      ))
                  .toList())
        ],
      ),
    );
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
            color: Colors.red,
            borderRadius: BorderRadius.circular(arentir * 0.03)),
        child: ShimmerImg(imageUrl: obj.img),
      ),
    ).pop(context);
  }
}
