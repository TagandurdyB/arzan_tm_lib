// ignore_for_file: must_be_immutable

import 'package:arzan/config/system_info/my_size.dart';

import '/config/routes/my_route.dart';
import '/config/vars/constants.dart';
import '/presentation/views/widgets/my_container.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({super.key});

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(MySize.arentir * 0.02),
        ),
      ),
      height: kToolbarHeight,
      child: Row(
        children: [
          buildMenue,
          Expanded(child: Hero(tag: Tags.rIMainSearch, child: buildSearch)),
          buildBell,
        ],
      ),
    );
  }

  Widget get buildMenue {
    return MyContainer(
      color: Colors.transparent,
      onTap: () => Scaffold.of(context).openDrawer(),
      padding: const EdgeInsets.all(16),
      child: ThemeP.of(context).icons.menu,
    );
  }

  Widget get buildSearch {
    return Material(
      type: MaterialType.transparency,
      child: MyContainer(
        onTap: () => Navigator.pushNamed(context, Rout.search),
        height: 40,
        borderColor: const Color(0xffC4C4C4),
        borderWidth: 1,
        shape: 8,
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Gözle...",
                style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15),
              ),
              Icon(
                Icons.search,
                color: Color(0xffCBCBCB),
              )
            ]),
      ),
    );
  }

  Widget get buildBell {
    return MyContainer(
        alignment: Alignment.center,
        color: Colors.transparent,
        // margin: const EdgeInsets.only(right: 16, top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        onTap: () {},
        child: Icon(
          color: Theme.of(context).appBarTheme.iconTheme!.color,
          Icons.notifications_none,
          size: 35,
        ));
  }
}
