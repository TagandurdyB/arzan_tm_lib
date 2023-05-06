import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

class AllBtn extends StatelessWidget {
  final Function? onTap;
  final String text;
  AllBtn({super.key, this.onTap,  this.text="Hemmesi"});

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff31CF53),
              borderRadius: BorderRadius.circular(arentir * 0.03)),
          padding: EdgeInsets.all(arentir * 0.008),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: arentir * 0.033,
                color: Colors.white),
          )),
    );
  }
}
