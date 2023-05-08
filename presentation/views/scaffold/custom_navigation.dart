import 'package:flutter/material.dart';
import '../../../config/vars/constants.dart';
import '../../providers/view/provider_navigation.dart';
import '../../providers/view/provider_theme.dart';
import '/config/system_info/my_size.dart';

class CustovNavigation extends StatefulWidget {
  const CustovNavigation({super.key});

  @override
  State<CustovNavigation> createState() => _CustovNavigationState();
}

class _CustovNavigationState extends State<CustovNavigation> {
  final double arentir = MySize.arentir;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final List items = ThemeP.of(context).icons.navigationIcons;
    return Container(
      color: ProviderNav.of(context).isSearch
          ? ProviderNav.of(context).searchBg
          : Colors.transparent,
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(arentir * 0.03)),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.green, height: arentir * 0.001),
              ),
              indicatorColor: Colors.transparent,
              // indicatorShape:
              //     const Border.symmetric(vertical: BorderSide()),
              iconTheme: const MaterialStatePropertyAll(
                  IconThemeData(color: Colors.white)),
              backgroundColor: Colors.green),
          child: NavigationBar(
            animationDuration: const Duration(seconds: 2),
            height: arentir * 0.15,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            destinations: List.generate(
                items.length,
                (index) => buildBord(index)),
            onDestinationSelected: (index) {
              setState(() => this.index = index);
              final provid = ProviderNav.of(context, listen: false);
              provid.changeScreen(index);
            },
          ),
        ),
      ),
    );
  }

  Container buildBord(int index) {
    return Container(
                    decoration: BoxDecoration(
                        color: index == this.index
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(arentir * 0.02))),
                    padding: EdgeInsets.only(bottom: arentir * 0.04),
                    margin: EdgeInsets.only(
                        left: arentir * 0.015,
                        right: arentir * 0.015,
                        top: arentir * 0.02),
                    child: buildDestination(index),
                  );
  }

  NavigationDestination buildDestination(int index) {
    final List items = ThemeP.of(context).icons.navigationIcons;
    return NavigationDestination(
        icon: items[index],
        selectedIcon: IconTheme(
            data: const IconThemeData(color: Colors.green),
            child: items[index]),
        label: Words.navigation[index]);
  }
}
