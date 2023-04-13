import 'dart:async';

import 'package:flutter/material.dart';

class CustomCarusel extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> items;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Duration duration, transition;
  const CustomCarusel({
    required this.items,
    this.duration = const Duration(seconds: 5),
    this.transition = const Duration(milliseconds: 200),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(0),
    this.width = double.infinity,
    this.height = 200,
    super.key,
  });

  @override
  State<CustomCarusel> createState() => _CustomCaruselState();
}

class _CustomCaruselState extends State<CustomCarusel> {
  late PageController controller;
  late Timer timer;

  @override
  void initState() {
    controller = PageController(
      initialPage: 1,
      keepPage: true,
    );
    timer = Timer.periodic(widget.duration, (time) {
      setState(() {
        controller.nextPage(duration: widget.transition, curve: Curves.easeIn);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final length = widget.items.length;
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))),
      width: widget.width,
      height: widget.height,
      child: PageView.builder(
        controller: controller,
        onPageChanged: (int pageIndex) {
          setState(() {
            if (pageIndex == length + 1) {
              controller.jumpToPage(1);
            } else if (pageIndex == 0) {
              controller.jumpToPage(length);
            }
          });
        },
        itemCount: length + 2,
        itemBuilder: (context, index) {
          int reightIndex = index == 0
              ? length - 1
              : index == length + 1
                  ? 0
                  : index - 1;
          return widget.items[reightIndex];
        },
      ),
    );
  }
}
