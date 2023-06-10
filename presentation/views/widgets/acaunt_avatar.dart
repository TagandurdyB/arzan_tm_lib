import '/presentation/views/widgets/custom_avatar.dart';

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'arzan_coin.dart';

class AcauntAvatar extends StatelessWidget {
  final String name;
  final String city;
  final int money;
  final Widget? content;
  final String imgUrl;
  AcauntAvatar({
    super.key,
    required this.name,
    this.city = "",
    required this.money,
    this.content,
    this.imgUrl = "",
  });

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: arentir * 0.35,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAvatar(radius: arentir * 0.15),
          Text(
            name,
            style: TextStyle(fontSize: arentir * 0.045),
          ),
          Visibility(visible: city != "", child: Text(city)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$money ",
                style: TextStyle(
                    fontSize: arentir * 0.045, color: const Color(0xffEAAE3D)),
              ),
              const ArzanCoin(radius: 15),
            ],
          ),
        ],
      ),
    );
  }

  Container buildCoin(double radius) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffB47D3F),
          border: Border.all(color: const Color(0xffE2BD83), width: 2),
          borderRadius: BorderRadius.circular(radius)),
      // child:  Icon(
      //   Icons.star,
      //   color: const Color(0xffE2BD83),
      //   size: radius,
      // ),
      width: radius, height: radius,
      child: Image.asset("assets/logo_png.png"),
    );
  }
}
