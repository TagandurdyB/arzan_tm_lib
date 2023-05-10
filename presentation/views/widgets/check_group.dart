import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

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
