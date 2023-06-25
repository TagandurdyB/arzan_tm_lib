import 'package:flutter/material.dart';

import '../../widgets/shimmer_img.dart';
import 'page_zoom.dart';

class MultiZoomPage extends StatefulWidget {
  final List<String> images;
  final ImageType type;
  final int startIndex;
  const MultiZoomPage(
      {required this.images,this.type=ImageType.network, required this.startIndex, super.key});

  @override
  State<MultiZoomPage> createState() => _MultiZoomPageState();
}

class _MultiZoomPageState extends State<MultiZoomPage> {
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
              type: widget.type,
                  image: imgs[index],
                  count: imgs.length,
                  index: index + 1,
                )),
        // children: widget.images.map((img) => ZoomPage(image: img, count: widget.images.length, index: )).toList(),
      ),
    );
  }
}
