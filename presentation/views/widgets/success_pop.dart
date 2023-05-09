import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';
import 'my_pop_widget.dart';

class SuccessPop {
  static pop(BuildContext context, bool isSuccess) {
    MyPopUpp(
      width: MySize.arentir * 0.7,
      height: MySize.arentir * 0.45,
      borderRadius: 20,
      content:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        isSuccess
            ? Icon(
                Icons.check_circle_rounded,
                color: const Color(0xff0EC243),
                size: MySize.arentir * 0.15,
              )
            : Icon(
                Icons.error,
                color: Colors.orange,
                size: MySize.arentir * 0.15,
              ),
        SizedBox(height: MySize.arentir * 0.06),
        Text(isSuccess
            ? "Üstünlikli ýerine ýetirildi!"
            : "Bir mesele ýüze çykdy!")
      ]),
    ).pop(context);
  }
}
