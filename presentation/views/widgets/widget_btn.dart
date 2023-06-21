import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '../../providers/view/provider_discaunts.dart';
import '../../providers/view/provider_video.dart';

class WidgetBtn extends StatelessWidget {
  final int limit;
  const WidgetBtn({this.limit = 2, super.key});

  @override
  Widget build(BuildContext context) {
    // final int column = limit == 2
    //     ? DiscountProvid.of(context).cloumnCount
    //     : VideoP.of(context).cloumnCount;
    // final discountP=DiscountProvid.of(context);
    // final videoP=VideoP.of(context);
    final hiveP = HiveP.of(context);
    return GestureDetector(
      onTap: () {
        final hiveDo = HiveP.of(context, listen: false);
        if (limit == 2) {
          // final discountDo = DiscountProvid.of(context, listen: false);
          // discountDo.tongleColumn;
          final int cloumn = hiveDo.readInt(Tags.hiveTypeOfYou) ?? 2;
          hiveDo.saveInt(tongle(cloumn), Tags.hiveTypeOfYou);
        } else {
          final int cloumn = hiveDo.readInt(Tags.hiveVideoType) ?? 2;
          hiveDo.saveInt(tongle(cloumn), Tags.hiveVideoType);
        }
      },
      child: Icon(buildColumnIcon(limit == 2
          ? hiveP.readInt(Tags.hiveTypeOfYou)
          : hiveP.readInt(Tags.hiveVideoType))),
    );
  }

  int tongle(int cloumn) {
    if (cloumn < limit) {
      cloumn++;
    } else {
      cloumn = 1;
    }
    return cloumn;
  }

  IconData buildColumnIcon(int? columnCount) {
    columnCount ??= 2;
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
