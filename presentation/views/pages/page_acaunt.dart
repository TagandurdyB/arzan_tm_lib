import 'package:flutter/material.dart';

import '../../../config/vars/constants.dart';
import '../../providers/data/hive_provider.dart';
import '../screens/acaunts/guest.dart';
import '../screens/acaunts/pod.dart';
import '../screens/acaunts/resmi.dart';
import '../screens/acaunts/resmi_official.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';

class AcauntPage extends StatelessWidget {
  AcauntPage({super.key});

  final List<Widget> _acaunts = [
    PodScreen(),
    GuestScreen(),
    RemiScreen(),
    ResmiOfficialScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(body: _acaunts[acauntIndex(context)]);
  }

  int acauntIndex(BuildContext context) {
    final String role = HiveP.of(context).readStr(Tags.hiveRole)!;
    print("user:=$role");
    if (role == "user") {
      return 0;
    } else if (role == "offical") {
      return 1;
    } else {
      return 2;
    }
  }
}
