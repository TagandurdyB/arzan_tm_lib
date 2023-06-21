import '/config/services/my_size.dart';
import '/config/vars/formater.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final double? width;
  final double? height;
  final double? padding;
  final double? mainRadius;
  final Widget? mainValue;
  final List<Widget> items;
  final Color bgColor;
  final Function? onChange;
  final Function? onTab;
  final bool isOpen;
  final bool isBorder;
  final bool isShadow;
  const CustomDropDown({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.mainRadius,
    this.mainValue,
    this.onChange,
    this.onTab,
    this.isOpen = false,
    this.isBorder = true,
    this.isShadow = true,
    required this.items,
    this.bgColor = const Color(0xffF9FAFC),
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isOpen = false;
  @override
  void initState() {
    isOpen = widget.isOpen;
    widget.items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() => isOpen = !isOpen);
              if (widget.onTab != null) widget.onTab!();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: widget.padding ?? 16),
              width: widget.width,
              height: widget.height,
              decoration: widget.isBorder
                  ? BoxDecoration(
                      color: widget.bgColor,
                      border:
                          Border.all(width: 2, color: const Color(0xffDCDCDC)),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(widget.mainRadius ?? 10),
                        bottom: Radius.circular(
                            isOpen ? 0 : widget.mainRadius ?? 10),
                      ),
                    )
                  : null,
              child: Row(
                children: [
                  Expanded(child: widget.mainValue ?? const SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xffAAAAAA),
                    ),
                  ),
                ],
              ),
            )),
        //=============================================================
        AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: buildDropItems,
            crossFadeState:
                isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300)),
        //=============================================================
      ],
    );
  }

  Widget get buildDropItems => Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
            left: widget.padding ?? 16,
            right: widget.padding ?? 16,
            bottom: widget.padding ?? 16),
        decoration: widget.isBorder
            ? BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: !widget.isShadow
                    ? Border.all(width: 2, color: Colors.grey[300]!)
                    : null,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(widget.mainRadius ?? 10)),
                boxShadow: widget.isShadow
                    ? const [
                        BoxShadow(
                          offset: Offset(0, 2),
                          color: Color(0xffEDEDED),
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ]
                    : null)
            : null,
        child: Column(
            children: List.generate(
                widget.items.length + 1,
                (index) => index != widget.items.length
                    ? GestureDetector(
                        onTap: () {
                          setState(() => isOpen = false);
                          if (widget.onChange != null) {
                            widget.onChange!(index);
                          }
                        },
                        child: widget.items[index])
                    : SizedBox(
                        height: widget.height ?? 16,
                      ))),
      );
}

class DDItem {
  final int id;
  final String value;
  final Widget? child;

  DDItem({this.id = 0, this.value = "item", this.child});
}

class CustomCheckDrop extends StatefulWidget {
  final double? width;
  final double? height;
  final double? padding;
  final double? mainRadius;
  final Widget? mainValue;
  final List<DDItem> items;
  final Color bgColor;
  final Function? onChange;
  final Function? onTab;
  final bool isOpen;
  const CustomCheckDrop({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.mainRadius,
    this.mainValue,
    this.onChange,
    this.onTab,
    this.isOpen = false,
    required this.items,
    this.bgColor = const Color(0xffF9FAFC),
  });

  @override
  State<CustomCheckDrop> createState() => _CustomCheckDropState();
}

class _CustomCheckDropState extends State<CustomCheckDrop> {
  bool isOpen = false;
  List<DDItem> items = [];
  @override
  void initState() {
    isOpen = widget.isOpen;
    items = widget.items;
    super.initState();
  }

  final double arentir = MySize.arentir;
  List<DDItem> checkItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() => isOpen = !isOpen);
              if (widget.onTab != null) widget.onTab!();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: widget.padding ?? 16),
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.bgColor,
                border: Border.all(width: 2, color: const Color(0xffDCDCDC)),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(widget.mainRadius ?? 10),
                  bottom: Radius.circular(isOpen ? 0 : widget.mainRadius ?? 10),
                ),
              ),
              child: Row(
                children: [
                  Expanded(child: widget.mainValue ?? const SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: const Color(0xffAAAAAA),
                    ),
                  ),
                ],
              ),
            )),
        //=============================================================
        AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: buildDropItems,
            crossFadeState:
                isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300)),
        //=============================================================
      ],
    );
  }

  Widget get buildDropItems => Container(
        margin: EdgeInsets.only(
            left: widget.padding ?? 16,
            right: widget.padding ?? 16,
            bottom: widget.padding ?? 16),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(widget.mainRadius ?? 10)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 2),
                color: Color(0xffEDEDED),
                blurRadius: 2,
                spreadRadius: 2,
              )
            ]),
        child: Column(
            children: List.generate(
                items.length + 1,
                (index) => index != items.length
                    ? GestureDetector(
                        onTap: () {
                          final search = checkItems
                              .where((item) => item.value == items[index].value)
                              .toList();
                          if (search.isEmpty) {
                            checkItems.add(items[index]);
                          } else {
                            checkItems.removeWhere(
                                (item) => item.value == items[index].value);
                          }
                          setState(() {});
                          if (widget.onChange != null) {
                            widget.onChange!(checkItems);
                          }
                        },
                        child: Container(
                          color: check(index)
                              ? const Color(0xffF3FBF4)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(arentir * 0.02),
                                child: Icon(
                                  check(index)
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                  color: check(index)
                                      ? const Color(0xff0EC243)
                                      : const Color(0xffE5E5E5),
                                ),
                              ),
                              items[index].child!,
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: widget.height ?? 16,
                      ))),
      );

  bool check(int index) {
    return Formater.searcher(
        checkItems.map((e) => e.value).toList(), items[index].value);
  }
}
