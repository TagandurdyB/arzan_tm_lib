import '/config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'shimmer_img.dart';

class PictureView extends StatefulWidget {
  final double? width;
  final double? height;
  final List<String> images;
  const PictureView({
    super.key,
    this.width,
    this.height,
    required this.images,
  });

  @override
  State<PictureView> createState() => _PictureViewState();
}

class _PictureViewState extends State<PictureView> {
  final double arentir = MySize.arentir;
  int viewedImg = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? MySize.width,
      height: widget.height ?? MySize.width * 0.6,
      child: widget.images.length == 1
          ? buildImage(widget.images[0])
          : buildImages,
    );
  }

  Widget buildImage(String imgUrl) => SizedBox(
        child: ShimmerImg(imageUrl: imgUrl),
      );

  Widget get buildImages => Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            onPageChanged: (value) => setState(() => viewedImg = value),
            itemCount: widget.images.length,
            itemBuilder: (context, index) =>
                SizedBox(child: buildImage(widget.images[index])),
          ),
          Padding(
            padding: EdgeInsets.all(arentir * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  widget.images.length,
                  (index) => Container(
                        margin: EdgeInsets.all(arentir * 0.007),
                        width: arentir * 0.015,
                        height: arentir * 0.015,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: viewedImg == index
                              ? const Color(0xff0EC243)
                              : Colors.white38,
                        ),
                      )),
            ),
          )
        ],
      );
}
