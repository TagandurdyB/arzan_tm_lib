// ignore_for_file: must_be_immutable

import 'package:arzan_tm/presentation/views/widgets/arzan_coin.dart';

import '/presentation/views/widgets/custom_avatar.dart';

import '/config/system_info/my_size.dart';
import '/domanin/entities/acaunt_entity.dart';
import 'package:flutter/material.dart';

class AcauntCard extends StatelessWidget {
  final AcauntEntity obj;
  final Color borderColor;
  AcauntCard({required this.obj, this.borderColor = Colors.green, super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: arentir * 0.05, vertical: arentir*0.005),
      padding: EdgeInsets.symmetric(
          vertical: arentir * 0.01, horizontal: arentir * 0.04),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(arentir * 0.02),
      ),
      child: Row(
        children: [
          Container(
            // color: Colors.red,
            width: arentir*0.08,
            alignment: Alignment.center,
            child: Text(
              "${obj.num}",
              style: TextStyle(
                  fontSize: arentir * 0.04, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: arentir * 0.02),
            child: CustomAvatar(radius: arentir * 0.1, imgUrl: obj.avatarImg),
          ),
          Text(
            obj.name,
            style: TextStyle(fontSize: arentir * 0.04),
          ),
          const Expanded(child: SizedBox()),
          buildCoin(),
        ],
      ),
    );
  }

  Row buildCoin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "${obj.coin}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xffE79E12)),
        ),
        SizedBox(width: arentir * 0.01),
        ArzanCoin(radius: arentir * 0.05),
      ],
    );
  }
}
