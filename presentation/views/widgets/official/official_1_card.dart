// ignore_for_file: must_be_immutable

import '/presentation/views/widgets/custom_avatar.dart';
import '/presentation/views/widgets/next_btn.dart';

import '../../../../config/vars/formater.dart';
import '../../../providers/view/provider_theme.dart';
import '/domanin/entities/official_entity.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class OfficialCardFirst extends StatelessWidget {
  final OfficialEntity obj;
  OfficialCardFirst({required this.obj, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: EdgeInsets.all(arentir * 0.03),
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.03),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: ThemeP.of(context).shadows.discount,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            radius: arentir * 0.18,
            imgUrl: obj.avatarImg,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    obj.name,
                    style: TextStyle(
                        fontSize: arentir * 0.045,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(height: arentir * 0.02),
                  Text(
                    "Yzarlaýanlar: ${Formater.rounder(obj.followers)}",
                    style: TextStyle(
                        color: const Color(0xff747474),
                        fontSize: arentir * 0.03),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: arentir * 0.2,
            child: NextBtn(
              func: () {},
              text: "Yzarla",
            ),
          ),
        ],
      ),
    );
  }
}
