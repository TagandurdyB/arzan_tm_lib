// ignore_for_file: must_be_immutable

import '../../../config/routes/my_route.dart';
import '../../../config/services/my_size.dart';
import 'package:flutter/material.dart';

import 'check_group.dart';
import 'next_btn.dart';

class SortSheed extends StatelessWidget {
  SortSheed({super.key});

  final double arentir = MySize.arentir;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: arentir * 0.03, horizontal: arentir * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Sort",
            style: TextStyle(color: Color(0xff00C52B)),
          ),
          CheckGroups(
            startIndex: 1,
            items: [
              CheckItem(isActive: false, text: "Bal boýunça"),
              CheckItem(isActive: false, text: "Agza bolan wagty boýunça"),
              CheckItem(isActive: false, text: "Arzanladyş sany boýunça"),
              CheckItem(isActive: false, text: "Like sany boýunça"),
              CheckItem(isActive: false, text: "Goşan posty boýunça"),
              CheckItem(isActive: false, text: "Goşan storisy boýunça"),
            ],
          ),
          SizedBox(height: arentir * 0.03),
          NextBtn(
              func: () {
                Navigator.pop(context);
                Navigator.popAndPushNamed(context, Rout.tops);
              },
              text: "Ýatda sakla"),
          SizedBox(height: arentir * 0.1),

        ],
      ),
    );
  }

  Widget buildSwitch() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: arentir * 0.01),
      child: Row(children: [
        // CheckboxListTile(
        //   value: false,
        //   onChanged: ((value) => () {}),
        // ),
        // Checkbox(value: true, onChanged: (val){}),
        GestureDetector(
            onTap: () {},
            child:
                const Icon(Icons.check_box_outlined, color: Color(0xff00C52B))),
        const Text("Bal boýunça")
      ]),
    );
  }
}
