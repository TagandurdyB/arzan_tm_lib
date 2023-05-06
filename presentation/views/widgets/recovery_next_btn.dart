import 'package:flutter/material.dart';

import '../../../config/system_info/keyboard.dart';
import '../../../config/system_info/my_size.dart';
import 'my_container.dart';

class RecovertNextBtn extends StatelessWidget {
  final Function func;
  final String text;
  const RecovertNextBtn({required this.func, this.text = "Indiki", super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: MySize.arentir * 0.1,
      shape: MySize.arentir * 0.02,
      onTap: () {
        Keyboard.close(context);
        func();
      },
      color: const Color(0xff0EC243),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: MySize.arentir * 0.04),
      ),
    );
  }
}
