// ignore_for_file: must_be_immutable

import '../../../config/services/my_size.dart';
import '/presentation/views/widgets/ReadyInput/ready_input.dart';
import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';
import 'my_container.dart';

class MainAppBarContent extends StatelessWidget {
  MainAppBarContent({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MySize.arentir * 0.77,
              child: const ReadyInput(
                tag: Tags.rIMainSearch,
                borderRad: 4,
                shape: true,
              ),
            ),
            buildBell()
          ],
        ),
      ),
    );
  }

  Widget buildBell() {
    return MyContainer(
        color: Colors.transparent,
        margin: const EdgeInsets.all(2),
        onTap: () {},
        child: Icon(
          color: Theme.of(context).appBarTheme.iconTheme!.color,
          Icons.notifications_none,
          size: MySize.arentir * 0.11,
        ));
  }
}
