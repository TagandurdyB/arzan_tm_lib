// ignore_for_file: must_be_immutable

import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Function? funcBack;
  final String title;
  final List<Widget>? actions;
  late BuildContext context;
  CustomAppBar(
      {this.title = "Title",
      this.actions = const [],
      this.funcBack,
      super.key});
  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      height: kToolbarHeight,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(arentir * 0.03))),
      child: buildContent(),
    );
  }

  Widget buildContent() {
    return Row(
      children: [
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
              color: Colors.white,
              size: 30,
            )),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22),
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
