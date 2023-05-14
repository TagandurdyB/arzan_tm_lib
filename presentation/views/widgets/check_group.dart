import 'package:flutter/material.dart';

import '../../../config/services/my_size.dart';

class CheckItem {
  final bool isActive;
  final String text;
  final Function? func;
  CheckItem({this.isActive = false, this.func, this.text = "Text"});
}

class CheckGroups extends StatefulWidget {
  final int? startIndex;
  final List<CheckItem>? items;
  const CheckGroups({this.startIndex, this.items, super.key});

  @override
  State<CheckGroups> createState() => _CheckGroupsState();
}

class _CheckGroupsState extends State<CheckGroups> {
  final double arentir = MySize.arentir;
  late int activeIndex;

  @override
  void initState() {
    activeIndex = widget.startIndex ?? -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.items != null
            ? List.generate(widget.items!.length, (index) => buildSwitch(index))
            : []);
  }

  Widget buildSwitch(int index) {
    final CheckItem e = widget.items![index];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: arentir * 0.01),
      child: GestureDetector(
        onTap: () {
          if (e.func != null) e.func!(index);
          setState(() => activeIndex = index);
        },
        child: Row(children: [
          Icon(
              activeIndex == index ? Icons.check_box : Icons.check_box_outlined,
              color: const Color(0xff00C52B)),
          Text(
            e.text,
            style: TextStyle(
                color: const Color(0xff00C52B), fontSize: arentir * 0.04),
          )
        ]),
      ),
    );
  }
}

class CustomCheck extends StatefulWidget {
  final bool startVal;
  final Function? onChange;
  final double size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? disableColor;
  final Color? enableColor;
  const CustomCheck({
    this.startVal = false,
    this.size = 30,
    this.onChange,
    this.padding,
    this.margin,
    this.disableColor,
    this.enableColor,
    super.key,
  });

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool value = false;
  @override
  void initState() {
    value = widget.startVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => value = !value);
        if (widget.onChange != null) widget.onChange!(value);
      },
      child: Container(
        padding: widget.padding,
        margin: widget.margin ?? const EdgeInsets.only(right: 5),
        child: Icon(value ? Icons.check_box : Icons.check_box_outline_blank,
            color: value
                ? widget.enableColor ?? const Color(0xff00C52B)
                : widget.disableColor ?? const Color(0xffE5E5E5),
            size: widget.size),
      ),
    );
  }
}
