import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  final String title;
  final int counter;
  final TextStyle? style;
  final double? txtSize;
  final bool near;
  CardTitle(
      {super.key,
      required this.title,
      this.style,
      this.txtSize,
      this.near = false,
      required this.counter});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: arentir * 0.03, horizontal: 8),
        // color: Colors.red,
        child: Row(
          mainAxisAlignment:
              near ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: style ??
                  TextStyle(
                    fontSize: txtSize ?? arentir * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Visibility(
              visible: counter > 0,
              child: Text(
                " ($counter)",
                style: TextStyle(
                  fontSize: txtSize ?? arentir * 0.04,
                  color: const Color(0xff008631),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
