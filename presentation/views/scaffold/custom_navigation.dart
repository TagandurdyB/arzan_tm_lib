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
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(arentir * 0.03)),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
               TextStyle(color: Colors.green,height: arentir*0.001),
            ),
            indicatorColor: Colors.transparent,
            // indicatorShape:
            //     const Border.symmetric(vertical: BorderSide()),
            iconTheme: const MaterialStatePropertyAll(
                IconThemeData(color: Colors.white)),
            backgroundColor: Colors.green),
        child: NavigationBar(
          height: arentir * 0.15,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          destinations: List.generate(
              items.length,
              (index) => Container(
                    decoration: BoxDecoration(
                        color: index == this.index
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(arentir * 0.02))),
                            padding: EdgeInsets.only(bottom: arentir*0.04),
                    margin: EdgeInsets.only(
                        left: arentir * 0.015,
                        right: arentir * 0.015,
                        top: arentir * 0.02),
                    child: NavigationDestination(
                        icon: items[index],
                        selectedIcon: IconTheme(
                            data: const IconThemeData(color: Colors.green),
                            child: items[index]),
                        label: Words.navigation[index]),
                  )),
          onDestinationSelected: (index) {
            setState(() => this.index = index);
            final provid = ProviderNavigation.of(context, listen: false);
            provid.changeScreen(index);
          },
        ),
      ),
    );
  }
}
