import 'package:flutter/material.dart';

import '../widgets/main_app_bar_content.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        //  boxShadow: (ThemeP.of(context).shadows.appBar),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppBar(
            leading: const SizedBox(),
            //  backgroundColor: Colors.red,
          ),
          MainAppBarContent()
        ],
      ),
    );
  }
}
