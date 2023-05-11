// ignore_for_file: must_be_immutable

import '/presentation/views/pages/page_image_detal.dart';

import '/config/system_info/my_size.dart';
import '../../../../domanin/entities/galery/big_content_card_entity.dart';
import '/presentation/views/widgets/all_btn.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../providers/view/provider_theme.dart';
import '../custom_avatar.dart';

class BigContentCard extends StatelessWidget {
  final BigImgCardEntity obj;
  final Widget? child;
  final Widget? baner;
  BigContentCard({required this.obj, this.child, this.baner, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ImageDetalPage(obj: obj))),
      child: Container(
        margin: EdgeInsets.only(bottom: arentir * 0.03),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            boxShadow: ThemeP.of(context).shadows.all,
            borderRadius: BorderRadius.circular(arentir * 0.02),
            border: Border.all(width: 1, color: const Color(0xff00C52B))),
        width: arentir * 0.9,
        // height: arentir * 0.95,
        child: Column(children: [
          buildTitle(obj.userImg, obj.name),
          baner ??
              SizedBox(
                height: arentir * 0.3,
                width: arentir * 0.9,
                child: ShimmerImg(imageUrl: obj.banerImg),
              ),
          buildBottom(
            obj.allCount,
            obj.allViewed,
            obj.allShaered,
            obj.videNAme,
          ),
          // const Expanded(child: SizedBox()),
          Visibility(
            visible: child != null,
            child: child ?? const SizedBox(),
          ),
        ]),
      ),
    );
  }

  Widget buildTitle(String imgUrl, String title) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: imgUrl,
            // bgColor: Colors.blue,
            radius: arentir * 0.08,
            borderWidth: 2,
          ),
          buildStar,
          Text(title),
          const Expanded(child: SizedBox()),
          AllBtn()
        ],
      ),
    );
  }

  Container get buildStar {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: const Icon(
        Icons.star,
        color: Color(0xffE2BD83),
        size: 15,
      ),
    );
  }

  Widget buildBottom(int imgCount, int viewed, int geriBildirim, String text) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.03),
      child: Column(
        children: [
          Row(
            children: [
              buildIconNum(Icons.image_outlined, imgCount),
              buildIconNum(Icons.remove_red_eye_outlined, viewed),
              buildIconNum(
                  Icons.switch_access_shortcut_add_rounded, geriBildirim),
            ],
          ),
          Text(
            text,
            style:
                TextStyle(height: arentir * 0.003, fontSize: arentir * 0.035),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget buildIconNum(IconData iconD, int num) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(
        iconD,
        size: arentir * 0.04,
        color: const Color(0xff747474),
      ),
      SizedBox(width: arentir * 0.01),
      Text(
        "$num",
        style:
            TextStyle(fontSize: arentir * 0.03, color: const Color(0xff747474)),
      ),
      SizedBox(width: arentir * 0.03),
    ]);
  }
}
