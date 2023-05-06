// ignore_for_file: must_be_immutable

import '../../../config/system_info/my_size.dart';
import '../../providers/view/provider_navigation.dart';
import 'package:flutter/material.dart';

import '../../providers/view/provider_theme.dart';
import '../widgets/my_container.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  //int _selectIndex = 0;

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    // MyOrientation.enableSystemUI;
    return Container(
      clipBehavior:
          Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(arentir * 0.02),
        ),
      ),
      child: BottomNavigationBar(
          currentIndex: ProviderNav.of(context).selectScreen, //_selectIndex,
          onTap: (index) {
            final provid = ProviderNav.of(context, listen: false);
            provid.changeScreen(index);
          },
          items: List.generate(
              ThemeP.of(context, listen: false).icons.navigationIcons.length,
              (index) => BottomNavigationBarItem(
                  activeIcon: MyContainer(
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                    // shape: MySize.arentir * 0.1,
                    width: MySize.arentir * 0.15,
                    padding: const EdgeInsets.all(7),
                    child: ThemeP.of(context).icons.navigationIcons[index],
                  ),
                  icon: ThemeP.of(context).icons.navigationIcons[index],
                  label: "salam"))),
    );
  }
}
