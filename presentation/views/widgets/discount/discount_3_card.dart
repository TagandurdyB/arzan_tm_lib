import 'package:flutter/material.dart';

import '../../../../config/system_info/my_size.dart';
import '../../../../domanin/entities/discount_entity.dart';

class DiscountCardThird extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardThird({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
