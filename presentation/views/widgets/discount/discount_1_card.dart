import 'package:arzan_tm/config/system_info/my_size.dart';
import 'package:flutter/material.dart';

import '../../../../domanin/entities/discount_entity.dart';

class DiscountCardFirst extends StatelessWidget {
  final DiscountEntity obj;
  DiscountCardFirst({super.key, required this.obj});

  final double arentir = MySize.arentir;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Colors.orange,
      ),
    );
  }
}
