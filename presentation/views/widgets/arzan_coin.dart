import 'package:flutter/material.dart';

class ArzanCoin extends StatelessWidget {
  final double radius;
  const ArzanCoin({this.radius = 20, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: FittedBox(fit: BoxFit.fill, child: Image.asset("assets/coin.png")),
    );
  }
}
