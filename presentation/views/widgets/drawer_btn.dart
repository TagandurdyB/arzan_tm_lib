import 'package:arzan_tm/presentation/providers/data/data_provider_theme.dart';
import 'package:flutter/material.dart';

import '../../../domanin/entities/theme_entity.dart';
import 'my_container.dart';

class DrawerBtn extends StatelessWidget {
  final BuildContext context;
  final IconData iconD;
  final String name;
  final String? route;
  final int? num;
  final Function? onTap;
  const DrawerBtn(
    this.iconD,
    this.name,
    this.context, {
    this.route,
    this.onTap,
    this.num,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? activePage = ModalRoute.of(context)!.settings.name;
    return MyContainer(
      onTap: () {
        if (onTap != null) onTap!();
        if (route != null && route != activePage) {
          print("route:=$route");
          final themeProvider = DataThemeProvider.of(context,listen: false);
          themeProvider
              .save(ThemeEntity(isSystem: true, isLight: true, isDark: false));
          
          Navigator.pushNamed(context, route!);
        } else {
          Navigator.pop(this.context);
        }
      },
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.infinity,
      //color: Colors.red,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          iconD,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        const SizedBox(width: 10),
        Text(
          name,
          style:
              TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
        ),
        const Expanded(child: SizedBox()),
        Visibility(
          visible: num != null,
          child: MyContainer(
            alignment: Alignment.center,
            width: 50,
            height: 30,
            shape: 5,
            color: const Color(0xffF3FBF4),
            child: Text(
              "$num",
              style: const TextStyle(
                  color: Color(0xff367342),
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
        ),
      ]),
    );
  }
}
