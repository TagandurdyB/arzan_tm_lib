import 'package:flutter/material.dart';

class ArzanCoin extends StatelessWidget {
  final double radius;
  const ArzanCoin({
    this.radius=20,
    super.key});

  @override
  Widget build(BuildContext context) {
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