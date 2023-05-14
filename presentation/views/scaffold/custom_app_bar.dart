// ignore_for_file: must_be_immutable

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function? funcBack;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final TextStyle? style;
  late BuildContext context;
  CustomAppBar(
      {this.title = "Title",
      this.actions = const [],
      this.funcBack,
      this.leading,
      this.style,
      super.key});
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      // color: Colors.white54,
      color: Colors.white54,
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
        leading ??
            GestureDetector(
                onTap: () {
                  if (funcBack != null) {
                    funcBack!();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  // color: Colors.white,
                  size: 30,
                )),
        Expanded(
          child: Text(
            title,
            style: style ?? const TextStyle(fontSize: 22),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        buildActions(),
      ],
    );
  }

  Widget buildActions() {
    return Row(
      children: actions!,
    );
  }
}
