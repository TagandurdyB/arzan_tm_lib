import 'package:flutter/material.dart';

import '../../../config/system_info/my_size.dart';

class RecoveryLabel extends StatelessWidget {
  final String text;
  final Widget content;
  const RecoveryLabel({required this.content, this.text = "", super.key});

  @override
  Widget build(BuildContext context) {
    final double arentir = MySize.arentir;
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style:
                  TextStyle(fontSize: arentir * 0.04, height: arentir * 0.004),
            )),
        const SizedBox(height: 20),
        content,
      ],
    );
  }
}
