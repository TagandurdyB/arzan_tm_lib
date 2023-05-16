import 'package:flutter/material.dart';

import 'page_zoom.dart';

class MultiZoomPage extends StatefulWidget {
  final List<String> images;
  final int startIndex;
  const MultiZoomPage(
      {required this.images, required this.startIndex, super.key});

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
                  image: imgs[index],
                  count: imgs.length,
                  index: index + 1,
                )),
        // children: widget.images.map((img) => ZoomPage(image: img, count: widget.images.length, index: )).toList(),
      ),
    );
  }
}
