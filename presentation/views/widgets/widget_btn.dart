import 'package:flutter/material.dart';

import '../../providers/view/provider_discaunts.dart';

class WidgetBtn extends StatelessWidget {
  const WidgetBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DiscountProvid.of(context, listen: false).tongleColumn,
      child: Icon(buildColumnIcon(DiscountProvid.of(context).cloumnCount)),
    );
  }

  IconData buildColumnIcon(int columnCount) {
    switch (columnCount) {
      case 1:
        return Icons.list;
      case 2:
        return Icons.widgets_outlined;
      case 3:
        return Icons.apps_sharp;

      default:
        return Icons.list;
    }
  }
}
