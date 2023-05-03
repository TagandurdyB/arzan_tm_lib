import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final int counter;
  CardTitle({super.key, required this.title, required this.counter});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: arentir * 0.03),
        // color: Colors.red,
        child: Text(
          "$title (+$counter)",
          style: TextStyle(
              fontSize: arentir * 0.04,
              color: const Color(0xff188A34),
              fontWeight: FontWeight.bold),
        ));
  }
}
