import '/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

class IndicatorItem {
  final Function? func;
  final String text;
  final Widget? child;
  final Alignment? alignment;
  final double borderRadius;
  final BoxBorder? border;
  IndicatorItem({
    this.func,
    this.text = "",
    this.child,
    this.alignment,
    this.borderRadius = 0,
    this.border,
  });
}

class IndicatorBtns extends StatefulWidget {
  final double? width;
  final double? height;
  final int initialBtn;
  final List<IndicatorItem> items;
  final double? indicatorWidth;
  final Alignment indicatorAlign;
  final Color passiveColor;
  final Color activeColor;
  final double borderRadius;
  final BoxBorder? border;
  final BoxBorder? indicatorBorder;
  final Function? onChange;
  final TextStyle? passiveStyle;
  final TextStyle? activeStyle;
  final bool dynamicBorder;
  const IndicatorBtns({
    super.key,
    this.width,
    this.height = 20,
    required this.items,
    this.initialBtn = 0,
    this.indicatorWidth,
    this.indicatorAlign = Alignment.center,
    this.passiveColor = Colors.transparent,
    this.activeColor = Colors.green,
    this.borderRadius = 0,
    this.border,
    this.indicatorBorder,
    this.onChange,
    this.passiveStyle,
    this.activeStyle,
    this.dynamicBorder = true,
  });

  @override
  State<IndicatorBtns> createState() => _IndicatorBtnsState();
}

class _IndicatorBtnsState extends State<IndicatorBtns> {
  late int length;
  late List<IndicatorItem> items;
  late int activeIndex;
  late TextStyle activeS, passiveS;
  late double arentir = MySize.arentir;
  @override
  void initState() {
    items = widget.items;
    length = items.length;
    activeIndex = widget.initialBtn;
    activeS = widget.activeStyle ??
        TextStyle(color: Colors.white, fontSize: arentir * 0.04);
    passiveS = widget.passiveStyle ??
        TextStyle(color: const Color(0xffAAAAAA), fontSize: arentir * 0.04);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: widget.dynamicBorder ? null : widget.border,
        borderRadius: widget.dynamicBorder
            ? null
            : BorderRadius.circular(widget.borderRadius),
      ),
      height: widget.height,
      width: widget.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(length, (index) {
            final obj = items[index];
            final isActive = activeIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() => activeIndex = index);
                if (widget.onChange != null) widget.onChange!(activeIndex);
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                alignment: obj.alignment ?? widget.indicatorAlign,
                decoration: BoxDecoration(
                  color: isActive ? widget.activeColor : widget.passiveColor,
                  borderRadius: widget.dynamicBorder
                      ? index == 0
                          ? BorderRadius.horizontal(
                              left: Radius.circular(widget.borderRadius))
                          : index == length - 1
                              ? BorderRadius.horizontal(
                                  right: Radius.circular(widget.borderRadius))
                              : null
                      : BorderRadius.circular(obj.borderRadius),
                  border:
                      isActive ? null : obj.border ?? widget.indicatorBorder,
                ),
                width: widget.indicatorWidth,
                child: Text(
                  obj.text,
                  style: isActive ? activeS : passiveS,
                ),
              ),
            );
          }),
          // children: widget.items.map((e) => Container(color: Colors.red)).toList(),
        ),
      ),
    );
  }
}
