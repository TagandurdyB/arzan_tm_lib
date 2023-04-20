import 'dart:async';

import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';

class CustomCarusel extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> items;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Duration duration, transition;
  final bool showDots;
  final double dotRadius;
  final double activDotRadius;
  final Color dotColor;
  final Color activDotColor;
  final Alignment dotsAlignment;
  final EdgeInsetsGeometry dotsMargin;
  final bool isDotsOut;
  const CustomCarusel({
    required this.items,
    this.isDotsOut = false,
    this.dotRadius = 8,
    this.activDotRadius = 9,
    this.dotColor = Colors.grey,
    this.activDotColor = Colors.blue,
    this.dotsAlignment = Alignment.centerRight,
    this.showDots = true,
    this.duration = const Duration(seconds: 5),
    this.transition = const Duration(milliseconds: 200),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(0),
    this.dotsMargin = const EdgeInsets.all(5),
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
  late int length;

  @override
  void initState() {
    length = widget.items.length;
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

  void onPageChanged(int index) {
    setState(() {
      pageIndex = index - 1;
      if (index == length + 1) {
        pageIndex = 0;
        controller.jumpToPage(1);
      } else if (index == 0) {
        controller.jumpToPage(length);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.borderRadius)),
              child: Container(
                padding: widget.padding,
                decoration: BoxDecoration(
                  //  boxShadow: ShadowsLight.all,
                  color: ThemeP.of(context).colors.shimmerBg,
                ),
                width: widget.width,
                height: widget.height,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: onPageChanged,
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
              ),
            ),
            Visibility(
                visible: widget.showDots && !widget.isDotsOut,
                child: buildDots),
          ],
        ),
        Visibility(
            visible: widget.showDots && widget.isDotsOut, child: buildDots),
      ],
    );
  }

  Widget get buildDots {
    return Container(
      margin: widget.dotsMargin,
      alignment: widget.dotsAlignment,
      // color: Colors.blue,
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(length, (index) {
            final radius =
                index == pageIndex ? widget.activDotRadius : widget.dotRadius;
            return Container(
              width: radius,
              height: radius,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == pageIndex
                      ? widget.activDotColor
                      : widget.dotColor),
            );
          }),
        ),
      ),
    );
  }
}
