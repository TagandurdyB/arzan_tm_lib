import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

class AllBtn extends StatelessWidget {
  final Function? onTap;
  final String text;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final double? fontSize;
  final Color? bgColor;
  AllBtn({
    super.key,
    this.padding,
    this.style,
    this.fontSize,
    this.onTap,
    this.bgColor,
    this.text = "Hemmesi",
  });

  final double arentir = MySize.arentir;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
          decoration: BoxDecoration(
              color: bgColor ?? const Color(0xff31CF53),
              borderRadius: BorderRadius.circular(arentir * 0.05)),
          padding: padding ?? EdgeInsets.all(arentir * 0.008),
          child: Text(
            text,
            style: style ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? arentir * 0.033,
                    color: Colors.white),
          )),
    );
  }
}
