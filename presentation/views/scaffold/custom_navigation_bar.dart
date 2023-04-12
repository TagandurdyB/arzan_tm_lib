// ignore_for_file: must_be_immutable

import 'package:arzan_tm/config/system_info/my_orientation.dart';
import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';
import '../../providers/view/provider_theme.dart';
import '../widgets/my_container.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectIndex = 3;

  @override
  Widget build(BuildContext context) {
    MyOrientation.enableSystemUI;
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectIndex,
        // onTap: (index) {
        //   setState(() {
        //     _selectIndex = index;
        //   });
        //   ProcessNavigation(context).screenIndex(index);
        // },
        onTap: (index) {
          debugPrint("Index:= $index");
          if (index > 1) {
            setState(() {
              _selectIndex = index;
            });
          }
          if (index == 0) {
            Scaffold.of(context).openDrawer();
          }
        },
        items: List.generate(
            ThemeP.of(context, listen: false).icons.navigationIcons.length,
            (index) => BottomNavigationBarItem(
                activeIcon: MyContainer(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                  shape: MySize.arentir * 0.1,
                  padding: const EdgeInsets.all(7),
                  child: ThemeP.of(context).icons.navigationIcons[index],
                ),
                icon: ThemeP.of(context).icons.navigationIcons[index],
                label: "")));
  }
}
