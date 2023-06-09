import 'package:flutter/material.dart';

import '../../../config/services/keyboard.dart';
import '../../../config/services/my_size.dart';
import 'my_container.dart';

class NextBtn extends StatelessWidget {
  final Function func;
  final String text;
  final Widget? child;
  final Color? borderColor;
  final Color? bgColor;

  const NextBtn({
    required this.func,
    this.text = "Indiki",
    super.key,
    this.child,
    this.borderColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: MySize.arentir * 0.1,
      shape: MySize.arentir * 0.02,
      onTap: () {
        Keyboard.close(context);
        func();
      },
      borderColor: borderColor ?? Colors.transparent,
      color: bgColor ?? const Color(0xff0EC243),
      alignment: Alignment.center,
      child: child ??
          Text(
            text,
            style:
                TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.04),
          ),
    );
  }
}
