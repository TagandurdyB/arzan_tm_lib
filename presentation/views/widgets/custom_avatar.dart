import '../../../config/routes/my_route.dart';
import '/presentation/views/widgets/shimmer_img.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double radius;
  final double borderWidth;
  final Color? borderColor;
  final Color? bgColor;
  final Widget? content;
  final String imgUrl;
  final bool isShadow;
  final bool goAcaunt;
  const CustomAvatar({
    super.key,
    this.radius = 15,
    this.isShadow = false,
    this.content,
    this.borderColor,
    this.bgColor,
    this.borderWidth = 2,
    this.imgUrl = '',
    this.goAcaunt = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (goAcaunt) {
          Navigator.pushNamed(context, Rout.acaunt);
        }
      },
      child: Container(
        width: radius,
        height: radius,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            boxShadow: isShadow
                ? [
                    BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius: 2,
                        spreadRadius: 1)
                  ]
                : null,
            color: bgColor,
            borderRadius: BorderRadius.circular(radius * 0.5),
            border: Border.all(
                color: borderColor ?? Colors.green, width: borderWidth)),
        child: ClipOval(child: content ?? ShimmerImg(imageUrl: imgUrl)),
      ),
    );
  }
}
