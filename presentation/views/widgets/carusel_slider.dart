import 'dart:async';

import '../../../domanin/entities/baner_entity.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/services/my_size.dart';

class MyCarusel extends StatelessWidget {
  final List<BanerEntity> items;
  const MyCarusel({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCarusel(
      height: MySize.width * 0.5,
      // width: MySize.arentir * 0.9,
      dotColor: Colors.black26,
      activDotColor: const Color(0xff0EC243),
      borderRadius: MySize.arentir * 0.02,
      items: items.map((e) => buildContent(e)).toList(),
    );
  }

  Widget buildContent(BanerEntity obj) {
    return Image.network(
      obj.img,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, placeholder) {
        if (placeholder == null) return child;
        return Container(color: Colors.grey);
      },
      errorBuilder: (context, obj, stack) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.grey.withOpacity(0.6),
          enabled: true,
          direction: ShimmerDirection.ltr,
          period: const Duration(seconds: 1),
          child: Container(color: Colors.grey.withOpacity(0.5)),
        );
      },
    );
  }
}

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
                  color: Colors.grey.withOpacity(0.25),
                ),
                width: widget.width,
                height: widget.height,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (int index) {
                    setState(() {
                      pageIndex = index - 1;
                      if (index == length + 1) {
                        pageIndex = 0;
                        controller.jumpToPage(1);
                      } else if (index == 0) {
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
