// ignore_for_file: must_be_immutable

import 'dart:ui' as ui;

import '/config/vars/formater.dart';
import '/domanin/entities/user_entity.dart';

import '../../../../../config/services/my_size.dart';
import '../../../../../domanin/entities/galery/content_card_entity.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

import '../../../../providers/view/provider_theme.dart';
import '../../custom_avatar.dart';

class BigContentCard extends StatelessWidget {
  final ContentCardEntity obj;
  final Widget? child;
  final Function? onTap;
  final Widget? baner;
  BigContentCard(
      {required this.obj, this.child, this.onTap, this.baner, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: arentir * 0.03),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: ThemeP.of(context).shadows.all,
          borderRadius: BorderRadius.circular(arentir * 0.02),
          // border: Border.all(width: 1, color: const Color(0xff00C52B)),
        ),
        width: arentir * 0.9,
        // height: arentir * 0.95,
        child: Column(children: [
          buildTitle(obj.user),
          baner ?? buildBaner,
          buildBottom,
          // const Expanded(child: SizedBox()),
          Visibility(
            visible: child != null,
            child: child ?? const SizedBox(),
          ),
          // SizedBox()
        ]),
      ),
    );
  }

  Widget get buildBaner {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
            height: obj.isPicture ? arentir * 0.3 : arentir * 0.4,
            width: arentir * 0.9,
            child: ShimmerImg(imageUrl: obj.banerImg)),
        Visibility(visible: !obj.isPicture , child: buildPlay),
      ],
    );
  }

  Widget get buildPlay {
    return Container(
      width: arentir * 0.1,
      height: arentir * 0.1,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(arentir * 0.05),
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ),
        child: const Icon(Icons.play_arrow, color: Colors.white),
      ),
    );
  }

  Widget buildTitle(UserEntity user) {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.02),
      child: Row(
        children: [
          CustomAvatar(
            imgUrl: user.avatarImg,
            // bgColor: Colors.blue,
            radius: arentir * 0.08,
            borderWidth: 2,
          ),
          buildStar,
          Expanded(
            child: Text(
              user.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
           Visibility(
            visible: obj.pinnad,
            child: pinnet),
          // AllBtn(onTap: () {
          //   if (onTap != null) onTap!();
          // })
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

Widget get pinnet{
return  CircleAvatar(
  backgroundColor: const Color(0xff00C53D),
  radius: arentir*0.03,
  child:  Icon(Icons.push_pin_outlined,color:Colors.white, size: arentir*0.04),
);
}

  Widget get buildBottom {
    return Padding(
      padding: EdgeInsets.all(arentir * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Visibility(
                visible: !obj.isPicture,
                child: buildIconText(Formater.calendar(obj.createdAt??DateTime.now()))),
                SizedBox(width: arentir*0.02),
              Visibility(
                visible: obj.isPicture,
                child: buildIconNum(Icons.image_outlined, obj.allCount)),
              buildIconNum(Icons.remove_red_eye_outlined, obj.viewed),
              // buildIconNum(
              //     Icons.switch_access_shortcut_add_rounded, geriBildirim),
            ],
          ),
          SizedBox(height: arentir * 0.02),
          Text(
            obj.title,
            style: TextStyle(fontSize: arentir * 0.038),
            textAlign: TextAlign.start,
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
      buildIconText("$num "),
      SizedBox(width: arentir * 0.03),
    ]);
  }

  Text buildIconText(String text) {
    return Text(
      text,
      style:
          TextStyle(fontSize: arentir * 0.03, color: const Color(0xff747474)),
    );
  }
}
