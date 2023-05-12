import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final Widget? content;
  final String imgUrl;
  const CustomAvatar({
    super.key,
    this.radius = 15,
    this.content,
    this.borderColor,
    this.bgColor,
    this.borderWidth = 2,
    this.imgUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius * 0.5),
          border: Border.all(
              color: borderColor ?? Colors.green, width: borderWidth)),
      child: ClipOval(child: content ?? ShimmerImg(imageUrl: imgUrl)),
    );
  }
}
