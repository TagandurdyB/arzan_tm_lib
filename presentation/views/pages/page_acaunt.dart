import 'package:flutter/material.dart';

import '../screens/acaunts/guest.dart';
import '../screens/acaunts/pod.dart';
import '../screens/acaunts/resmi.dart';
import '../screens/acaunts/resmi_official.dart';
import '/presentation/views/scaffold/no_app_bar_scaffold.dart';

class AcauntPage extends StatelessWidget {
  const AcauntPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldNo(
        body: PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        GuestScreen(),
        RemiScreen(),
        ResmiOfficialScreen(),
        PodScreen(),
      ],
    ));
  }
}
