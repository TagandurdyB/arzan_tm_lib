import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';
import '../../../config/vars/constants.dart';
import '../widgets/ReadyInput/ready_input.dart';
import '../widgets/my_container.dart';


class CustomAppBar extends StatelessWidget {
  final double height;
  const CustomAppBar({
    this.height=0,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        //  boxShadow: (ThemeP.of(context).shadows.appBar),
      ),
      child: AppBar(
        elevation: height==0?0:null,
       // leading: const SizedBox(),
       title:  Container(
        margin: const EdgeInsets.only(top: 8),
              width: MySize.arentir * 0.77,
              height: 40,
              child: const ReadyInput(
                tag: Tags.mainSearch,
                borderRad: 4,
                shape: true,
              ),
            ),
            actions: [  
     MyContainer(
      color: Colors.transparent,
        margin: const EdgeInsets.only(right: 16,top: 8),
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
