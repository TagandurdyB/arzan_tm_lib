import 'package:flutter/material.dart';

import '../../../config/routes/my_route.dart';
import '../../../config/system_info/my_size.dart';
import '../widgets/my_container.dart';

class CustomAppBar extends StatelessWidget {
  final double height;
  final double? elevation;
  const CustomAppBar({this.elevation, this.height = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        //  boxShadow: (ThemeP.of(context).shadows.appBar),
      ),
      child: AppBar(
        elevation: elevation,
        // leading: const SizedBox(),
        title: Hero(
          tag: "tag-1",
          child: Container(
            color: Colors.red,
            margin: const EdgeInsets.all(8),
            child: ListTile(
                onTap: () => Navigator.pushNamed(context, Rout.search),
                leading: const Text(
                  "Gözle...",
                  style: TextStyle(color: Color(0xffCBCBCB), fontSize: 17),
                ),
                trailing: const Icon(
                  Icons.search,
                  color: Color(0xffCBCBCB),
                )),
          ),
          // child: MyContainer(
          // //  onTap: () => Navigator.pushNamed(context, Rout.search),
          //   //color: Colors.red,
          //   borderColor: const Color(0xffC4C4C4),
          //   shape: 5,
          //   margin: const EdgeInsets.symmetric(horizontal: 8),
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   width: MySize.arentir * 0.77,
          //   height: 40,
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: const [
          //         Text(
          //           "Gözle...",
          //           style: TextStyle(color: Color(0xffCBCBCB), fontSize: 17),
          //         ),
          //         Icon(
          //           Icons.search,
          //           color: Color(0xffCBCBCB),
          //         )
          //       ]),
          //   // child: const ReadyInput(
          //   //   tag: Tags.mainSearch,
          //   //   borderRad: 4,
          //   //   shape: true,
          //   // ),
          // ),
        ),
        actions: [
          MyContainer(
              color: Colors.transparent,
              margin: const EdgeInsets.only(right: 16, top: 8),
              onTap: () {},
              child: Icon(
                color: Theme.of(context).appBarTheme.iconTheme!.color,
                Icons.notifications_none,
                size: MySize.arentir * 0.11,
              ))
        ],
        //  backgroundColor: Colors.red,
      ),
    );
  }
}
