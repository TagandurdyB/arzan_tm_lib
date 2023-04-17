import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class FormErrorMessage extends StatelessWidget {
  final bool visible;
  final String message;
  const FormErrorMessage({
    this.message = "",
    this.visible = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                message,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: MySize.arentir * 0.043,
                ),
              ),
            ],
          )),
    );
  }
}
