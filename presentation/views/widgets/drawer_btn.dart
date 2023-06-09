import 'package:flutter/material.dart';
import 'my_container.dart';

class DrawerBtn extends StatelessWidget {
  final BuildContext context;
  final IconData iconD;
  final String name;
  final String? route;
  final int? num;
  final Function? onTap;
  final Color? colorElements;
  final Color? iconBgColor;
  final Widget? icon;
  final bool visible;
  final bool isRestart;
  const DrawerBtn(
    this.iconD,
    this.name,
    this.context, {
    this.isRestart = false,
    this.visible = true,
    this.icon,
    this.colorElements,
    this.iconBgColor,
    this.route,
    this.onTap,
    this.num,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? activePage = ModalRoute.of(context)!.settings.name;
    return Visibility(
      visible: visible,
      child: MyContainer(
        onTap: () {
          if (onTap != null) onTap!();
          if (route != null) {
            if (isRestart) {
              Navigator.pushNamedAndRemoveUntil(
                  context, route!, (route) => route.isFirst);
            } else if (route != activePage) {
              debugPrint("route:=$route");
              Navigator.pushNamed(context, route!);
            }
          } else {
            Navigator.pop(this.context);
          }
        },
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        width: double.infinity,
        //color: Colors.red,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          icon ??
              Icon(
                iconD,
                color: colorElements ??
                    Theme.of(context).textTheme.bodyMedium!.color,
              ),
          const SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(
                color: colorElements ??
                    Theme.of(context).textTheme.bodyMedium!.color),
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
      ),
    );
  }
}
