import '../../../../domanin/entities/galery/img_entity.dart';
import 'package:flutter/material.dart';

import 'page_zoom.dart';

class MultiImgZoomPage extends StatefulWidget {
  final List<ImgEntity> images;
  final int startIndex;
  const MultiImgZoomPage(
      {required this.images, required this.startIndex, super.key});

  @override
  State<MultiImgZoomPage> createState() => _MultiImgZoomPageState();
}

class _MultiImgZoomPageState extends State<MultiImgZoomPage> {
  late PageController control;

  @override
  void initState() {
    control = PageController(
      initialPage: widget.startIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final imgs = widget.images;
    return Scaffold(
      body: PageView(
        controller: control,
        children: List.generate(
            imgs.length,
            (index) => ZoomPage(
                  image: imgs[index].img,
                  count: imgs.length,
                  index: index + 1,
                  liked: imgs[index].liked,
                )),
      ),
    );
  }
}
