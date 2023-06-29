// ignore_for_file: must_be_immutable

import 'package:fluttertoast/fluttertoast.dart';

import '../../../config/routes/my_route.dart';
import '/presentation/providers/data/provider_acaunt.dart';

import '../../../config/services/my_size.dart';
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

  @override
  Widget build(BuildContext context) {
    // MyOrientation.enableSystemUI;
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: ProviderNav.of(context).selectScreen, //_selectIndex,
        onTap: (index) {
          final provid = ProviderNav.of(context, listen: false);
          final providA = AcauntP.of(context, listen: false);
          if (!providA.isSing && (index == 2 || index == 3)) {
            provid.changeScreen(4);
          } else if (index == 3) {
            //Navigator.pushNamed(context, Rout.buyCoin);
            Fluttertoast.showToast(
                msg: "Under development!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          } else if (index == 1) {
            Navigator.pushNamed(context, Rout.discounts);
          } else {
            provid.changeScreen(index);
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
