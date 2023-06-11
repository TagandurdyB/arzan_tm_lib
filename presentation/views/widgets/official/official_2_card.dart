// ignore_for_file: must_be_immutable

import 'package:arzan_tm/presentation/views/widgets/custom_avatar.dart';
import 'package:arzan_tm/presentation/views/widgets/next_btn.dart';

import '../../../../config/vars/formater.dart';
import '../../../providers/view/provider_theme.dart';
import '/domanin/entities/official_entity.dart';

import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

class OfficialCardSecond extends StatelessWidget {
  final OfficialEntity obj;
  OfficialCardSecond({required this.obj, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: arentir * 0.03, horizontal: arentir * 0.045),
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.03),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: ThemeP.of(context).shadows.discount,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAvatar(
            radius: arentir * 0.25,
            imgUrl: obj.avatarImg,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    obj.name,
                    style: TextStyle(
                        fontSize: arentir * 0.04,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                  ),
                  SizedBox(height: arentir * 0.02),
                  Text(
                    "Yzarlaýanlar: ${Formater.rounder(obj.followers)}",
                    style: TextStyle(
                        color: const Color(0xff747474),
                        fontSize: arentir * 0.025),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: arentir * 0.08,
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
